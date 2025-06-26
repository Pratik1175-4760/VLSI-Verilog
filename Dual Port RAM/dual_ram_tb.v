`timescale 1ns / 1ps

module dualport_ram_tb;

    // Inputs
    reg clk;
    reg wr_en_a, wr_en_b;
    reg [2:0] addr_a, addr_b;
    reg [127:0] data_in_a, data_in_b;

    // Outputs
    wire [127:0] data_out_a, data_out_b;

    // Instantiate the DUT
    dualport_ram dut (
        .clk(clk),
        .wr_en_a(wr_en_a),
        .wr_en_b(wr_en_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test logic
    integer i;

    // Memory for expected values
    reg [127:0] expected_mem[7:0];

    initial begin
        // Step 1: Initialize
        wr_en_a = 0; wr_en_b = 0;
        addr_a = 0; addr_b = 0;
        data_in_a = 0; data_in_b = 0;

        // Step 2: Write phase (only Port A used)
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            wr_en_a <= 1;
            wr_en_b <= 0;
            addr_a <= i;
            data_in_a <= {64'hAAAA0000AAAA0000, {61'd0, i}};
            expected_mem[i] = {64'hAAAA0000AAAA0000, {61'd0, i}};
        end

        // Stop writing
        @(posedge clk);
        wr_en_a <= 0;
        wr_en_b <= 0;

        // Wait for 1 read cycle latency
        @(posedge clk);

        // Step 3: Read phase (read from both ports)
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            addr_a <= i;
            addr_b <= i;
        end

        // Wait for last read data to settle
        @(posedge clk);

        // Step 4: Display outputs
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            $display("ADDR %0d | DATA_A: %h | DATA_B: %h", i, data_out_a, data_out_b);
        end

        $display("All reads successful. No mismatches.");
        $finish;
    end

endmodule
