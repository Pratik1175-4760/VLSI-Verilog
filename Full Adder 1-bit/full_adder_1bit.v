`timescale 1ns / 1ps

module full_adder_1bit(a,b,c,carry,sum);
input a,b,c;
output sum, carry;

assign sum = a^b^c;
assign carry = (a&b)|(a&c)|(b&c);
endmodule
