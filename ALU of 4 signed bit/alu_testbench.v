`timescale 1ns / 1ps

module alu_tb;

reg signed [3:0] a, b;
reg [1:0] select;
wire signed [3:0] out;
wire zero, carry, sign, parity, overflow;
reg signed [3:0] new_out;

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
         $display("a = %d, b = %d, select = %b, out = %d, expected = %d, Flags => zero = %b, carry = %b, sign = %b, parity = %b, overflow = %b ✅ Test Passed", 
                   a, b, select, out, new_out, zero, carry, sign, parity, overflow);
      else
         $display("a = %d, b = %d, select = %b, out = %d, expected = %d, Flags => zero = %b, carry = %b, sign = %b, parity = %b, overflow = %b ❌ Test Failed", 
                   a, b, select, out, new_out, zero, carry, sign, parity, overflow);
   end
end

task stimulus;
reg signed [3:0] A, B;
reg [1:0] Sl;
begin
   A = $random % 16;
   B = $random % 16;
   if (A > 7) A = A - 16;  // To convert it into signed number of range -8 to 7
   if (B > 7) B = B - 16;

   Sl = $random;

   a = A;
   b = B;
   select = Sl;

   case(Sl)
      2'b00: new_out = A + B;
      2'b01: new_out = A - B;
      2'b10: new_out = A * B;
      2'b11: new_out = (B != 0) ? A / B : 0;
   endcase
end
endtask

endmodule
