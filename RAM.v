`timescale 1ns / 1ps
// Day 28 - 8x8 RAM (Random Access Memory)

module ram #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8, DEPTH = 8) (
    input clk,
    input we, re,                 // write enable, read enable
    input [ADDR_WIDTH-1:0] addr,  // address lines
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);

    // Memory array
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= data_in;  // write data
        end
        if (re) begin
            data_out <= mem[addr]; // read data
        end
    end
endmodule
