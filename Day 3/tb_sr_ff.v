`timescale 1ns / 1ps

module tb_sr_flipflop;

    reg s, r;
    wire q, qn;

    // Instantiate the SR Flip-Flop
    sr_flipflop uut (
        .s(s),
        .r(r),
        .q(q),
        .qn(qn)
    );

    initial begin
        // Create VCD for GTKWave
        $dumpfile("sr_flipflop.vcd");
        $dumpvars(0, tb_sr_flipflop);

        $display("Time\ts\tr\tq\tqn");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, s, r, q, qn);

        // Test sequence
        s = 0; r = 0; #10;   // Hold state
        s = 1; r = 0; #10;   // Set
        s = 0; r = 0; #10;   // Hold
        s = 0; r = 1; #10;   // Reset
        s = 0; r = 0; #10;   // Hold
        s = 1; r = 1; #10;   // Invalid
        s = 0; r = 0; #10;   // Back to Hold

        $finish;
    end

endmodule

