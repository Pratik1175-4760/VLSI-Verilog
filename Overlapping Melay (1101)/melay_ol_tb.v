`timescale 1ns / 1ps

// Testbench for the Mealy FSM that detects the overlapping sequence "1101"
module mealy_ol_tb;

    // Inputs
    reg clk;
    reg reset;
    reg in;

    // Output
    wire [1:0] out;

    // Instantiate the DUT (Device Under Test)
    mealy_ol dut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation: 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus block
    initial begin
        // Monitor output values in real time
        $monitor("Time = %0t | reset = %b | in = %b | out = %b", 
                 $time, reset, in, out);

        // Initial reset
        reset = 1;
        in = 0;
        #10;

        // Release reset
        reset = 0;

        // Apply sequence: 1 1 0 1 (Expected to detect "1101")
        in = 1; #10;   // S0 → S1
        in = 1; #10;   // S1 → S2
        in = 0; #10;   // S2 → S3
        in = 1; #10;   // S3 → S1 → Output = 1 (pattern detected)

        // Test for overlapping sequence detection: 1 0 1
        in = 1; #10;   // S1 → S2
        in = 0; #10;   // S2 → S3
        in = 1; #10;   // S3 → S1 → Output = 1 (pattern detected again)

        // Continue with next input
        in = 1; #10;   // S1 → S2

        // Noise or unrelated input pattern
        in = 0; #10;   // S2 → S3 (no valid detection yet)
        in = 1; #10;   // S3 → S1
        in = 0; #10;   // S1 → S0

        // End simulation
        #20;
        $finish;
    end

endmodule
