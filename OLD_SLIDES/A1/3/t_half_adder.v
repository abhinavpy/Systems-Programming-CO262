/*************************************************
* Test bench for Adder program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/
`include "half_adder.v"

module t_half_adder;

reg A,B;
wire C,S;

half_adder H(A,B,C,S);

initial begin
	$monitor($time," A = %b, B = %b, C = %b, S = %b", A, B, C, S);
	{A, B} = 2'b00;	
#50	{A, B} = 2'b01;
#50	{A, B} = 2'b10;
#50	{A, B} = 2'b11;
end

initial begin
	$dumpfile("half_adder.vcd");
	$dumpvars(0, t_half_adder);
end

initial #200 $finish;

endmodule
