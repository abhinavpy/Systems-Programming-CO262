/*****************************************************
* Test bench for 64 bit ALU
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 22, 2018
******************************************************/

`include "n_bit_ALU.v"

module t_n_bit_ALU;

parameter N = 64;

reg Ainvert, Binvert, Cin;
reg[1:0] Op;
reg[N-1:0] a,b;
wire[N-1:0] result;
wire zero;

n_bit_ALU n_bit_alu(Ainvert,Binvert,Cin,Op,a,b,result,zero);

initial begin
		$monitor($time," Ainvert=%b, Binvert=%b, Cin=%b, Op=%b, a=%d, b=%d, result=%d, zero=%b",Ainvert,Binvert,Cin,Op,a,b,result,zero);
		#10
		{Ainvert, Binvert, Cin} = 3'bxxx;
		Op = 2'bxx;
		#10 
		{Ainvert, Binvert, Cin} = 3'b000;
		Op = 2'b00;
		    a = 4121524; b = 2465365268745;
		#10 a = 79871987906; b = 5235153678;
		#10 a = 2369025; b = 8099052;
		#10 a = 65868792; b = 68678976981;
		#10
		{Ainvert, Binvert, Cin} = 3'b000;
		Op = 2'b01;
		    a = 8701905; b = 97987298791;
		#10 a = 8792062525; b = 7987091;
		#10 a = 990996312; b = 5164253331;
		#10 a = 879950245; b = 8728705;
		#10
		{Ainvert, Binvert, Cin} = 3'b11x;
		Op = 2'b01;
		    a = 87897928505; b = 879879015;
		#10 a = 31262516; b = 35484763;
		#10 a = 898968029; b = 798728579;
		#10 a = 898798032; b = 989029090962;
		#10
		{Ainvert, Binvert, Cin} = 3'b11x;
		Op = 2'b00;
		    a = 771986151; b = 87987908701;
		#10 a = 786297987987529; b = 878798798754263;
		#10 a = 7897278687689768996; b = 7875786726767825;
		#10 a = 8687681; b = 79879872;
		#10
		{Ainvert, Binvert, Cin} = 3'b000;
		Op = 2'b10;
		    a = 1664852862235; b = 6425867695525;
		#10 a = 6786165698215298; b = 87902919078256;
		#10 a = 78870276572262; b = 87188790101091545;
		#10 a = 1980200628076; b = 8798275620902065;
		#10
		{Ainvert, Binvert, Cin} = 3'b011;
		Op = 2'b10;
		    a = 973620986; b = 1324529445672696;
		#10 a = 768678178976298; b = 768678178976298;
		#10 a = 7579127658739; b = 87209857779908701;
		#10 a = 87907270925; b = 72987967029;
	end

	initial begin	
		$dumpfile("t_n_bit_ALU.vcd");
		$dumpvars(0, t_n_bit_ALU);
	end
	
	initial #260 $finish;

endmodule


