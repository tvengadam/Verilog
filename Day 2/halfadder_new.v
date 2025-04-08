module half_adder (
    input A, B,
    output SUM, CARRY
);

    // Gate-level implementation
    xor (SUM, A, B);      // SUM = A XOR B
    and (CARRY, A, B);    // CARRY = A AND B

endmodule

