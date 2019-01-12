/***************************************************
* 64 bit 16X1 MUX program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* January 5, 2019
****************************************************/

`include "mux_8x1.v"

module mux_16x1(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, select, out);
	
input [63:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15;
input[3:0] select;
output [63:0] out;
wire[63:0] out0, out1;

mux_8x1 m0(i0, i1, i2, i3, i4, i5, i6, i7, select[2:0], out0);
mux_8x1 m1(i8, i9, i10, i11, i12, i13, i14, i15, select[2:0], out1);

mux_2x1 m2(out0, out1, select[3], out);
	
endmodule

