// Day 3: 2-to-1 Multiplexer (MUX)
// A multiplexer selects one input out of multiple inputs based on the select line.

module mux2to1 (
    input wire a,      // Input 0
    input wire b,      // Input 1
    input wire sel,    // Select line
    output wire y      // Output
);

    assign y = sel ? b : a; // If sel=0 -> y=a; If sel=1 -> y=b

endmodule
