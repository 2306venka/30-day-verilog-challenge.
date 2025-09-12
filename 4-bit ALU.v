`timescale 1ns/1ps

module alu_4bit (
    input  logic [3:0] A, B,
    input  logic [2:0] sel,      // Operation selector
    output logic [3:0] result,
    output logic carry, zero
);

    logic [4:0] temp;

    always_comb begin
        case (sel)
            3'b000: temp = A + B;          // Addition
            3'b001: temp = A - B;          // Subtraction
            3'b010: temp = A & B;          // AND
            3'b011: temp = A | B;          // OR
            3'b100: temp = A ^ B;          // XOR
            3'b101: temp = ~A;             // NOT
            3'b110: temp = A << 1;         // Shift Left
            3'b111: temp = A >> 1;         // Shift Right
            default: temp = 5'b00000;
        endcase
    end

    assign result = temp[3:0];
    assign carry = temp[4];
    assign zero  = (result == 4'b0000);

endmodule
