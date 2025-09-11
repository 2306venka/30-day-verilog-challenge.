`timescale 1ns/1ps

module piso_shift_register (
    input  logic clk, reset, load,
    input  logic [3:0] parallel_in,
    output logic serial_out
);

    logic [3:0] shift_reg;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 4'b0000;
        else if (load)
            shift_reg <= parallel_in;   // Load parallel data
        else
            shift_reg <= {1'b0, shift_reg[3:1]};  // Shift right
    end

    assign serial_out = shift_reg[0];

endmodule
