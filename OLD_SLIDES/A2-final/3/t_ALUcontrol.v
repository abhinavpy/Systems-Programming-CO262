/*****************************************************
* Test bench for ALU Control
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 23, 2018
******************************************************/

`include "ALUcontrol.v"

module t_ALUcontrol;

reg ALUOp1, ALUOp0;
reg[6:0] funct7;
reg[2:0] funct3;
wire[3:0] Op;

ALUcontrol A(ALUOp1, ALUOp0, funct7, funct3, Op);

initial begin
	
	$monitor($time, " ALUOp1 = %b, ALUOp0 = %b, funct7 = %b, funct3 = %b, Op = %b", ALUOp1, ALUOp0, funct7, funct3, Op);
	{ALUOp1, ALUOp0} = 2'b00;
	funct7 = 7'bxxxxxxx;
	funct3 = 3'bxxx;
	#10
	ALUOp0 = 1;
	#10
	ALUOp1 = 1;
	#10
	ALUOp0 = 0;
	funct7[5] = 0; 
	funct3 = 3'b000;
	#10
	funct7[5] = 1; 
	funct3 = 3'b000;
	#10
	funct7[5] = 0; 
	funct3 = 3'b111;
	#10
	funct7[5] = 0; 
	funct3 = 3'b110;
	#10
	ALUOp0 = 1;
end

initial begin
	$dumpfile("t_ALUcontrol.vcd");
	$dumpvars(0, t_ALUcontrol);
end 

initial #70 $finish;

endmodule
