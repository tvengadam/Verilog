module decoder_2to4 (
    input wire [1:0] in,     // 2-bit input
    input wire en,           // Enable
    output wire [3:0] out    // 4-bit output
);
    assign out = (en) ? (1 << in) : 4'b0000;
endmodule

