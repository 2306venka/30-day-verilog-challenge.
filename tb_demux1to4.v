`timescale 1ns/1ps
module tb_demux1to4;
    reg din;
    reg [1:0] sel;
    wire y0, y1, y2, y3;

    // Instantiate the DEMUX
    demux1to4 uut (
        .din(din),
        .sel(sel),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        // Dump signals to view waveform
        $dumpfile("demux1to4.vcd");   // output file for EPWave/GTKWave
        $dumpvars(0, tb_demux1to4);   // dump all signals from this module

        // Test stimulus
        din = 1; sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Test with din = 0
        din = 0; sel = 2'b10; #10;

        $finish;
    end
endmodule
