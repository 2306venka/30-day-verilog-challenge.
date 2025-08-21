// Day 8: 3-to-8 Decoder
module decoder3to8(
    input [2:0] a,    // 3-bit input
    input en,         // enable
    output reg [7:0] y // 8 outputs
);
    always @(*) begin
        if (en) begin
            case(a)
                3'b000: y = 8'b00000001;
                3'b001: y = 8'b00000010;
                3'b010: y = 8'b00000100;
                3'b011: y = 8'b00001000;
                3'b100: y = 8'b00010000;
                3'b101: y = 8'b00100000;
                3'b110: y = 8'b01000000;
                3'b111: y = 8'b10000000;
                default: y = 8'b00000000;
            endcase
        end else begin
            y = 8'b00000000;
        end
        end
        endmodule
