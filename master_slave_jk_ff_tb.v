`timescale 1ns/1ps
module master_slave_jk_ff_tb;

    reg clk, reset, J, K;
    wire Q;

    // Instantiate the DUT
    master_slave_jk_ff uut (
        .clk(clk),
        .reset(reset),
        .J(J),
        .K(K),
        .Q(Q)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $dumpfile("master_slave_jk_ff.vcd");
        $dumpvars(0, master_slave_jk_ff_tb);

        reset = 1; J = 0; K = 0;
        #10 reset = 0;

        // Apply inputs
        #10 J=1; K=0;   // Set
        #20 J=0; K=1;   // Reset
        #20 J=1; K=1;   // Toggle
        #20 J=0; K=0;   // Hold
        #20 J=1; K=1;   // Toggle
        #20 J=0; K=1;   // Reset
        #20 J=1; K=0;   // Set

        #50 $finish;
    end

endmodule
