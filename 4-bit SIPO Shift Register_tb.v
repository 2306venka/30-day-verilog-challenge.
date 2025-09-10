`timescale 1ns/1ps

module tb_sipo_shift_register;
    logic clk, reset, serial_in;
    logic [3:0] parallel_out;

    // Instantiate DUT
    sipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    // Stimulus
    initial begin
        $dumpfile("sipo_shift_register.vcd");
        $dumpvars(0, tb_sipo_shift_register);

        // Apply reset
        reset = 1; serial_in = 0; #12;
        reset = 0;

        // Shift in sequence 1,0,1,1
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Hold input low
        serial_in = 0; #40;

        $finish;
    end

endmodule
