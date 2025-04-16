module up_down_counter_tb;
 reg clk;
 reg rst;
 reg up_down;
 wire[3:0] count;
  
up_down_counter uut(
 .clk(clk),
 .rst(rst),
 .up_down(up_down),
 .count(count)
);

always
#10 clk = ~clk;

initial begin 
$monitor("time = %0t | clk = %b | rst = %b | up_down = %b", $time,clk,rst,up_down);
 clk =0 ;
 rst = 0;
up_down = 1;
#10 rst = 1;
#10 up_down = 0;
#20 rst = 0;
$finish;

end 
endmodule 



