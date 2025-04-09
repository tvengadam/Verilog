 module t_flipflop(
   input wire t,
   input wire clk,
   input wire reset,
   output reg q
);
 always @ (posedge) begin
  if(reset)
   q <= 0;
  elseif
   q <= ~q;
  else
   q <= q;
end
end module 
