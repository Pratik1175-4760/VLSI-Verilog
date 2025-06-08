`timescale 1ns / 1ps

// This testbench tests the half_adder module by generating random inputs multiple times.
// It calculates the expected sum and carry inside the testbench using simple addition as a reference model.
// Then it compares the outputs from the half_adder (DUT) with these expected values to check correctness.
// The testbench prints "Test case Passed" if both outputs match, otherwise it prints "Test case Failed".
// This automatic comparison helps verify that the half_adder works correctly for various input cases without manual checking.
// It is an another way for checking.


module half_adder_tb;
reg A,B;
reg a,b;
wire sum,carry;
reg new_sum,new_carry;

half_adder DUT(.i_a(a),.i_b(b),.sum(sum),.carry(carry));

task initialize;
begin
A = $random;   //Generates random values
B = $random;
a= A;  // Assigns
b= B;
#5;
{new_carry,new_sum}= A+B; // simple way to perform sum and carry values

#5;
end
endtask

initial begin
repeat(5)
begin
initialize();
if(new_sum==sum && new_carry==carry)
$display("a = %b, b = %b, sum = %b, carry = %b, new_sum = %b, new_carry = %b, Test case Passed", a, b, sum, carry, new_sum, new_carry);
else
$display("a = %b, b = %b, sum = %b, carry = %b, new_sum = %b, new_carry = %b, Test case Failed", a, b, sum, carry, new_sum, new_carry);
end
end

endmodule
/*
 A  B  A + B  Binary  new_carry  new_sum
---------------------------------------
 0  0    0     00         0         0
 0  1    1     01         0         1
 1  0    1     01         0         1
 1  1    2     10         1         0
*/


/*
Easier test bench

module ha_1bit_tb();

reg A, B;                // 1-bit inputs
wire sum, carry;         // 1-bit outputs

ha_1bit dut (.A(A), .B(B), .sum(sum), .carry(carry));  // Instantiate 1-bit half adder

initial begin
  $monitor("Time %0t, A=%b, B=%b => sum=%b | carry=%b", $time, A, B, sum, carry);

  A = 0; B = 0; #10;
  A = 0; B = 1; #10;
  A = 1; B = 0; #10;
  A = 1; B = 1; #10;
  $finish;
end

endmodule

*/