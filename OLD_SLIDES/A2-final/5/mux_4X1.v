`include "mux_2X1.v"

module mux_4x1(i0, i1, i2, i3, select, out);
	
	input [31:0] i0,i1,i2,i3;
	input [1:0] select;
	output [31:0] out;

	wire [31:0] out1, out2;

	mux_2x1 m1(i0, i1, select[0], out1);        //Instantiating three 2x1 Multiplexeres
	mux_2x1 m2(i2, i3, select[0], out2);
	mux_2x1 m3(out1, out2, select[1], out);


endmodule
