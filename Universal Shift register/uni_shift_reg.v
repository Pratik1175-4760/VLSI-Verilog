`timescale 1ns / 1ps

module uni_shift_reg #(parameter N = 8) (
    input [N-1:0] data_in,
    input clk,
    input reset,
    input [1:0] control,
    output reg [N-1:0] data_out
);

always @(posedge clk) begin
    if (reset)
        data_out <= 0;
    else begin
        case (control)
            2'b00: data_out <= data_out;        // Hold
            2'b01: data_out <= data_out << 1;   // Shift left
            2'b10: data_out <= data_out >> 1;   // Shift right
            2'b11: data_out <= data_in;         // Parallel load
            default: data_out <= data_out;      // Default hold
        endcase
    end
end

endmodule
