module pipo_register(
input clk,
input rst,
input load,
input[3:0] data_in,
output[3:0] data_out
);
always @ (posclock or posedge) begin
if(rst)
 data_in <= 4'b0000;
elseif(load)
 data_out <= data_in;
end
endmodule

