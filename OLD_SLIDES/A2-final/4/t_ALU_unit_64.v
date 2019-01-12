/*****************************************************
* Test bench for 64 bit ALU unit
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 23, 2018
******************************************************/

`include "ALU_unit_64.v"

module t_ALU_unit_64;

parameter N = 64;

reg[N-1:0] A, B;
reg ALUOp1, ALUOp0;
reg[6:0] funct7;
reg[2:0] funct3;
wire[N-1:0] result;
wire zero;
reg[3:0] Op;

ALU_unit_64 alu_64(A, B, ALUOp1, ALUOp0, funct7, funct3, result, zero);

initial begin
	
	$monitor($time, " A = %h, B = %h, ALUOp1 = %b, ALUOp0 = %b, funct7 = %b, funct3 = %b, result = %h, zero = %b", A, B, ALUOp1, ALUOp0, funct7, funct3, result, zero);
	
	//LD, SD
	{ALUOp1, ALUOp0} = 2'b00;
	funct7 = 7'bxxxxxxx;
	funct3 = 3'bxxx;
	A = 123; B = 321;
	#10
	A = 1; B = -1;
	#10
	A = 64'h7FFFFFFFFFFFFFFF; B = 1;
	#10
	A = 64'hFFFFFFFFFFFFFFFF; B = 64'hFFFFFFFFFFFFFFFF;
	#10
	A = 0; B = 315463254;
	#10
	A = 64'h8000000000000000; B = 64'hFFFFFFFFFFFFFFFF;
	#10
	A = 12345678; B = 87654321;
	#10
	A = 975984298953245230; B = 989526529709823600;
	#10
	A = -123456789098765432; B = -1234567890987654321; 
	#10
	
	//BEQ
	ALUOp0 = 1;
	A = 123; B = 123;
	#10
	A = 123456; B = -123456;
	#10
	A = 64'h7FFFFFFFFFFFFFFF; B = -1;
	#10
	A = 64'h8000000000000000; B = 10;
	#10
	A = 23346; B = 4556325;
	#10
	A = -123456789098765432; B = 1234567890987654321;
	#10
	
	//BEQ
	ALUOp1 = 1;
	A = 1; B = -1;
	#10
	
	//R-type add
	ALUOp0 = 0;
	funct7[5] = 0; 
	funct3 = 3'b000;
	A = 1; B = 1;
	#10
	A = 0; B = 0;
	#10
	A = 3254622; B = 5265;
	#10
	A = -123456789098765432; B = 1234567890987654321;
	#10
	
	//R-type subtract
	funct7[5] = 1; 
	funct3 = 3'b000;
	A = 1; B = -1;
	#10
	A = 0; B = 0;
	#10
	A = 3225; B = 2556;
	#10
	A = 975984298956545230; B = 989526500709823600;
	#10
	A = -123456789098765432; B = -1234567890987654321; 
	#10
	
	//R-type AND
	funct7[5] = 0; 
	funct3 = 3'b111;
	A = 123; B = 34632;
	#10;
	A = 32524; B = -132;
	#10;
	A = 0; B = 186473;
	#10
	A = 16; B = 16;
	#10
	
	//R-type OR
	funct7[5] = 0; 
	funct3 = 3'b110;
	A = 0; B = 12345;
	#10
	A = 127; B = 1023;
	#10
	A = -135542; B = 2565875847;
	#10
	A = 123; B = 123;
	#10
	ALUOp0 = 1;
		
end

initial begin	
	$dumpfile("t_ALU_unit_64.vcd");
	$dumpvars(0, t_ALU_unit_64);
end

initial #350 $finish;

endmodule
