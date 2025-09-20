`timescale 1ns/1ps
module bidirectional_shift_register (
    input wire clk,
    input wire rst,
    input wire dir,       // 0 = shift right, 1 = shift left
    input wire [3:0] d_in,
    input wire load,
    output reg [3:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else if (load)
            q <= d_in;
        else if (dir)      // Shift Left
            q <= {q[2:0], 1'b0};
        else               // Shift Right
            q <= {1'b0, q[3:1]};
    end
endmodule
