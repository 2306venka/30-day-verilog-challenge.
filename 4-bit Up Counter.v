`timescale 1ns/1ps
`include "design.sv"

module tb_sync_counter;
    logic clk, reset;
    logic [3:0] q;

    // Instantiate counter
    sync_counter uut (.clk(clk), .reset(reset), .q(q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock period
    end

    // Stimulus
    initial begin
        $dumpfile("sync_counter.vcd");
        $dumpvars(0, tb_sync_counter);

        reset = 1; #12;   // Apply reset
        reset = 0;        // Release reset

        #100;   // Run counter for some time
        $finish;
    end

endmodule
