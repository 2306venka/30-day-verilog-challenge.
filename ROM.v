`timescale 1ns / 1ps
// Day 29 - ROM (Read Only Memory)
// 8x8 ROM initialized with constant values

module rom #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8, DEPTH = 8) (
    input [ADDR_WIDTH-1:0] addr,
    output reg [DATA_WIDTH-1:0] data_out
);

    // ROM content
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    initial begin
        mem[0] = 8'h11;
        mem[1] = 8'h22;
        mem[2] = 8'h33;
        mem[3] = 8'h44;
        mem[4] = 8'h55;
        mem[5] = 8'h66;
        mem[6] = 8'h77;
        mem[7] = 8'h88;
    end

    always @(*) begin
        data_out = mem[addr]; // read only
    end
endmodule
