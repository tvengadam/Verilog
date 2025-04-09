module d_latch (
    input wire d,     // Data input
    input wire en,    // Enable input
    output reg q      // Output
);

    always @(*) begin
        if (en)
            q = d;    // When enable is high, latch stores D
        // If enable is low, q holds its previous value
    end

endmodule

