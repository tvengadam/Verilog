`timescale 1ns / 1ps

module tb_t_flipflop;

    reg clk;
    reg t;
    reg rst;
    wire q;

    // Instantiate T Flip-Flop
    t_flipflop uut (
        .clk(clk),
        .t(t),
        .rst(rst),
        .q(q)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("t_flipflop.vcd"); // For GTKWave
        $dumpvars(0, tb_t_flipflop);

        $display("Time\tclk\tt\trst\tq");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, t, rst, q);

        // Simulation sequence
        rst = 1; t = 0; #10;
        rst = 0; t = 1; #20;
        t = 0; #10;
        t = 1; #20;
        t = 0; #10;
        $finish;
    end
endmodule

