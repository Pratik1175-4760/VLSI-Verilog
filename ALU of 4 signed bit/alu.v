`timescale 1ns / 1ps

module alu(input signed [3:0]a,
           input signed [3:0]b,
           input [1:0]select,
           output reg signed [3:0]out,
           output reg carry,
           output reg sign,
           output reg overflow,
           output reg parity,
           output reg zero
);
reg [4:0] temp;
always @(select,a,b)
    begin
    temp= 0;
    carry = 0;
    overflow = 0;
        case(select)
        0 : begin 
            temp= a+b;
            out = temp[3:0];
            carry = temp[4];
            overflow = (a[3] == b[3]) && (out[3] != a[3]); // Signed overflow
            end
        1 : begin
            temp = a-b;
            out = temp[3:0];
            carry = (a < b);
            overflow = (a[3] != b[3]) && (out[3] != a[3]); // Signed overflow
            end
        2 : begin
            temp = a * b;
            out = temp[3:0];
            carry = |temp[4];
            overflow = 0;
            end
        3 : begin  
            if (b != 0) begin
                out = a / b;
                carry = 0;
                overflow = 0;
            end else begin
                out = 0;
                carry = 0;
                overflow = 1; 
            end
    end
    endcase
   
    zero   = (out == 0);
    sign   = out[3];
    parity = ~^out;  // Even parity
    end

endmodule
