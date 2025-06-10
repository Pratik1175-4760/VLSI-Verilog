`timescale 1ns / 1ps

module mux_case(in1     ,
                in2     ,
                in3     ,
                in4     ,
                select  ,
                out )   ;
                
input [1:0]in1,in2,in3,in4  ;
input [1:0]select           ;
output reg[1:0]out          ;

always @(select)
begin
    case(select)
        0 : out = in1     ;
        1 : out = in2     ;
        2 : out = in3     ;
        3 : out = in4     ;
    endcase
end

endmodule
