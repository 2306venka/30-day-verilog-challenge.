`timescale 1ns/1ps
module d_ff_enable (
    input wire D,
    input wire clk,
    input wire enable,
    output reg Q
);
    always @(posedge clk) begin
        if (enable)
            Q <= D;   // Load input only when enable = 1
    end
endmodule
