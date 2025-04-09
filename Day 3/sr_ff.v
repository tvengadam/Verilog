`timescale 1ns / 1ps

module sr_flipflop (
    input wire s,   // Set input
    input wire r,   // Reset input
    output reg q,   // Output
    output wire qn  // Complement of output
);
    assign qn = ~q;

    always @ (s or r) begin
        if (s == 1 && r == 0)
            q <= 1;       // Set
        else if (s == 0 && r == 1)
            q <= 0;       // Reset
        else if (s == 0 && r == 0)
            q <= q;       // Hold previous value
        else
            q <= 1'bx;    // Invalid condition: s = 1, r = 1
    end
endmodule

