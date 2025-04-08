module half_adder (
    input a, b,
    output sum, carry
);

// Dataflow modeling using assign statements
assign sum = a ^ b;      // XOR for sum
assign carry = a & b;    // AND for carry

endmodule
 
