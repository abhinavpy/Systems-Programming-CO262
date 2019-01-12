/***************************************************
* 64 bit 32X1 MUX program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* January 5, 2019
****************************************************/

`include "mux_16x1.v"

module mux_32x1(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, select, out);
	
input [63:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31;
input[4:0] select;
output [63:0] out;
wire[63:0] out0, out1;

mux_16x1 m0(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, select[3:0], out0);
mux_16x1 m1(i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, select[3:0], out1);

mux_2x1 m2(out0, out1, select[4], out);
	
endmodule

