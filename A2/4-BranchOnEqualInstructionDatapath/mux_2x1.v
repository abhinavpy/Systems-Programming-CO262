/***************************************************
* 64 bit 2X1 MUX program
* January 5, 2019
****************************************************/


module mux_2x1(i0, i1, select, out);
	
input [63:0] i0, i1;
input select;
output [63:0] out;

assign out = (select)?i1:i0;

endmodule

