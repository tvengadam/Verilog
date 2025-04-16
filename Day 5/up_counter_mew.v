 module up_counter(
     input rst,clk,
     output reg[3:0] count);
 
always @ (posedge clk) begin
 if(!rst)
   count <= 0;
 else
   count <= count + 1;
end 
end module 
