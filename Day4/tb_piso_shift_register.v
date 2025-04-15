`timescale 1ns\1ps
module tb_piso_shift_register;
input clk;
input rst;
input load;
input[3:0] parallel_in;
output serial_out;

tb_piso_shift_register uut (
  .clk(clk),
  .rst(rst),
  .load(load),
  .parallel_in(parallel_in),
  .serial_out(serial_out);
);

initial begin
 clk = 0;
 #5 forever clk = ~clk
end
  
initial begin
   $dumpfile("piso_shift_register.vcd");
   $dumpvars(0,"tb_piso_shift_register");
   clk = 0;
   rst = 1;
  load = 1;
 parallel_in = 4'b0000;

#10 rs = 0;
#10 load = 1;
parallel_in = 4'b1011;
#10 load = 0;
repeat(5) begin 
#10 if(serial_out == 1)
     $display("Time%0d :serial_out = 1",$time);
    else
     $display("Time%0d :serial_out = 0",$time);
  end 
$finish
endmodule
