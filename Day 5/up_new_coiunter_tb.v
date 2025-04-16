module up_counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    up_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #10 clk = ~clk;

    initial begin
        $monitor("Time = %0t | rst = %b | clk = %b | count = %b", $time, rst, clk, count);
        clk = 0;
        rst = 0;
        
        // Apply stimulus
        #15 rst = 1;   // De-assert reset to start counting
        #100 rst = 0;  // Assert reset to reset counter
        #20 rst = 1;   // Start counting again
        #100 $finish;
    end

endmodule

