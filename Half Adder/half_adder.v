`timescale 1ns / 1ps

module half_adder(i_a,i_b,sum,carry);
input i_a,i_b;
output sum,carry;
assign sum = i_a^i_b;
assign carry = i_a&i_b;

endmodule
