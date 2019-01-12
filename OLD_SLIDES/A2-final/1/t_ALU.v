/*****************************************************
* Test bench for 1 bit ALU
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 22, 2018
******************************************************/

`include "ALU.v"

module t_ALU;
	
	reg Ainvert, Binvert, Cin;
	reg[1:0] Op;
	reg a,b;
	wire result, Cout, zero;

	ALU alu(Ainvert, Binvert, Cin, Op, a, b, result, Cout, zero);

	initial begin
		$monitor($time," Ainvert=%b, Binvert=%b, Cin=%b, Op=%b, a=%b, b=%b, result=%b, Cout=%b, zero=%b",Ainvert,Binvert,Cin,Op,a,b,result,Cout,zero);
		#10
		{Ainvert, Binvert, Cin} = 3'bxxx;
		Op = 2'bxx;
		#10 
		{Ainvert, Binvert, Cin} = 3'b000;
		Op = 2'b00;
		    {a, b} = 2'b00;
		#10 {a, b} = 2'b01;
		#10 {a, b} = 2'b10;
		#10 {a, b} = 2'b11;
		#10
		{Ainvert, Binvert, Cin} = 3'b000;
		Op = 2'b01;
		    {a, b} = 2'b00;
		#10 {a, b} = 2'b01;
		#10 {a, b} = 2'b10;
		#10 {a, b} = 2'b11;
		#10
		{Ainvert, Binvert, Cin} = 3'b11x;
		Op = 2'b01;
		    {a, b} = 2'b00;
		#10 {a, b} = 2'b01;
		#10 {a, b} = 2'b10;
		#10 {a, b} = 2'b11;
		#10
		{Ainvert, Binvert, Cin} = 3'b11x;
		Op = 2'b00;
		    {a, b} = 2'b00;
		#10 {a, b} = 2'b01;
		#10 {a, b} = 2'b10;
		#10 {a, b} = 2'b11;
		#10
		{Ainvert, Binvert, Cin} = 3'b000;
		Op = 2'b10;
		    {a, b} = 2'b00;
		#10 {a, b} = 2'b01;
		#10 {a, b} = 2'b10;
		#10 {a, b} = 2'b11;
		#10
		{Ainvert, Binvert, Cin} = 3'b011;
		Op = 2'b10;
		    {a, b} = 2'b00;
		#10 {a, b} = 2'b01;
		#10 {a, b} = 2'b10;
		#10 {a, b} = 2'b11;
	end

	initial begin	
		$dumpfile("t_ALU.vcd");
		$dumpvars(0, t_ALU);
	end
	
	initial #260 $finish;

endmodule
