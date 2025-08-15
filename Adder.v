//---------------------------
// Half Adder Module
//---------------------------
module half_adder (
    input A,     // First input bit
    input B,     // Second input bit
    output SUM,  // Sum output
    output CARRY // Carry output
);
    assign SUM = A ^ B;     // XOR for sum
    assign CARRY = A & B;   // AND for carry
endmodule

//---------------------------
// Full Adder Module
//---------------------------
module full_adder (
    input A,     // First input bit
    input B,     // Second input bit
    input Cin,   // Carry-in
    output SUM,  // Sum output
    output CARRY // Carry output
);
    assign SUM = A ^ B ^ Cin;                     // XOR chain for sum
    assign CARRY = (A & B) | (B & Cin) | (A & Cin); // Carry logic
endmodule
