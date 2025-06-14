module moore_non (
    in,        // Input
    clk,       // Clock
    reset,     // Reset
    out        // Output
);

// Port declarations
input        in, clk, reset;   // Inputs
output reg   out;              // Output (Moore: depends on state only)

// State encoding
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;  
reg [2:0] present_state, next_state;  // State registers

// Sequential block: handles state transitions
always @(posedge clk or posedge reset) begin
    if (reset)
        present_state <= S0;         // Reset forces FSM to initial state
    else
        present_state <= next_state; // Otherwise, move to next state
end

// Combinational block: defines next state logic
always @(present_state or in) begin
    case (present_state)
        S0: begin
            next_state = (in) ? S1 : S0;
        end

        S1: begin
            next_state = (in) ? S2 : S0;
        end

        S2: begin
            next_state = (in) ? S2 : S3;
        end

        S3: begin
            next_state = (in) ? S4 : S0;
        end

        S4: begin
            next_state = (in) ? S1 : S0;
        end

        default: begin
            next_state = S0;
        end
    endcase
end

// Output logic: Moore machine - output depends only on current state
always @(present_state) begin
    case (present_state)
        S4: out = 1;  // Output 1 when the sequence 1101 is detected
        default: out = 0;
    endcase
end

endmodule  // End of moore_nonol
