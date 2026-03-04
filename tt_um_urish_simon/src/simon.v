// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: © 2023-2024 Uri Shaked <uri@wokwi.com>

/*
 * Simon Says game in Verilog. Wokwi Simulation project:
 * https://wokwi.com/projects/408757730664700929
 */

`default_nettype none

module simon (
    input wire clk,
    input wire rst,
    input wire [5:0] ticks_per_milli,
    input wire [3:0] btn,
    input wire segments_invert,
    output reg [3:0] led,
    output wire sound,
    output wire [6:0] segments,
    output wire [1:0] segment_digits
);

  localparam MAX_GAME_LEN = 100;  // Practically, 127, but we only have two digit score display
  localparam GAME_LEN_BITS = $clog2(MAX_GAME_LEN);

  wire [9:0] GAME_TONES[3:0];
  assign GAME_TONES[0] = 196;  // G3
  assign GAME_TONES[1] = 262;  // C4
  assign GAME_TONES[2] = 330;  // E4
  assign GAME_TONES[3] = 784;  // G5

  wire [9:0] SUCCESS_TONES[6:0];
  assign SUCCESS_TONES[0] = 330;  // E4
  assign SUCCESS_TONES[1] = 392;  // G4
  assign SUCCESS_TONES[2] = 659;  // E5
  assign SUCCESS_TONES[3] = 523;  // C5
  assign SUCCESS_TONES[4] = 587;  // D5
  assign SUCCESS_TONES[5] = 784;  // G5
  assign SUCCESS_TONES[6] = 0;  // silence

  wire [9:0] GAMEOVER_TONES[3:0];
  assign GAMEOVER_TONES[0] = 622;  // D#5
  assign GAMEOVER_TONES[1] = 587;  // D5
  assign GAMEOVER_TONES[2] = 554;  // C#5
  assign GAMEOVER_TONES[3] = 523;  // C5

  localparam StatePowerOn = 0;
  localparam StateInit = 1;
  localparam StatePlay = 2;
  localparam StatePlayWait = 3;
  localparam StateUserWait = 4;
  localparam StateWaitButtonRelease = 5;
  localparam StateUserInput = 6;
  localparam StateNextLevel = 7;
  localparam StateGameOver = 8;

  wire [31:0] lfsr_value;
  reg [31:0] lfsr_capture;
  reg lfsr_rewind;
  reg lfsr_stopped;
  reg [1:0] lfsr_cycles;

  reg [GAME_LEN_BITS - 1:0] seq_counter;
  reg [GAME_LEN_BITS - 1:0] seq_length;
  wire [1:0] seq = lfsr_value[1:0];
  reg [3:0] state;

  reg [5:0] tick_counter;
  reg [9:0] millis_counter;
  reg [2:0] tone_sequence_counter;
  reg [9:0] sound_freq;

  reg [1:0] user_input;
  reg [3:0] prev_btn;
  reg button_released;
  reg score_inc;
  reg score_rst;
  reg score_ena;

  sound_gen sound_gen_inst (
      .clk(clk),
      .rst(rst),
      .ticks_per_milli(ticks_per_milli),
      .freq(sound_freq),
      .sound(sound)
  );

  score score_inst (
      .clk(clk),
      .rst(rst | score_rst),
      .ena(score_ena),
      .inc(score_inc),
      .invert(segments_invert),
      .segments(segments),
      .digits(segment_digits)
  );

  galois_lfsr lfsr_inst (
      .clk(clk),
      .rst(rst),
      .enable(~lfsr_stopped || lfsr_cycles > 0),
      .load_enable(lfsr_rewind),
      .load_value(lfsr_capture),
      .lfsr_out(lfsr_value)
  );

  reg [63:0] state_name;  // For debugging purposes
  wire _unused = &{state_name};  // Prevent unused variable warning
  always @(*) begin
    case (state)
      StatePowerOn: state_name = "PowerOn";
      StateInit: state_name = "Init";
      StatePlay: state_name = "Play";
      StatePlayWait: state_name = "PlayWait";
      StateUserWait: state_name = "UserWait";
      StateWaitButtonRelease: state_name = "WaitBtnR";
      StateUserInput: state_name = "UserInpt";
      StateNextLevel: state_name = "NextLvl";
      StateGameOver: state_name = "GameOver";
      default: state_name = "Unknown";
    endcase
  end

  always @(posedge clk) begin
    if (rst) begin
      seq_length <= 0;
      seq_counter <= 0;
      tick_counter <= 0;
      millis_counter <= 0;
      tone_sequence_counter <= 0;
      sound_freq <= 0;
      state <= StatePowerOn;
      led <= 4'b0000;
      user_input <= 0;
      prev_btn <= 0;
      button_released <= 0;
      score_inc <= 0;
      score_rst <= 0;
      score_ena <= 0;
      lfsr_rewind <= 0;
      lfsr_capture <= 0;
      lfsr_stopped <= 0;
      lfsr_cycles <= 0;
    end else begin
      tick_counter <= tick_counter + 1;
      score_inc <= 0;
      score_rst <= 0;
      lfsr_rewind <= 0;

      if (lfsr_cycles > 0) begin
        lfsr_cycles <= lfsr_cycles - 1;
      end

      if (tick_counter == ticks_per_milli - 1) begin
        tick_counter   <= 0;
        millis_counter <= millis_counter + 1;
      end

      case (state)
        StatePowerOn: begin
          led <= 4'b1111;
          led[millis_counter[9:8]] <= 1'b0;
          // Wait until the user presses some button - the delay will seed the LFSR
          if (btn != 0) begin
            led <= 4'b0000;
            millis_counter <= 0;
            score_ena <= 1;
            lfsr_stopped <= 1;
            state <= StateInit;
          end
        end
        StateInit: begin
          seq_length <= 1;
          seq_counter <= 0;
          tone_sequence_counter <= 0;
          if (millis_counter == 500) begin
            score_rst <= 1;
            lfsr_capture <= lfsr_value;
            state <= StatePlay;
          end
        end
        StatePlay: begin
          led <= 0;
          led[seq] <= 1'b1;
          sound_freq <= GAME_TONES[seq];
          millis_counter <= 0;
          state <= StatePlayWait;
          lfsr_cycles <= 2;  // Advance LFSR
        end
        StatePlayWait: begin
          if (millis_counter == 300) begin
            led <= 0;
            sound_freq <= 0;
          end
          if (millis_counter == 400) begin
            if (seq_counter + 1 == seq_length) begin
              state <= StateUserWait;
              lfsr_rewind <= 1;  // Rewind LFSR to the captured value
              millis_counter <= 0;
              seq_counter <= 0;
            end else begin
              seq_counter <= seq_counter + 1;
              state <= StatePlay;
            end
          end
        end
        StateUserWait: begin
          led <= 0;
          millis_counter <= 0;
          if (btn != 0) begin
            state <= StateUserInput;
            prev_btn <= btn;
            button_released <= 0;
            case (btn)
              4'b0001: user_input <= 0;
              4'b0010: user_input <= 1;
              4'b0100: user_input <= 2;
              4'b1000: user_input <= 3;
              default: state <= StateUserWait;
            endcase
          end
        end
        StateUserInput: begin
          led <= 0;
          led[user_input] <= 1'b1;
          sound_freq <= GAME_TONES[user_input];
          if (millis_counter > 50 && btn != prev_btn) begin
            button_released <= 1;
          end
          if (millis_counter == 300) begin
            sound_freq <= 0;
            if (user_input == seq) begin
              if (seq_counter + 1 == seq_length) begin
                millis_counter <= 0;
                seq_length <= seq_length + 1;
                lfsr_rewind <= 1;  // Rewind LFSR to the captured value
                state <= StateNextLevel;
                score_inc <= 1;
              end else begin
                lfsr_cycles <= 2;  // Advance LFSR
                seq_counter <= seq_counter + 1;
                state <= button_released && btn == 0 ? StateUserWait : StateWaitButtonRelease;
              end
            end else begin
              millis_counter <= 0;
              state <= StateGameOver;
              lfsr_stopped <= 0;
            end
          end
        end
        StateWaitButtonRelease: begin
          millis_counter <= 0;
          if (btn != prev_btn) begin
            millis_counter <= millis_counter + 1;  // debounce
            if (millis_counter == 10) begin
              state <= StateUserWait;
            end
          end
        end
        StateNextLevel: begin
          led <= 0;
          if (millis_counter == 150) begin
            if (tone_sequence_counter < 7) begin
              sound_freq <= SUCCESS_TONES[tone_sequence_counter];
            end else begin
              sound_freq <= 0;
              tone_sequence_counter <= 0;
              seq_counter <= 0;
              state <= StatePlay;
            end
            tone_sequence_counter <= tone_sequence_counter + 1;
            millis_counter <= 0;
          end
        end
        StateGameOver: begin
          led <= millis_counter[7] ? 4'b1111 : 4'b0000;

          if (tone_sequence_counter == 4) begin
            // trembling sound
            sound_freq <= GAMEOVER_TONES[3] - 16 + {5'b0, millis_counter[4:0]};
            if (millis_counter == 1000) begin
              tone_sequence_counter <= 7;
              sound_freq <= 0;
            end
          end else if (millis_counter == 300) begin
            if (tone_sequence_counter < 4) begin
              sound_freq <= GAMEOVER_TONES[tone_sequence_counter[1:0]];
              tone_sequence_counter <= tone_sequence_counter + 1;
            end
            millis_counter <= 0;
          end

          if ((btn != 0) && (tone_sequence_counter == 7)) begin
            led <= 4'b0000;
            sound_freq <= 0;
            millis_counter <= 0;
            lfsr_stopped <= 1;
            state <= StateInit;
          end
        end
      endcase
    end
  end

endmodule
