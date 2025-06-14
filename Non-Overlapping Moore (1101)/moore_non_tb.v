module moore_non_tb;  // Testbench module

  // Signal Declarations
  reg         in;              // Input to DUT
  reg         clk;             // Clock signal
  reg         reset;           // Reset signal
  wire        out;             // Output from DUT

  // Testbench internal FSM for verification
  reg  [2:0]  ps, ns;          // Present and Next State
  reg         expected_out;    // Expected output for comparison

  // FSM State Encoding (Same as DUT)
  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

  // DUT Instantiation
  moore_non dut (
    .in(in),
    .clk(clk),
    .reset(reset),
    .out(out)
  );

  // Clock Generation: 10ns clock period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset and Simulation Sequence
  initial begin
    reset = 1;
    #20 reset = 0;

    repeat(20) begin
      apply_stimulus;
      check_output;
    end

    $finish;
  end

  // Task: Random Stimulus Generation
  task apply_stimulus;
    begin
      in = $random % 2;         // Random 0 or 1 input
      @(posedge clk);
    end
  endtask

  // Output Checker
  task check_output;
    begin
      if (out == expected_out) begin
        $display("Input = %b, Output = %b, Expected = %b --> Testcase Pass", in, out, expected_out);
        if (out == 1)
          $display("Sequence 1101 detected");
      end else begin
        $display("Input = %b, Output = %b, Expected = %b --> Testcase Fail", in, out, expected_out);
      end
    end
  endtask

  // Reference FSM logic to generate expected output
  always @(posedge clk or posedge reset) begin
    if (reset)
      ps <= S0;
    else
      ps <= ns;
  end

  always @(ps or in) begin
    case (ps)
      S0: begin
        ns = (in) ? S1 : S0;
        expected_out = 0;
      end

      S1: begin
        ns = (in) ? S2 : S0;
        expected_out = 0;
      end

      S2: begin
        ns = (in) ? S0 : S3;
        expected_out = 0;
      end

      S3: begin
        ns = (in) ? S4 : S0;
        expected_out = 0;
      end

      S4: begin
        ns = S0;
        expected_out = 1;
      end

      default: begin
        ns = S0;
        expected_out = 0;
      end
    endcase
  end

endmodule
