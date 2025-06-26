`timescale 1ns / 1ps

module ram (
    input  [127:0] data_in,
    input          clk,
    input          wr_en,
    input  [2:0]   addr,
    output [127:0] data_out
);

    reg [127:0] storage[7:0];
    reg [2:0]   temp_addr;

    always @(posedge clk) begin
        if (wr_en)
            storage[addr] <= data_in;

        temp_addr <= addr;
    end

    assign data_out = storage[temp_addr];

endmodule
