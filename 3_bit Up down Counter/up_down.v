`timescale 1ns / 1ps

module up_down(updown , clk,reset,bin_count);
input updown, clk, reset;
output reg[2:0] bin_count;

always @(posedge clk)
begin
    if(reset)
    bin_count<= 3'b0;
    else
    begin
        if(updown)
        bin_count <= bin_count - 1;
        else
        bin_count <= bin_count +1;
    end
end

endmodule
