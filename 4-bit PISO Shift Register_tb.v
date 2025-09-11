`timescale 1ns/1ps

module tb_piso_shift_register;
    logic clk, reset, load;
    logic [3:0] parallel_in;
    logic serial_out;

    // Instantiate DUT
    piso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns period
    end

    // Stimulus
    initial begin
        $dumpfile("piso_shift_register.vcd");
        $dumpvars(0, tb_piso_shift_register);

        // Apply reset
        reset = 1; load = 0; parallel_in = 4'b0000; #12;
        reset = 0;

        // Load parallel data "1011"
        parallel_in = 4'b1011; load = 1; #10;
        load = 0;

        // Shift out bits serially
        #40;

        // Load another value "1100"
        parallel_in = 4'b1100; load = 1; #10;
        load = 0;

        // Shift out again
        #40;

        $finish;
    end

endmodule
