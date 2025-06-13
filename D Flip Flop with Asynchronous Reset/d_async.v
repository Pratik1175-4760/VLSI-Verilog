`timescale 1ns / 1ps

// D Flip-Flop with Asynchronous Active-High Reset
module d_async (
    input  wire in,       // D input
    input  wire clk,      // Clock input
    input  wire reset,    // Asynchronous reset (active high)
    output reg  q,        // Q output
    output wire qb        // Complement of Q
);

// Complement output
assign qb = ~q;

// On rising clock edge or reset
always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;        // Asynchronous reset to 0
    else
        q <= in;          // Store input on rising clock edge
end

endmodule
