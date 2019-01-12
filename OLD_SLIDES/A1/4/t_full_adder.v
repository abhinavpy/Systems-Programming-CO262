/*************************************************
* Test bench for Full Adder program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/

`include "full_adder.v"

module t_full_adder;

reg A,B,Cin;
wire S,Cout;

full_adder FA(A,B,Cin,Cout,S);

initial begin
       $monitor($time," A = %b, B = %b, Cin = %b, Cout = %b, S = %b", A, B, Cin, Cout, S);	
	{A,B,Cin} = 3'b000;
#50	{A,B,Cin} = 3'b001;
#50	{A,B,Cin} = 3'b010;
#50	{A,B,Cin} = 3'b011;
#50	{A,B,Cin} = 3'b100;
#50	{A,B,Cin} = 3'b101;
#50	{A,B,Cin} = 3'b110;
#50	{A,B,Cin} = 3'b111;
end

initial begin
	$dumpfile("full_adder.vcd");
	$dumpvars(0, t_full_adder);
end

initial #400 $finish;
endmodule
