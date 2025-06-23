module pipo(load, data,type, clk,reset,data_out);
input [15:0] data;
input load, clk, reset;
input [1:0]type;
output reg [15:0] data_out;
reg [15:0] temp;

always @(posedge clk)
begin
    if(reset)
        data_out <= 0;
    else
        begin
            if(load)
            begin
                 temp <= data                                     ;//load data to temporary register
                  case(type)
                     0 : data_out <=  temp <<  1                      ;//shift left
                     1 : data_out <=  temp >>  1                      ;//shift right
                     2 : data_out <=  temp <<< 1                      ;//arithmatic left shift
                     3 : data_out <= {temp[15], temp[14:0] >> 1} ;//arithmatic right shift
                  endcase 
            end
        end
end
endmodule