/*************************************************
* Test bench for n-bit Adder program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

`include "n_bit_adder.v"

module t_n_bit_adder;

reg[31:0] A,B;
reg M;
wire[31:0] S;
wire Cout;

n_bit_adder nA(A,B,M,Cout,S);

initial begin
	$monitor($time," M = %b, A = %d, B = %d, S = %d, Cout = %b", M, A, B, S, Cout);
//addition
	M = 0;
#50	A = 12; B = 2348;
#50	A = 176234; B = 5678058;
#50	A = 6768525; B = 982435;
#50	A = 4255515; B = 5320;
//subtraction
#50	M = 1;
#50	A = 1672; B = 967;  
#50	A = 136774; B = 17640;  
#50	A = 123639; B = 20650;
#50	A = 2076800; B = 105600;
end

initial begin
	$dumpfile("t_n_bit_adder.vcd");
	$dumpvars(0, t_n_bit_adder);
end

initial #500 $finish;

endmodule
