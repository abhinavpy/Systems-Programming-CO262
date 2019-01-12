
module mux_2x1(i0, i1, select, out);
	
	input [31:0] i0, i1;
	input select;
	output [31:0] out;

	assign out = (select)?i1:i0;
	
endmodule
