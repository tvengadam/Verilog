module tb_sipo_shift_register;
 reg clk;
 reg rst;
 reg serial_in;
 wire parallel_out;
 
sipo_shift_register uut (
  .clk(clk),
  .rst(rst),
  .serial_in(serial_in),
  .parallel_out(parallel_out));
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin 
$dumpfile("sipo.vcd");
$dumpvars(0,tb_sipo_shift_register);

rst = 1;
serial_in = 0;

#10 serial_in = 1;
#10 serial_in = 0;
#10 serial_in = 1;
#10 serial_in = 1;

#50 $finish;
end
endmodule

