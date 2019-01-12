/*************************************************
* n-bit Adder/Subtracter program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

`include "full_adder.v"

module n_bit_adder(A,B,M,Cout,S);

//change N for any N-bit adder
parameter N = 32;
input[N-1:0] A,B;
input M;
output[N-1:0] S;
output Cout;
wire[N:0] carry;
wire[N-1:0] w;

assign carry[0] = M;

genvar i;
generate
	for(i = 0; i < N; i=i+1) begin
		xor X(w[i],B[i],M);
		full_adder FA(A[i], w[i], carry[i], carry[i+1], S[i]);	
	end	
	assign Cout = carry[N];
endgenerate

endmodule
