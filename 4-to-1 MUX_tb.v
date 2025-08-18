`timescale 1ns/1ps
module tb_mux4to1;

reg [3:0] d;
reg [1:0] sel;
wire y;

// Instantiate the 4-to-1 MUX
mux4to1 uut (
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin
    // Dump file for waveform
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, tb_mux4to1);

    // Test cases
    d = 4'b1010; sel = 2'b00; #10; // Expect y = d[0] = 0
    d = 4'b1010; sel = 2'b01; #10; // Expect y = d[1] = 1
    d = 4'b1010; sel = 2'b10; #10; // Expect y = d[2] = 0
    d = 4'b1010; sel = 2'b11; #10; // Expect y = d[3] = 1

    $finish;
end

endmodule
