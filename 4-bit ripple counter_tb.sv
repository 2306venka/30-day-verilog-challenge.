`timescale 1ns/1ps

module tb_async_counter;
    logic clk, reset;
    logic [3:0] q;

    // Instantiate DUT
    async_counter uut (.clk(clk), .reset(reset), .q(q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    // Stimulus
    initial begin
        $dumpfile("async_counter.vcd");
        $dumpvars(0, tb_async_counter);

        reset = 1; #12;   // Apply reset
        reset = 0;        // Release reset

        #200;             // Run counter
        $finish;
    end

endmodule
