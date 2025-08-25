`timescale 1ns/1ps
// Day 12: SR Latch using NOR gates
module sr_latch (
    input S,   // Set input
    input R,   // Reset input
    output Q,  // Normal output
    output Qn  // Complement output
);

    assign Q  = ~(R | Qn);  // NOR gate feedback
    assign Qn = ~(S | Q);   // NOR gate feedback

endmodule
