`timescale 1ns/1ps
module full_subtractor_tb;

    reg A, B, Bin;
    wire Difference, Borrow;

    // Instantiate the Full Subtractor
    full_subtractor uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    initial begin
        // Dump for waveform
        $dumpfile("full_subtractor.vcd");
        $dumpvars(0, full_subtractor_tb);

        // Test all combinations
        A=0; B=0; Bin=0; #10;
        A=0; B=0; Bin=1; #10;
        A=0; B=1; Bin=0; #10;
        A=0; B=1; Bin=1; #10;
        A=1; B=0; Bin=0; #10;
        A=1; B=0; Bin=1; #10;
        A=1; B=1; Bin=0; #10;
        A=1; B=1; Bin=1; #10;

        $finish;
end

endmodule
