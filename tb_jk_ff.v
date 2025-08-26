`timescale 1ns/1ps
module tb_jk_ff;

    reg J, K, clk, reset;
    wire Q, Qn;

    // Instantiate DUT
    jk_ff uut (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qn(Qn)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock period
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_jk_ff);

        $display("Time\tJ K RST | Q Qn");
        $monitor("%0t\t%b %b %b | %b %b", $time, J, K, reset, Q, Qn);

        // Test cases
        reset = 1; J = 0; K = 0; #12;   // Reset active
        reset = 0;

        J = 0; K = 0; #10;  // No change
        J = 1; K = 0; #10;  // Set
        J = 0; K = 1; #10;  // Reset
        J = 1; K = 1; #10;  // Toggle
        J = 1; K = 0; #10;  // Set
        J = 1; K = 1; #20;  // Multiple toggles

        $finish;
    end
endmodule
