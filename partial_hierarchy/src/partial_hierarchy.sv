module buffer (
    input  in,
    output out
);
    assign out = in;
endmodule

module inverter #(
    parameter BITS=1
)(
    input  [BITS-1:0] in,
    output [BITS-1:0] out
);
    assign out = ~in;
endmodule

(* keep_hierarchy *)
module counter #(
    parameter BITS=8
)(
    input  clk_i,
    input  rst_ni,
    
    output [BITS-1:0] value_o
);
    logic [BITS-1:0] count;

    always_ff @(posedge clk_i) begin
        if (!rst_ni) begin
            count <= '0;
        end else begin
            count <= count + 1;
        end
    end
    
    logic [BITS-1:0] inverted;
    
    inverter #(
        .BITS   (8)
    ) inv_0 (
        .in     (count),
        .out    (inverted)
    );

    inverter #(
        .BITS   (8)
    ) inv_1 (
        .in     (inverted),
        .out    (value_o)
    );

endmodule

module shift_reg #(
    parameter BITS=8
)(
    input  clk_i,
    input  rst_ni,
    
    input  shift_i,
    output shift_o
);
    logic [BITS-1:0] register;

    always_ff @(posedge clk_i) begin
        if (!rst_ni) begin
            register <= '0;
        end else begin
            register[0] <= shift_i;
            register[BITS-1:1] <= register[BITS-2:0];
        end
    end
    
    buffer my_buf (
        .in     (register[BITS-1]),
        .out    (shift_o)
    );

endmodule


module partial_hierarchy (
    input  clk_i,
    input  rst_ni,

    output [7:0] value_o,
    
    input  shift_i,
    output shift_o
);

    logic shift_0, shift_1, shift_2;

    shift_reg my_shift_reg_0 (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .shift_i    (shift_i),
        .shift_o    (shift_0)
    );
    
    shift_reg my_shift_reg_1 (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .shift_i    (shift_0),
        .shift_o    (shift_1)
    );

    shift_reg my_shift_reg_2 (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),

        .shift_i    (shift_1),
        .shift_o    (shift_2)
    );

    buffer shift_buf (
        .in     (shift_2),
        .out    (shift_o)
    );
    
    counter my_counter (
        .clk_i      (clk_i),
        .rst_ni     (rst_ni),
        
        .value_o    (value_o)
    );

endmodule
