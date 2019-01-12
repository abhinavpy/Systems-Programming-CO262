//Ankit Jain (17CO208) and Abhinav PY (17CO103)
`include "ALU_control.v"
`include "_64ALU.v"
`include "register.v"

module Itype(input clk,input [1:0]ALUOp,input reg_write,input [31:0]instr);
	wire [63:0]rdata1,rdata2,q,imm,rrdata2;	
	wire [63:0] d;
	wire [63:0] alu_in1,alu_in2,result;
	wire [1:0] ALUOp;
	wire Funct7,clk;
	wire [2:0] Funct3;
	wire [3:0] operation_result;
	assign rdata2 = {{53{instr[31]}},instr[30:20]}; // Sign Extension
	
	register RF(clk,rdata1,rrdata2,instr[19:15],instr[24:20],instr[11:7],d,reg_write);
	ALU_control my_alu_control(operation_result,ALUOp,instr[30],instr[14:12]);
	wire a_invert=operation_result[3];
	wire b_invert=operation_result[2];
	wire [1:0]operation=operation_result[1:0];
	_64ALU my_alu(d,carry_out,zero,rdata1,rdata2,a_invert,b_invert,b_invert,operation);
	initial
	begin
		$monitor("Time:%dClock:%b\tInstr:%h\tAluOp:%h\tOperationresult:%b\treg_write:%b\nReadData1: %h\t Read Data 2:%h \tWriteData %h\nrr1%d\trr2%d\twr%d\n",$time,clk,instr,ALUOp,operation_result,reg_write,rdata1,rdata2,d,instr[19:15],instr[24:20],instr[11:7]);
	end
	
endmodule 
