`timescale 1ns/1ps

module tb_universal_shift_register;
    logic clk, reset;
    logic [1:0] mode;
    logic [3:0] parallel_in;
    logic [3:0] q;

    // DUT
    universal_shift_register uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .parallel_in(parallel_in),
        .q(q)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $dumpfile("universal_shift_register.vcd");
        $dumpvars(0, tb_universal_shift_register);

        // Reset
        reset = 1; mode = 2'b00; parallel_in = 4'b0000; #12;
        reset = 0;

        // Parallel load 1010
        parallel_in = 4'b1010; mode = 2'b11; #10;

        // Hold
        mode = 2'b00; #10;

        // Shift Right
        mode = 2'b01; #40;

        // Shift Left
        mode = 2'b10; #40;

        // Parallel Load 1101
        parallel_in = 4'b1101; mode = 2'b11; #10;

        // Hold again
        mode = 2'b00; #10;

        $finish;
    end
endmodule
