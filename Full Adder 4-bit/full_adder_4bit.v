`timescale 1ns / 1ps

module full_adder_4bit(ain,bin,cin, sumout,carryout);
input [3:0]ain;
input [3:0]bin;
input cin;
output [3:0]sumout;
output carryout;
wire carry1,carry2,carry3;

full_adder f1(.a(ain[0]),.b(bin[0]),.cin(cin),.sum(sumout[0]),.carry(carry1));
full_adder f2(.a(ain[1]),.b(bin[1]),.cin(carry1),.sum(sumout[1]),.carry(carry2));
full_adder f3(.a(ain[2]),.b(bin[2]),.cin(carry2),.sum(sumout[2]),.carry(carry3));
full_adder f4(.a(ain[3]),.b(bin[3]),.cin(carry3),.sum(sumout[3]),.carry(carryout));

endmodule

module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire sum1,carry1,carry2;
half_adder h1(.a(a),.b(b),.sum(sum1),.carry(carry1));
half_adder h2(.a(sum1),.b(cin),.sum(sum),.carry(carry2));

assign carry = carry1 | carry2;

endmodule

module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
assign sum = a^b;
assign carry = a&b;
endmodule
