`timescale 1ns/1ps

module updown_counter (
    input  logic clk, reset, up_down,   // up_down=1 → count up, 0 → count down
    output logic [3:0] q
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else if (up_down)
            q <= q + 1;   // Count up
        else
            q <= q - 1;   // Count down
    end

endmodule
