`timescale 1ns/1ps
module tb_decoder2to4;
    reg [1:0] a;
    reg en;
    wire [3:0] y;

    // Instantiate the Decoder
    decoder2to4 uut (
        .a(a),
        .en(en),
        .y(y));

       initial begin
        // Generate waveform
        $dumpfile("decoder2to4.vcd");
        $dumpvars(0, tb_decoder2to4);

        // Test cases
        en = 1; a = 2'b00; #10;
        a = 2'b01; #10;
        a = 2'b10; #10;
        a = 2'b11; #10;

        en = 0; a = 2'b10; #10;

        $finish;
        end
        endmodule
