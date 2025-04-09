module t_flipflop (
    input wire clk,
    input wire t,
    input wire rst,     // Active-high synchronous reset
    output reg q
);
    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else if (t)
            q <= ~q;    // Toggle
        else
            q <= q;     // Hold
    end
endmodule

