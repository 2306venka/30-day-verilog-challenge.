`timescale 1ns/1ps
module t_ff_tb;

    reg clk, reset, T;
    wire Q;

    // Instantiate T Flip-Flop
    t_ff uut (
        .clk(clk),
        .reset(reset),
        .T(T),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with 10ns period
    end

    // Stimulus
    initial begin
        $dumpfile("t_ff.vcd");
        $dumpvars(0, t_ff_tb);

        // Initialize
        reset = 1; T = 0;
        #10 reset = 0;  

        // Toggle T
        #10 T = 1;  
        #20 T = 0;  
        #20 T = 1;  
        #20 T = 1;  
        #20 T = 0;  
        #20 T = 1;  

        #50 $finish;
    end

endmodule
