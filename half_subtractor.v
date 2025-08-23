// Day 10 - Half Subtractor
// A half subtractor performs subtraction of two single-bit inputs.
// Outputs: Difference and Borrow.

module half_subtractor (
    input A, B,
    output Difference, Borrow
);

    // Logic equations
  assign Difference = A ^ B;   // XOR gives difference
  assign Borrow = ~A & B;      // Borrow occurs when A < B
endmodule
