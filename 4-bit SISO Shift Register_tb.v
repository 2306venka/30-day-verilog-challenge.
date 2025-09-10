`timescale 1ns/1ps

module tb_siso_shift_register;
    logic clk, reset, serial_in;
    logic serial_out;

    // Instantiate DUT
    siso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns clock
    end

    // Stimulus
    initial begin
        $dumpfile("siso_shift_register.vcd");
        $dumpvars(0, tb_siso_shift_register);

        // Apply reset
        reset = 1; serial_in = 0; #12;
        reset = 0;

        // Shift in data: 1,0,1,1
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Hold input low
        serial_in = 0; #40;

        $finish;
    end

endmodule
