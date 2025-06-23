`timescale 1ns / 1ps

module clk_divider_tb();

reg clk;
reg reset;
wire out_clk;

// Instantiate the DUT (Device Under Test)
clk_divider dut (
    .clk(clk),
    .reset(reset),
    .out_clk(out_clk)
);

// Clock generation: 10ns period (100MHz)
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle every 5ns
end

// Stimulus
initial begin
    reset = 1;
    #15;          // hold reset high for 15ns
    reset = 0;

    #200;         // run simulation for 200ns
    $finish;
end

endmodule
