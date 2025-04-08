module tb_half_adder;

reg a, b;
wire sum, carry;

// Instantiate the half adder
half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

// Generate waveform dump
initial begin
    $dumpfile("halfadder.vcd");
    $dumpvars(0, tb_half_adder);
end

// Apply test inputs
initial begin
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
end

endmodule


