`timescale 1ns / 1ps

module d_ff_tb();
reg in,clk,reset;
reg qb,q;

d_ff dut(.in(in),.clk(clk),.reset(reset),.q(q),.qb(qb));

task initialize;
begin
    in = $random;
    reset = $random;
end
endtask

task clock;
begin
    clk = 1;
    forever
    #5;
    clk = ~clk;
end
endtask

initial begin
repeat(10)
begin
    clock();
    initialize();
    if (~reset)                               //for reset equal to 1 condition
            begin
            if (in == q)                            //check if random input d and output from DUT are equal
               $display("d = %b, q = %b, qb = %b, Testcase Passed", in, q, qb);
                                                   //display for passed testcases
            else
               $display("d = %b, q = %b, qb = %b, Testcase Failed", in, q, qb);
                                                   //display for failed testcases
            end

      end
      $finish;
   
end
endmodule
