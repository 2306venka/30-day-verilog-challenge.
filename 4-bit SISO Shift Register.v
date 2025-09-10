`timescale 1ns/1ps

module siso_shift_register (
    input  logic clk, reset, serial_in,
    output logic serial_out
);

    logic [3:0] shift_reg;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};  // Shift left
    end

    assign serial_out = shift_reg[3];  // MSB output

endmodule
