`timescale 1ns / 1ps

module up_down_tb();

    reg updown, clk, reset;
    wire [2:0] bin_count; // match the width of DUT

    // Instantiate the DUT (Device Under Test)
    up_down dut (
        .updown(updown),
        .clk(clk),
        .reset(reset),
        .bin_count(bin_count)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Reset sequence
    initial begin
        reset = 1;
        updown = 0; // initialize direction
        #10;
        reset = 0;
    end

    // Monitor output
    initial begin
        $monitor("%0t | clk = %b | reset = %b | updown = %b | bin_count = %b", 
                 $time, clk, reset, updown, bin_count);
    end

    // Stimulus generation (toggle updown randomly every few cycles)
    initial begin
        #15; // wait for reset
        repeat (20) begin
            #20;
            updown = $random % 2;
        end
        #50;
        $finish;
    end

endmodule
