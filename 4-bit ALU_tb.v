`timescale 1ns/1ps

module tb_alu_4bit;
    logic [3:0] A, B;
    logic [2:0] sel;
    logic [3:0] result;
    logic carry, zero;

    // DUT
    alu_4bit uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, tb_alu_4bit);

        // Test Addition
        A = 4'b0101; B = 4'b0011; sel = 3'b000; #10;

        // Test Subtraction
        A = 4'b0101; B = 4'b0011; sel = 3'b001; #10;

        // Test AND
        A = 4'b1100; B = 4'b1010; sel = 3'b010; #10;

        // Test OR
        sel = 3'b011; #10;

        // Test XOR
        sel = 3'b100; #10;

        // Test NOT
        sel = 3'b101; #10;

        // Test Shift Left
        A = 4'b0011; sel = 3'b110; #10;

        // Test Shift Right
        sel = 3'b111; #10;

        $finish;
    end
endmodule
