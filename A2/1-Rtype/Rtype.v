//Ankit Jain (17CO208) and Abhinav PY (17CO103)
`include "ALU_control.v"
`include "_64ALU.v"
`include "register.v"11

module Rtype(input clk,input [1:0]ALUOp,input reg_write,input [31:0]instr);
	wire [63:0]rdata1,rdata2,q,imm;	
	wire [63:0] d;
	wire [63:0] alu_in1,alu_in2,result;
	wire [1:0] ALUOp;
	wire Funct7,clk;
	wire [2:0] Funct3;
	wire [3:0] operation_result;
	//register_file RF(rdata1,rdata2,instr[19:15],instr[24:20],instr[11:7],d[31:0],reg_write);
	//Register RF(instr[19:15],instr[24:20],instr[11:7],d,reg_write,clk,rdata1,rdata2);
	register RF(clk,rdata1,rdata2,instr[19:15],instr[24:20],instr[11:7],d,reg_write);
	//sign_ext sign(rdata1,alu_in1);
	//sign_ext sign1(rdata2,alu_in2);
	ALU_control my_alu_control(operation_result,ALUOp,instr[30],instr[14:12]);
	wire a_invert=operation_result[3];
	wire b_invert=operation_result[2];
	wire [1:0]operation=operation_result[1:0];
	//alu_64_bit my_alu(rdata1,rdata2,a_invert,b_invert,operation,carry_out,d,zero);
	_64ALU my_alu(d,carry_out,zero,rdata1,rdata2,a_invert,b_invert,b_invert,operation);
	initial
	begin
		$monitor("Time:%dClock:%b\tInstr:%h\tAluOp:%h\tOperationresult:%b\treg_write:%b\nReadData1: %h\t Read Data 2:%h \tWriteData %h\nrr1%d\trr2%d\twr%d\n",$time,clk,instr,ALUOp,operation_result,reg_write,rdata1,rdata2,d,instr[19:15],instr[24:20],instr[11:7]);
	end
	
endmodule 
