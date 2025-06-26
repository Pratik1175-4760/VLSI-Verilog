module syncfifo_tb;

reg  clk, reset, write_en, read_en;
reg  [7:0] data_in;
wire full, empty;
wire [7:0] out;

// Instantiation of DUT
syncfifo dut(
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .full(full),
    .empty(empty),
    .out(out)
);

// Clock generation
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

// Main stimulus
initial begin
    reset    = 1'b1;
    write_en = 1'b0;
    read_en  = 1'b0;
    data_in  = 8'b0;

    #10 reset = 1'b0;
    #10 reset = 1'b1;

    write;         // perform write
    #20 read;      // perform read
    #200 $finish;  // end simulation
end

// Task for write operation
task write;
begin
    write_en = 1'b1;
    read_en  = 1'b0;
    data_in  = $random;
end
endtask

// Task for read operation
task read;
begin
    write_en = 1'b0;
    read_en  = 1'b1;
end
endtask

// Monitor to observe outputs
initial begin
    $monitor("Time = %0t | wr_en = %b | rd_en = %b | data_in = %h | out = %h | full = %b | empty = %b",
              $time, write_en, read_en, data_in, out, full, empty);
end

endmodule
