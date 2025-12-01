module hold_violations_1 (
    input  clk_i,
    input  rst_ni,

    input  shift_i,
    output shift_o
);

    localparam BITS = 32;
    logic [BITS-1:0] register;
    
    always_ff @(posedge clk_i) begin
        register[0] <= shift_i;
        register[BITS-1:1] <= register[BITS-2:0];
    end
    
    assign shift_o = register[BITS-1];

endmodule
