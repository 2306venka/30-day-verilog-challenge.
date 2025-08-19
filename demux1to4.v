// Day 6: 1-to-4 Demultiplexer
module demux1to4 (
    input wire din,           // Single data input
    input wire [1:0] sel,     // 2-bit select input
    output reg y0, y1, y2, y3 // 4 outputs
);
    always @(*) begin
        // Default all outputs to 0
        y0 = 0; y1 = 0; y2 = 0; y3 = 0;
        case (sel)
            2'b00: y0 = din;
            2'b01: y1 = din;
            2'b10: y2 = din;
            2'b11: y3 = din;
                 endcase
                   end
                endmodule
