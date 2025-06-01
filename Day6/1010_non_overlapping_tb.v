`timescale 1ns/1ps

module tb_seq_detector_1010;

    reg clk;
    reg reset;
    reg in;
    wire out;

  
    seq_detector_1010 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

  
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        in = 0;

        
        #10 reset = 0;
        #10 in = 1;  // B
        #10 in = 0;  // C
        #10 in = 1;  // D
        #10 in = 0;  // Output should be 1 here
        #10 in = 1;  // B again
        #10 in = 0;  // C
        #10 in = 1;  // D
        #10 in = 0;  // Output should be 1 again
        #10 in = 0;  // A
        #20 $finish;
    end

    initial begin
        $monitor("Time: %0t | in: %b | out: %b", $time, in, out);
    end

endmodule













