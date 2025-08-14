// Testbench for Basic Logic Gates
// This file generates test signals for a, b and observes gate outputs in waveform

`timescale 1ns/1ps

module logic_gates_tb;

    // Testbench signals
    reg a;
    reg b;
    wire and_out, or_out, not_a, nand_out, nor_out, xor_out, xnor_out;

    // Instantiate the logic gates module
    logic_gates uut (
        .a(a),
        .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .not_a(not_a),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );

    initial begin
        // Create waveform file
        $dumpfile("logic_gates.vcd"); // VCD = Value Change Dump
        $dumpvars(0, logic_gates_tb);

        // Apply test values
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; // End simulation
    end

endmodule
