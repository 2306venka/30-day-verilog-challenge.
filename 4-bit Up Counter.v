`timescale 1ns/1ps

module sync_counter (
    input logic clk,
    input logic reset,
    output logic [3:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;   // Reset counter
        else
            q <= q + 1;     // Increment counter
    end
      endmodule
