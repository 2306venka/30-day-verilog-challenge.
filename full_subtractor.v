// Day 11 - Full Subtractor
// A full subtractor subtracts three input bits (A - B - Bin)
// and produces Difference and Borrow outputs.

module full_subtractor (
    input A, B, Bin,
    output Difference, Borrow
);

    // Logic Equations
    assign Difference = A ^ B ^ Bin;  
    assign Borrow = (~A & B) | (~(A ^ B) & Bin);
endmodule
