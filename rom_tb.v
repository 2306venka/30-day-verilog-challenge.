`timescale 1ns / 1ps
// Testbench for ROM

module tb_rom;
    reg [2:0] addr;
    wire [7:0] data_out;

    rom uut (
        .addr(addr),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("rom.vcd");
        $dumpvars(0, tb_rom);

        // Read all ROM locations
        addr = 3'b000; #10;
        addr = 3'b001; #10;
        addr = 3'b010; #10;
        addr = 3'b011; #10;
        addr = 3'b100; #10;
        addr = 3'b101; #10;
        addr = 3'b110; #10;
        addr = 3'b111; #10;

        #20 $finish;
    end
endmodule
