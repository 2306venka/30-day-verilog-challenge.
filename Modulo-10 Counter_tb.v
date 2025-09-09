`timescale 1ns/1ps

module tb_mod10_counter;
    logic clk, reset;
    logic [3:0] q;

    // Instantiate DUT
    mod10_counter uut (.clk(clk), .reset(reset), .q(q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    // Stimulus
    initial begin
        $dumpfile("mod10_counter.vcd");
        $dumpvars(0, tb_mod10_counter);

        reset = 1; #12;   // Apply reset
        reset = 0;        // Release reset

        #200;             // Run simulation long enough to see multiple cycles
        $finish;
    end

endmodule
