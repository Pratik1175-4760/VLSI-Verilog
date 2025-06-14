`timescale 1ns / 1ps

// Module to detect overlapping sequence "1101" using Mealy FSM
module mealy_ol (
    input wire in,
    input wire clk,
    input wire reset,
    output reg [1:0] out
);

    // State encoding
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] present, next;

    // Sequential block: State transition on rising edge of clock or reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            present <= S0;
        else
            present <= next;
    end

    // Combinational block: Next state logic and Mealy output
    always @(*) begin
        // Default values
        next = S0;
        out = 2'b00;

        case (present)
            S0: begin
                next = in ? S1 : S0;
                out = 2'b00;
            end

            S1: begin
                next = in ? S2 : S0;
                out = 2'b00;
            end

            S2: begin
                next = in ? S2 : S3;
                out = 2'b00;
            end

            S3: begin
                next = in ? S1 : S0;
                out = in ? 2'b01 : 2'b00; // Output 1 only if input is 1 in state S3
            end

            default: begin
                next = S0;
                out = 2'b00;
            end
        endcase
    end

endmodule
