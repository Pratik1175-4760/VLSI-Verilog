`timescale 1ns / 1ps

// Testbench for D Flip-Flop with Asynchronous Reset
module d_async_tb;

  reg clk, reset, in;      // Input signals
  wire q, qb;              // Output signals

  // Instantiate the DUT (Design Under Test)
  d_async dut (
    .in(in),
    .clk(clk),
    .reset(reset),
    .q(q),
    .qb(qb)
  );

  // Clock generation: toggles every 5 ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus task: randomize input and reset
  task stimulus;
    begin
      in = $random % 2;         // 1-bit random input
      reset = $random % 2;      // 1-bit random reset
    end
  endtask

  // Main test process
  initial begin
    $display("Time\tClk\tReset\tD\tQ\tQB\tResult");

    repeat (20) begin
      stimulus();         // Generate random input/reset
      @(posedge clk);     // Wait for rising clock edge
      #1;                 // Small delay to let outputs settle

      // Check behavior
      if (reset) begin
        if (q === 1'b0)
          $display("%0t\t%b\t%b\t%b\t%b\t%b\tPASS (Reset)", $time, clk, reset, in, q, qb);
        else
          $display("%0t\t%b\t%b\t%b\t%b\t%b\tFAIL (Reset)", $time, clk, reset, in, q, qb);
      end else begin
        if (q === in && qb === ~in)
          $display("%0t\t%b\t%b\t%b\t%b\t%b\tPASS", $time, clk, reset, in, q, qb);
        else
          $display("%0t\t%b\t%b\t%b\t%b\t%b\tFAIL", $time, clk, reset, in, q, qb);
      end
    end

    $finish;  // End simulation
  end

endmodule
