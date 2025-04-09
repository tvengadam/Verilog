// tb_jk_flipflop.v
`timescale 1ns / 1ps

module tb_jk_flipflop;

    reg j, k, clk;
    wire q, qn;

    // Instantiate the module
    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("jk_flipflop.vcd");
        $dumpvars(0, tb_jk_flipflop);

        $display("Time\tJ\tK\tQ\tQn");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, j, k, q, qn);

        // Initial values
        clk = 0; j = 0; k = 0;

        #10 j = 0; k = 1;  // Reset
        #10 j = 1; k = 0;  // Set
        #10 j = 1; k = 1;  // Toggle
        #10 j = 0; k = 0;  // No Change
        #10 j = 1; k = 1;  // Toggle again

        #10 $finish;
    end

endmodule

