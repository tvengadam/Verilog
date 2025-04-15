module tb_pipo_register;
  reg clk;
  reg reset;
  reg load;
  reg[3:0]data_in;
  wire[3:0]data_out;

tb_pipo_register uut (
 .clk(clk),
 .reset(reset),
 .load(load),
 .data_in(data_in),
 .data_out(data_out)
);

  clk = 0;
#5 clk = ~clk;
   clk = 0;
   reset = 0;
   load = 0;
   data_in = 0;
#10  reset = 1;
#10  reset = 0;

data_in = 4'b1010;
 load = 1;
#10 load = 0;

data_in = 4'b1100;
 load = 1;
#10 load = 0;

#10 reset = 1;
#10 rest = 0;

data_in = 4'b 1111;
load = 1;
#10 load = 0;
$ finish 

end 
endmodule


