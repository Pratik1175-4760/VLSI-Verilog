`timescale 1ns / 1ps

module random_counter_tb;

reg reset, load, enable, clk;
wire [3:0] count_out;
wire [3:0] count;
reg [3:0] expected_count;

// Custom counter states
parameter S0 = 8,  S1 = 7,  S2 = 11, S3 = 4,  S4 = 9,  S5 = 2, S6 = 5,
          S7 = 12, S8 = 6,  S9 = 3,  S10 = 15, S11 = 1, S12 = 14, S13 = 13;

// DUT instance
random_counter dut (
    .reset(reset),
    .load(load),
    .enable(enable),
    .clk(clk),
    .count_out(count_out),
    .count(count)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock
end

// Expected counter sequence
function [3:0] next_state;
    input [3:0] curr;
    begin
        case (curr)
            S0 : next_state = S1;
            S1 : next_state = S2;
            S2 : next_state = S3;
            S3 : next_state = S4;
            S4 : next_state = S5;
            S5 : next_state = S6;
            S6 : next_state = S7;
            S7 : next_state = S8;
            S8 : next_state = S9;
            S9 : next_state = S10;
            S10: next_state = S11;
            S11: next_state = S12;
            S12: next_state = S13;
            S13: next_state = S0;
            default: next_state = S0;
        endcase
    end
endfunction

// Stimulus
initial begin
    reset = 1; load = 0; enable = 0;
    #15 reset = 0;
    
    load = 1; enable = 1;
    expected_count = S1;

    repeat (15) begin
        @(posedge clk);
        if (count_out == expected_count)
            $display("PASS: Time=%0t, count_out=%d", $time, count_out);
        else
            $display("FAIL: Time=%0t, count_out=%d, expected=%d", $time, count_out, expected_count);
        expected_count = next_state(expected_count);
    end

    $finish;
end

endmodule
