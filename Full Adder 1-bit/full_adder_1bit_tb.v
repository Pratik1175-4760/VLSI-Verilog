`timescale 1ns / 1ps

module full_adder_1bit_tb();
reg a,b,c;
wire sum,carry;
reg A,B,C,new_carry,new_sum;

full_adder_1bit DUT(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));

task initialize;
begin
A=$random;
B=$random;
C=$random;
#5;
a=A;
b=B;
c=C;
#5
new_sum = a^b^c;
new_carry = (a&b)|(a&c)|(b&c);
end
endtask

initial begin
repeat(10)
begin
initialize();
if((new_carry==carry)&&(new_sum==sum))
$display ("a = %b, b = %b, cin = %b, sum = %b, carry = %b, new_sum = %b, new_carry = %b, Test case Passed", a, b, c, sum, carry, new_sum, new_carry);
else
$display("a = %b, b = %b, cin = %b, sum = %b, carry = %b, new_sum = %b, new_carry = %b, Test case Failed", a, b, c, sum, carry, new_sum, new_carry);      //displaying inputs, outputs and result
      
end
$finish;
end
endmodule
