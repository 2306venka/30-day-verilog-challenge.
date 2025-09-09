`timescale 1ns/1ps

module mod10_counter (
    input  logic clk, reset,
    output logic [3:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (q == 4'd9)
            q <= 4'b0000;   // Reset back to 0 after 9
        else
            q <= q + 1;
    end

endmodule
