`timescale 1ns/1ps
module ripple_carry_adder_tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate DUT
    ripple_carry_adder uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        // Dump waveform
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, ripple_carry_adder_tb);

        // Test cases
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;

        $finish;
    end

endmodule
