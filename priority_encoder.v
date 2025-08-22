// 4-to-2 Priority Encoder
module priority_encoder (
    input  wire [3:0] I,   // 4 inputs
    output reg  [1:0] Y,   // Encoded output
    output reg       valid // Valid signal (1 if any input is active)
);

always @(*) begin
    valid = 1'b1;  // Assume valid, set low if no inputs active
    casez (I)
        4'b1???: Y = 2'b11; // I3 has highest priority
        4'b01??: Y = 2'b10; // I2
        4'b001?: Y = 2'b01; // I1
        4'b0001: Y = 2'b00; // I0
        default: begin
            Y = 2'b00;
            valid = 1'b0;   // No input active
        end
        endcase
         end

endmodule
