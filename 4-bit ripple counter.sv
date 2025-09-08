`timescale 1ns/1ps

module async_counter (
    input  logic clk, reset,
    output logic [3:0] q
);

    always_ff @(negedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q[0] <= ~q[0];   // Toggle LSB
    end

    always_ff @(negedge q[0] or posedge reset) begin
        if (reset)
            q[1] <= 0;
        else
            q[1] <= ~q[1];
    end

    always_ff @(negedge q[1] or posedge reset) begin
        if (reset)
            q[2] <= 0;
        else
            q[2] <= ~q[2];
    end

    always_ff @(negedge q[2] or posedge reset) begin
        if (reset)
            q[3] <= 0;
        else
            q[3] <= ~q[3];
    end

endmodule
