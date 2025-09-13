`timescale 1ns / 1ps
// Testbench for 8x8 RAM

module tb_ram;
    reg clk, we, re;
    reg [2:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    ram uut (
        .clk(clk),
        .we(we), .re(re),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk; // clock generation

    initial begin
        $dumpfile("ram.vcd");
        $dumpvars(0, tb_ram);

        clk = 0; we = 0; re = 0; addr = 0; data_in = 0;

        // Write values
        #10 we = 1; addr = 3'b000; data_in = 8'hAA; #10;
        addr = 3'b001; data_in = 8'hBB; #10;
        addr = 3'b010; data_in = 8'hCC; #10;
        we = 0;

        // Read values
        #10 re = 1; addr = 3'b000; #10;
        addr = 3'b001; #10;
        addr = 3'b010; #10;
        re = 0;

        #20 $finish;
    end
endmodule
