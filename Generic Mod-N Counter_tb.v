`timescale 1ns/1ps

module tb_modN_counter;
    logic clk, reset;
    logic [3:0] q;

    // Instantiate DUT with N=12 (Mod-12 counter, like a clock hour counter)
    modN_counter #(.N(12), .WIDTH(4)) uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    // Stimulus
    initial begin
        $dumpfile("modN_counter.vcd");
        $dumpvars(0, tb_modN_counter);

        reset = 1; #12;   // Apply reset
        reset = 0;        // Release reset

        #300;             // Run simulation long enough to see multiple cycles
        $finish;
    end

endmodule
