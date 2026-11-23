module multiplier(
    input [32-1:0] a,
    input [32-1:0] b,
    output [32-1:0] c
);

assign c = a * b;

endmodule
