`timescale 1ns / 1ps
module no_ones (
    input [15:0] in,
    input clk,
    input reset,
    output reg [4:0] no_one  // 5-bit to handle 0-16
);

reg [4:0] i;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        no_one <= 0;
        i <= 0;
    end else begin
        if (i < 16) begin
            no_one <= no_one + in[i];
            i <= i + 1;
        end
    end
end

endmodule
