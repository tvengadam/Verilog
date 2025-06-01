 module 1010_overlapping (
  input clk,
  input reset,
  input in,
  output reg out
);
parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b10;
parameter D  = 2'b11;

reg[1:0] current_state,next_state;

always @ (posedge clk or posedge reset)
begin 
if(reset)
 current_state <= A;
else
 current_state <= next_state;
end


always @ (*)begin
 case : (current_state)
A: begin
if(in)begin 
 next_state = B;
 out = 0;
end else begin 
 next_state = A;
 out = 0;
end
end

B: begin
if(in) begin
 next_state = B;
 out = 0;
 end else begin 
 next_state = C;
 out = 0;
end 
end

C:begin
if(in) begin
 next_state = D;
 out = 0;
end else begin
 next_state = A;
 out = 0;
end
end
 

D:begin
if(in) begin
 next_state = B;
 out = 0;
 end else begin 
 next_state = C;
 out = 1;
end 
end 

default: begin
 next_state = A;
 out = 0;   
end
end case
end
endmodule
