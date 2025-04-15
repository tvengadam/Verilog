module sipo_shift_register (
    input clk,
    input rst,
    input serial_in,
    output [3:0] parallel_out
);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};
    end

    assign parallel_out = shift_reg;  // Full parallel output
endmodule

