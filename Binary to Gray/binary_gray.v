`timescale 1ns / 1ps

module binary_to_gray #(parameter N = 8)(
    input  [N-1:0] binary,
    output reg [N-1:0] gray
);

integer i;

always @(binary) begin
    gray[N-1] = binary[N-1]; // MSB remains the same
    for (i = N-2; i >= 0; i = i - 1) begin
        gray[i] = binary[i+1] ^ binary[i]; // XOR successive bits
    end
end

endmodule
