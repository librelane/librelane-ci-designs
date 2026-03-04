module sound_gen (
    input wire clk,
    input wire rst,
    input wire [5:0] ticks_per_milli,
    input wire [9:0] freq,
    output reg sound
);
  reg  [15:0] tick_counter;
  wire [15:0] ticks_per_second = ticks_per_milli * 1000;
  wire [15:0] freq32 = {6'b0, freq};

  always @(posedge clk) begin
    if (rst) begin
      tick_counter <= 0;
      sound <= 0;
    end else if (freq == 0) begin
      sound <= 0;
    end else begin
      tick_counter <= tick_counter + freq32;
      if (tick_counter >= (ticks_per_second >> 1)) begin
        sound <= !sound;
        tick_counter <= tick_counter + freq32 - (ticks_per_second >> 1);
      end
    end
  end

endmodule

