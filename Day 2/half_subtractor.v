module half_subtractor_behavioral (
    input a, b,
    output reg diff, borrow
);
    always @ (a or b) begin
        diff   = a ^ b;         // XOR for difference
        borrow = (~a) & b;      // NOT A AND B for borrow
    end
endmodule

