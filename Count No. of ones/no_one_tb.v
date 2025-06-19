`timescale 1ns / 1ps

module no_one_tb;

reg [15:0] in;
reg clk, reset;
wire [4:0] no_one;

// Instantiate the DUT
no_ones dut (.in(in), .clk(clk), .reset(reset), .no_one(no_one));

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin
    clk = 0;
    reset = 1;
    in = 16'b0;

    // Wait and then release reset
    #10 reset = 0;

    // Apply a random input pattern after reset
    #10 in = $random;  // example input with known number of 1s (count = 10)

    // Wait enough cycles for 16-bit counting (one bit per clk)
    #200 $finish;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t | Reset=%b | in=%b | no_one=%d", $time, reset, in, no_one);
end

endmodule
