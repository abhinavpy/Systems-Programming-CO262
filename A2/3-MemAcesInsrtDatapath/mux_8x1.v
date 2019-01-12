/***************************************************
* 64 bit 8X1 MUX program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* January 5, 2019
****************************************************/

`include "mux_4x1.v"

module mux_8x1(i0, i1, i2, i3, i4, i5, i6, i7, select, out);
	
input [63:0] i0, i1, i2, i3, i4, i5, i6, i7;
input[2:0] select;
output [63:0] out;
wire[63:0] out0, out1;

mux_4x1 m0(i0, i1, i2, i3, select[1:0], out0);
mux_4x1 m1(i4, i5, i6, i7, select[1:0], out1);

mux_2x1 m2(out0, out1, select[2], out);
	
endmodule

