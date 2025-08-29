`timescale 1ns/1ps
module d_ff_enable_tb;
    reg D, clk, enable;
    wire Q;

    // Instantiate the DUT
    d_ff_enable uut (.D(D), .clk(clk), .enable(enable), .Q(Q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Test sequence
    initial begin
        $dumpfile("d_ff_enable.vcd");
        $dumpvars(0, d_ff_enable_tb);

        // Initial values
        D = 0; enable = 0;

        // Case 1: Enable = 0, D should not load
        #10 D = 1; enable = 0;
        #10 D = 0; enable = 0;

        // Case 2: Enable = 1, D should load
        #10 D = 1; enable = 1;
        #10 D = 0; enable = 1;

        // Case 3: Toggle Enable mid operation
        #10 D = 1; enable = 0; 
        #10 D = 1; enable = 1;

        #20 $finish;
    end
endmodule
