`timescale 1ns/1ps
module tb_bidirectional_shift_register;
    reg clk, rst, dir, load;
    reg [3:0] d_in;
    wire [3:0] q;

    // Instantiate design
    bidirectional_shift_register uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .d_in(d_in),
        .load(load),
        .q(q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Dump waveform
        $dumpfile("bidirectional_shift.vcd");
        $dumpvars(0, tb_bidirectional_shift_register);

        // Initialize
        rst = 1; dir = 0; load = 0; d_in = 4'b0000;
        #10 rst = 0;

        // Load value
        d_in = 4'b1010; load = 1; #10 load = 0;

        // Shift Right (dir=0)
        dir = 0;
        #40;

        // Shift Left (dir=1)
        dir = 1;
        #40;

        $finish;
    end
endmodule
