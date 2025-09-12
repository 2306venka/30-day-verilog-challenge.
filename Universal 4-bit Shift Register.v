`timescale 1ns/1ps

module universal_shift_register (
    input  logic clk, reset,
    input  logic [1:0] mode,       // 00=Hold, 01=Shift Right, 10=Shift Left, 11=Parallel Load
    input  logic [3:0] parallel_in,
    output logic [3:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else begin
            case (mode)
                2'b00: q <= q;                              // Hold
                2'b01: q <= {1'b0, q[3:1]};                 // Shift Right
                2'b10: q <= {q[2:0], 1'b0};                 // Shift Left
                2'b11: q <= parallel_in;                    // Parallel Load
                default: q <= q;
            endcase
        end
    end

endmodule
