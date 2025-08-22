`timescale 1ns/1ps
module tb_priority_encoder;

reg [3:0] I;
wire [1:0] Y;
wire valid;

// Instantiate DUT
priority_encoder uut (
    .I(I),
    .Y(Y),
    .valid(valid)
);

initial begin
    // Dump waveform
    $dumpfile("priority_encoder.vcd");
    $dumpvars(0, tb_priority_encoder);

    // Test patterns
    I = 4'b0000; #10; // No input active
    I = 4'b0001; #10; // I0 active
    I = 4'b0010; #10; // I1 active
    I = 4'b0100; #10; // I2 active
    I = 4'b1000; #10; // I3 active
    I = 4'b1010; #10; // Multiple active → I3 priority
    I = 4'b0111; #10; // Multiple active → I2 priority
    I = 4'b1111; #10; // All active → I3 priority

    $finish;
   end

   endmodule
