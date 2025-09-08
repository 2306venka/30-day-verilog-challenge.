`timescale 1ns/1ps

module tb_updown_counter;
    logic clk, reset, up_down;
    logic [3:0] q;

    // Instantiate DUT
    updown_counter uut (.clk(clk), .reset(reset), .up_down(up_down), .q(q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    // Stimulus
    initial begin
        $dumpfile("updown_counter.vcd");
        $dumpvars(0, tb_updown_counter);

        // Reset applied
        reset = 1; up_down = 1; #12;
        reset = 0;

        // Count up
        #60;

        // Switch to count down
        up_down = 0;
        #60;

        // Again count up
        up_down = 1;
        #60;

        $finish;
    end

endmodule
