/*****************************************************
* 1 bit ALU
* October 22, 2018
******************************************************/

`include "ALU.v"

module n_bit_ALU(
input Ainvert, Binvert, Cin,
input[1:0] Op,
input[N-1:0] a, b,
output[N-1:0] result,
output zero
);

parameter N = 64;

//wire[N-1:0] Z;
wire[N:0] pCin, A;
wire zero;

assign pCin[0] = Cin;
assign A[0] = 0;
//assign zero = ~A[N];

genvar i;
generate
	for(i = 0; i < N; i=i+1) begin
		ALU alu(Ainvert, Binvert, pCin[i], Op, a[i], b[i], result[i], pCin[i+1], );
		//or Or(A[i+1], A[i], Z[i]);
	end	
endgenerate

assign zero = !(|result);

endmodule
