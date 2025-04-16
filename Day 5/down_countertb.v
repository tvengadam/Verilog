module down_counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

   
    down_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #10 clk = ~clk;

    initial begin
        // Monitor output
        $monitor("Time = %0t | rst = %b | clk = %b | count = %b", $time, rst, clk, count);

        // Initialize inputs
        clk = 0;
        rst = 0;

        // Apply stimulus
        #15 rst = 1;   // Start counting down
        #100 rst = 0;  // Reset to 1111
        #20 rst = 1;   // Count down again
        #100 $finish;
    end

endmodule

