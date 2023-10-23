// This uses non-packed structs, which aren't supported in Yosys without
// Synlig.

typedef enum bit[1:0] {STATE0, STATE1, STATE2, STATE3} state_t;
typedef struct {
    state_t state;
    int counter;
} info;

module fsm(
    input clk,
    input rstn,
    output info out
);
    state_t next;

    always_comb
        case(out.state)
            STATE0:
                next = STATE1;
            STATE1:
                next = STATE2;
            STATE2:
                next = STATE3;
            STATE3:
                next = STATE3;
        endcase

    always_ff @ (posedge clk or negedge rstn)
        if (!rstn) begin
            out.state <= STATE0;
            out.counter <= 0;
        end else begin
            out.state <= next;
            out.counter <= out.counter + 1;
        end
endmodule