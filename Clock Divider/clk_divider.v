`timescale 1ns / 1ps

module clk_divider(reset,clk,out_clk);
input reset,clk;
output reg out_clk;
reg[1:0] clk_count;

always @(posedge clk)
begin
    if(reset)
    begin
        out_clk <= 0;
        clk_count <= 2'b0;
    end
    else
    begin
        clk_count <= clk_count+1;
        out_clk <= clk_count[1];
    end
end
endmodule
