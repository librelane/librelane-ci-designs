module top(
    input clk,
    input rstn,
    input data_in,
    input reset_value,
    output data_out0,
    output data_out1
);
    reg data_out0_store;
    reg data_out1_store;
    
    always @ (posedge clk or negedge rstn)
        if (!rstn) begin
            data_out0_store <= reset_value;
            data_out1_store <= ~reset_value;
        end else begin
            data_out0_store <= data_in;
            data_out1_store <= ~data_in;
        end
            
    assign data_out0 = data_out0_store;
    assign data_out1 = data_out1_store;
    
endmodule
