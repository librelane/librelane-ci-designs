module flipflop (
    input  logic clk_i,

    input  logic data_i,
    output logic data_o
);

    always_ff @(posedge clk_i) begin
        data_o <= data_i;
    end

endmodule
