`timescale 1ns / 1ps

module lfsr (
    input reset,
    input clk,
    output reg [3:0] data_out
);

wire feedback;

// Use taps at bit positions 3 and 2 for maximal length: x⁴ + x³ + 1
assign feedback = data_out[3] ^ data_out[2];

always @(posedge clk) begin
    if (reset || data_out == 4'b0000)
        data_out <= 4'b0001;  // Non-zero seed
    else
        data_out <= {data_out[2:0], feedback};
end

endmodule
