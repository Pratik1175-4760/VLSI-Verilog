`timescale 1ns / 1ps

module lfsr_tb();
reg clk,reset;
wire [3:0]data_out;
wire feedback;

lfsr dut (.clk(clk),.reset(reset),.data_out(data_out));

initial begin
    clk = 1;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10
    reset = 0;
    #200 $finish;
end

initial begin 
    $monitor("%0t  | data_out = %b | reset = %b",$time, data_out, reset);
end
endmodule
