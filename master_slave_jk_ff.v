`timescale 1ns/1ps
module master_slave_jk_ff (
    input clk,
    input reset,
    input J,
    input K,
    output reg Q
);

    reg master;  // Master latch output

    // Master latch: works on positive edge of clk
    always @(posedge clk or posedge reset) begin
        if (reset)
            master <= 0;
        else begin
            case ({J,K})
                2'b00: master <= master;    // No change
                2'b01: master <= 0;         // Reset
                2'b10: master <= 1;         // Set
                2'b11: master <= ~master;   // Toggle
            endcase
        end
    end

    // Slave latch: works on negative edge of clk
    always @(negedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else
            Q <= master;
    end

endmodule
