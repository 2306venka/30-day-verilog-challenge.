`timescale 1ns/1ps
module adder_tb;

// Test signals
reg A, B, Cin;
wire SUM_HA, CARRY_HA;
wire SUM_FA, CARRY_FA;

// Instantiate Half Adder
half_adder ha (
    .A(A),
    .B(B),
    .SUM(SUM_HA),
    .CARRY(CARRY_HA)
);

// Instantiate Full Adder
full_adder fa (
    .A(A),
    .B(B),
    .Cin(Cin),
    .SUM(SUM_FA),
    .CARRY(CARRY_FA)
);

initial begin
    // For waveform output
    $dumpfile("adder_waveform.vcd");
    $dumpvars(0, adder_tb);

    // Test Half Adder & Full Adder combinations
    Cin = 0; // Start with no carry-in

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    // Now test Full Adder with carry-in
    Cin = 1;
    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;
end

endmodule
