`timescale 1ns/1ps
module t_ff (
    input clk,
    input reset,
    input T,
    output reg Q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;         // Reset output
        else if (T)
            Q <= ~Q;        // Toggle when T=1
        else
            Q <= Q;         // Hold state when T=0
    end

endmodule
