`timescale 1ns/1ps
module tb_basic_gates;
    reg a, b;
    wire and_out, or_out, not_a, xor_out;

    // Instantiate the design
    basic_gates uut(a, b, and_out, or_out, not_a, xor_out);

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_basic_gates);

        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;
    end
endmodule
