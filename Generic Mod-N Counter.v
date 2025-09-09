`timescale 1ns/1ps

module modN_counter #(
    parameter N = 12,          // Default modulus
    parameter WIDTH = 4        // Number of bits (log2(N))
)(
    input  logic clk, reset,
    output logic [WIDTH-1:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (q == N-1)
            q <= 0;            // Reset after reaching N-1
        else
            q <= q + 1;
    end

endmodule
