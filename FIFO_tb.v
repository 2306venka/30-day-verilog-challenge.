`timescale 1ns / 1ps
// Testbench for FIFO

module tb_fifo;
    reg clk, reset, wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    fifo uut (
        .clk(clk), .reset(reset),
        .wr_en(wr_en), .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full), .empty(empty)
    );

    always #5 clk = ~clk; // Clock toggle

    initial begin
        $dumpfile("fifo.vcd");
        $dumpvars(0, tb_fifo);

        clk = 0; reset = 1; wr_en = 0; rd_en = 0; data_in = 0;
        #10 reset = 0;

        // Write 3 values
        wr_en = 1;
        data_in = 8'hA1; #10;
        data_in = 8'hB2; #10;
        data_in = 8'hC3; #10;
        wr_en = 0;

        // Read 2 values
        rd_en = 1; #20;
        rd_en = 0;

        // Write 1 more value
        wr_en = 1; data_in = 8'hD4; #10; wr_en = 0;

        // Read remaining
        rd_en = 1; #40; rd_en = 0;

        #20 $finish;
    end
endmodule
