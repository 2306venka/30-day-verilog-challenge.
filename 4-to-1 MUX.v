// 4-to-1 Multiplexer
module mux4to1 (
    input wire [3:0] d,    // 4 data inputs
    input wire [1:0] sel,  // 2-bit select input
    output wire y          // output
);

assign y = (sel == 2'b00) ? d[0] :
           (sel == 2'b01) ? d[1] :
           (sel == 2'b10) ? d[2] :
                            d[3];

endmodule
