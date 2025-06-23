`timescale 1ns / 1ps

module pipo_tb;

    // Inputs
    reg [15:0] data;
    reg load, clk, reset;
    reg [1:0] type;

    // Output
    wire [15:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    pipo dut (
        .data(data),
        .load(load),
        .type(type),
        .clk(clk),
        .reset(reset),
        .data_out(data_out)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5ns
    end

    // Stimulus block
    initial begin
        // Initialize
        reset = 1;
        load = 0;
        type = 2'b00;
        data = 16'b1010_1100_1111_0001;  // example value

        #10 reset = 0;

        // Apply each type of shift with a gap
        #10 load = 1; type = 2'b00; // Logical left shift
        #10 load = 0;

        #20 load = 1; type = 2'b01; // Logical right shift
        #10 load = 0;

        #20 load = 1; type = 2'b10; // Arithmetic left shift
        #10 load = 0;

        #20 load = 1; type = 2'b11; // Arithmetic right shift
        #10 load = 0;

        #50 $finish;
    end

    // Monitor signal changes
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | load=%b | type=%b | data=%b | data_out=%b",
                  $time, clk, reset, load, type, data, data_out);
    end

endmodule
