`timescale 1ns/1ps

module tb_overlapping_1010_mealy;

    reg clk, reset, in;
    wire out;

 
    overlapping_1010_mealy uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;
    reg [15:0] test_sequence = 16'b1010_1011_0101_0010;
    integer i;

    initial begin
        clk = 0;
        reset = 1;
        in = 0;
        #10;
        
        reset = 0;

        $display("Time\tclk\treset\tin\tout");
        $display("------------------------------------------------");

        for (i = 15; i >= 0; i = i - 1) begin
            in = test_sequence[i];
            #10;
            $display("%4t\t%b\t%b\t%b\t%b", $time, clk, reset, in, out);
        end

        $finish;
    end

endmodule

