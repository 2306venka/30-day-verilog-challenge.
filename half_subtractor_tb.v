`timescale 1ns/1ps
module half_subtractor_tb;

    reg A, B;
    wire Difference, Borrow;

    // Instantiate the Half Subtractor
    half_subtractor uut (
        .A(A),
        .B(B),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    initial begin
        // Open VCD file for waveform
        $dumpfile("half_subtractor.vcd");
        $dumpvars(0, half_subtractor_tb);

        // Apply test inputs
        A=0; B=0; #10;
        A=0; B=1; #10;
        A=1; B=0; #10;
        A=1; B=1; #10;

        $finish;
    end

endmodule
