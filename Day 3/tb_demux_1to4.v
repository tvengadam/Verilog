`timescale 1ns / 1ps

module tb_demux_1to4;

    reg din;
    reg [1:0] sel;
    wire [3:0] y;

    // Instantiate the demux
    demux_1to4 uut (
        .din(din),
        .sel(sel),
        .y(y)
    );

    initial begin
        // GTKWave setup
        $dumpfile("demux_1to4.vcd");
        $dumpvars(0, tb_demux_1to4);

        $display("Time\t din sel   y");
        $monitor("%0dns\t  %b   %b   %b", $time, din, sel, y);

        din = 1'b1; // Send high signal

        sel = 2'b00; #10; // y = 0001
        sel = 2'b01; #10; // y = 0010
        sel = 2'b10; #10; // y = 0100
        sel = 2'b11; #10; // y = 1000

        din = 1'b0; sel = 2'b10; #10; // All outputs 0

        $finish;
    end

endmodule

