`timescale 1ns / 1ps

module binary_to_gray_tb;

parameter N = 8;
reg [N-1:0] binary;
wire [N-1:0] gray;

// DUT instantiation
binary_to_gray #(N) dut (
    .binary(binary),
    .gray(gray)
);

// Stimulus generation
initial begin
    $display("Time\t\tBinary\t\tGray");
    $monitor("%0t\t%b\t%b", $time, binary, gray);
    // Apply a few known binary inputs
    binary = 8'b00000000; #10;
    binary = 8'b00000001; #10;
    binary = 8'b00000011; #10;
    binary = 8'b00000111; #10;
    binary = 8'b00001111; #10;
    binary = 8'b11111111; #10;
    binary = 8'b10101010; #10;
    binary = 8'b01010101; #10;

    // Apply some random inputs
    binary = $random;     #10;
    binary = $random;     #10;

    $finish;
end

endmodule
