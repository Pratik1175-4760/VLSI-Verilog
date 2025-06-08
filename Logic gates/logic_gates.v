`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2025 15:13:05
// Design Name: 
// Module Name: logic_gates
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module logic_gates(a,b,not1,not2,and1,or1,nand1,nor1,xor1,xnor1);
input a,b;
output not1,not2,and1,or1,nand1,nor1,xor1,xnor1;
assign not1 = ~a;
assign not2 = ~b;
assign and1 = a & b;
assign or1 = a | b;
assign nand1 = ~(a & b);
assign nor1= ~(a|b);
assign xor1 = a^b;
assign xnor1 = ~(a^b);

endmodule
