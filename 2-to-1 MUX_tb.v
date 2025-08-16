// Testbench for 2-to-1 MUX
`timescale 1ns/1ps

module tb_mux2to1;

    reg a, b, sel;    // Test inputs
    wire y;           // Output

    // Instantiate the DUT (Device Under Test)
    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Dumping waveforms for EDA Playground
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, tb_mux2to1);

        // Test cases
        a = 0; b = 0; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;

        a = 0; b = 0; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;

        $finish;
    end

endmodule
