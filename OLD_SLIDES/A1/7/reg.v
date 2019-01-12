/*************************************************
* Register
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

`include "DFF.v"

module register(I,clk,O,reset);

parameter N = 32;
input[N-1:0] I;
input clk,reset;
output[N-1:0] O;

genvar i;
generate
	for(i = 0; i < N; i=i+1) begin
		D_FF d(I[i],clk,O[i],reset);		
	end	
endgenerate

endmodule
