`timescale 1ns / 1ps

module uni_shift_reg_tb();

    parameter n = 8;
    reg [n-1:0] data_in;
    reg clk, reset;
    reg [1:0] control;
    wire [n-1:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    uni_shift_reg #(n) uut (
        .data_in(data_in),
        .clk(clk),
        .reset(reset),
        .control(control),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
        $monitor("Time: %0t | Reset: %b | Control: %b | Data_in: %b | Data_out: %b",
                  $time, reset, control, data_in, data_out);
        
        // Initial values
        reset = 1;
        data_in = 8'b11001100;
        control = 2'b00;
        #10;

        reset = 0;

        // Apply control changes
        control = 2'b11;  // Load
        #10;

        control = 2'b01;  // Shift left
        #10;

        control = 2'b10;  // Shift right
        #10;

        control = 2'b00;  // Hold
        #10;

        // Random control for stress testing
        repeat (10) begin
            control = $random % 4;  // Safe 2-bit control
            #10;
        end

        $finish;
    end

endmodule
