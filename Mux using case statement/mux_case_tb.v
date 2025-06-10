`timescale 1ns / 1ps

module mux_case_tb();
reg  [1:0] in1,in2,in3,in4  ;
reg  [1:0] select           ;
wire [1:0] out              ;
reg  [1:0] new_out          ;

mux_case dut(.in1   (in1)   ,
             .in2   (in2)   ,
             .in3   (in3)   ,
             .in    (in4)   ,
             .select(select),
             .out   (out)   );

task initialize;
    reg [1:0] s1    ;
    begin
    s1 = $random    ;
    select = s1     ;
    #5              ;
    new_out = s1[1]? (s1[0]? in3 : in4) : (s1[0] ? in1 : in2) ;
    
    end
endtask

initial begin
   in1 = 2'b00 ;
   in2 = 2'b01 ;
   in3 = 2'b10 ;
   in4 = 2'b11 ;
repeat(100)
      begin
         initialize();
            if (new_out == out)
               $display("select[1] = %b, select[0] = %b, out = %b, new_out = %b, Testcase Passed", select[1], select[0], out, new_out) ;  //displaying inputs and outputs
            else
               $display("select[1] = %b, select[0] = %b, out = %b, new_out = %b, Testcase Failed", select[1], select[0], out, new_out) ;  //displaying inputs and outputs
      end
end
      

endmodule
