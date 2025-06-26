`timescale 1ns / 1ps

module ram_tb();

    reg [127:0] data_in;
    reg clk, wr_en;
    reg [2:0] addr;
    wire [127:0] data_out;
    integer i;

    // DUT instantiation with clk connected
    ram dut (
        .data_in(data_in),
        .wr_en(wr_en),
        .clk(clk),
        .addr(addr),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end

    // Monitor changes
    initial begin
        $monitor("%0t | addr = %b | wr_en = %b | data_in = %h | data_out = %h",
                  $time, addr, wr_en, data_in, data_out);
    end

    // Stimulus

initial begin
    wr_en = 1;
    for (i = 0; i < 8; i = i + 1) begin
        @(posedge clk);
        addr = i;
        data_in = $random;
    end

    wr_en = 0;
    for (i = 0; i < 8; i = i + 1) begin
        @(posedge clk);
        addr = i;
    end

    #20;
    $finish;
end


endmodule
