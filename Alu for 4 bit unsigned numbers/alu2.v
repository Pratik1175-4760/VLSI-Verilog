`timescale 1ns / 1ps

module alu (
    input [3:0] a, b,
    input [1:0] select,
    output reg [3:0] out,
    output reg zero, carry, sign, parity, overflow
);

reg [4:0] temp_result;  // 5-bit to hold result for carry detection

always @(*) begin
    carry = 0;
    overflow = 0;

    case (select)
        2'b00: begin // Addition
            temp_result = a + b;
            out = temp_result[3:0];
            carry = temp_result[4];
        end

        2'b01: begin // Subtraction
            temp_result = a - b;
            out = temp_result[3:0];
            carry = (a < b); // borrow acts as carry in unsigned
        end

        2'b10: begin // Multiplication
            temp_result = a * b;
            out = temp_result[3:0];
            carry = |temp_result[7:4]; // If high bits are set, carry = 1
        end

        2'b11: begin // Division
            out = (b != 0) ? a / b : 4'b0000;
            carry = 0; // No carry in division
        end
    endcase

    zero     = (out == 4'b0000);
    sign     = out[3];          // MSB for unsigned is still valid if needed
    parity   = ~^out;           // Even parity
    overflow = 0;               // Not meaningful for unsigned unless we check MSB flips
end

endmodule
