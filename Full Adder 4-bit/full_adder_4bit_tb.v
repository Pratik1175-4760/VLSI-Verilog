`timescale 1ns / 1ps

module full_adder_4bit_tb();
reg [3:0]a,b;
reg cin;
wire [3:0]sumout;
wire carryout;
reg newcarry;
reg [3:0]newsum;
full_adder_4bit dut(.ain(a),.bin(b),.cin(cin),.sumout(sumout),.carryout(carryout));

task initialize;
begin

    a=$random;
    b=$random;
    cin=$random;
    {newcarry,newsum}= a+b+cin;
    #5;
    
end
endtask

initial begin 
repeat(100) begin
    initialize();
    if((newcarry==carryout)&&(newsum==sumout))
    $display(" a= %b | b= %b | cin=%b | sum = %b | carry = %b | Paased",a,b,cin);
    else
    $display(" a= %b | b= %b | cin=%b | sum = %b | carry = %b | Failed",a,b,cin);
end
end
endmodule
