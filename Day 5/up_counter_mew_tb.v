module up_counter_tb;
    reg rst, clk;
    wire [3:0] count;

    // Instantiate the design under test (DUT)
    up_counter uut (
        .rst(rst),
        .clk(clk),
        .count(count)
    );

    // Generate clock signal
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        #10 rst = 1;
        #20 rst = 0;
        #30 rst = 1;
        #200 $finish;
    end
endmodule


