
module latch_good(input clk, input a, input en , output b);

reg v;

always_latch
    if (en)
        v <= a;

assign b = v;

endmodule


module latch_bad(input clk, input a, input en , output b);

reg v;

always @ *
    if (en)
        v <= a;

assign b = v;

endmodule