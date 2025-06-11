`timescale 1ns / 1ps

module alu_tb;

reg [3:0] a, b;
reg [1:0] select;
wire [3:0] out;
wire zero, carry, sign, parity, overflow;
reg [3:0] new_out;

// DUT instantiation
alu dut (
    .a(a),
    .b(b),
    .select(select),
    .zero(zero),
    .carry(carry),
    .sign(sign),
    .parity(parity),
    .overflow(overflow),
    .out(out)
);

initial begin
    repeat (200) begin
        stimulus(); #5;

        if (new_out === out)
            $display("a=%d, b=%d, select=%b, out=%d, expected=%d, Z=%b, C=%b, S=%b, P=%b, OVF=%b ✅ PASS", 
                      a, b, select, out, new_out, zero, carry, sign, parity, overflow);
        else
            $display("a=%d, b=%d, select=%b, out=%d, expected=%d, Z=%b, C=%b, S=%b, P=%b, OVF=%b ❌ FAIL", 
                      a, b, select, out, new_out, zero, carry, sign, parity, overflow);
    end
end

task stimulus;
reg [3:0] A, B;
reg [1:0] Sl;
begin
    A = $random % 16;
    B = $random % 16;
    Sl = $random;

    a = A;
    b = B;
    select = Sl;

    case (Sl)
        2'b00: new_out = A + B;
        2'b01: new_out = A - B;
        2'b10: new_out = A * B;
        2'b11: new_out = (B != 0) ? A / B : 0;
    endcase
end
endtask

endmodule

