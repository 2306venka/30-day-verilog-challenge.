`timescale 1ns/1ps
module tb_sr_latch;

    reg S, R;
    wire Q, Qn;

    // Instantiate DUT (Design Under Test)
    sr_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        // Setup VCD dump for waveform
        $dumpfile("sr_latch.vcd");
        $dumpvars(0, tb_sr_latch);

        // Apply test cases
        $display("Time\tS R | Q Qn");
        $monitor("%0t\t%b %b | %b %b", $time, S, R, Q, Qn);

        // Initial state
        S = 0; R = 0; #10;

        // Set = 1, Reset = 0 → Q = 1
        S = 1; R = 0; #10;

        // Set = 0, Reset = 0 → Hold state
        S = 0; R = 0; #10;

        // Set = 0, Reset = 1 → Q = 0
        S = 0; R = 1; #10;

        // Set = 0, Reset = 0 → Hold state
        S = 0; R = 0; #10;

        // Invalid condition: S=1, R=1 (both high)
        S = 1; R = 1; #10;

        // Back to idle
        S = 0; R = 0; #10;

        $finish;
    end

endmodule
