`timescale 1ns / 1ps

module d_ff(in,
            q,
            qb,
            clk,
            reset
);
input in,clk,reset;
output reg q;
output qb;
assign qb = ~q;

always @(posedge clk) begin
    if(reset)
    q <= 1'b0;
    else
    q <= in;
end
endmodule
