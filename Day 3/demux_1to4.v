module demux_1to4 (
    input wire din,           // Input data
    input wire [1:0] sel,     // Select lines
    output reg [3:0] y        // Output lines
);
    always @(*) begin
        y = 4'b0000; // Default: all outputs 0
        case (sel)
            2'b00: y[0] = din;
            2'b01: y[1] = din;
            2'b10: y[2] = din;
            2'b11: y[3] = din;
        endcase
    end
endmodule


