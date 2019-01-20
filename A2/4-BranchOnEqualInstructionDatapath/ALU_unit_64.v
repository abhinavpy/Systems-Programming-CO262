/*****************************************************
* 64 bit ALU unit
* October 23, 2018
******************************************************/

`include "n_bit_ALU.v"
`include "ALUcontrol.v"

module ALU_unit_64(
input[N-1:0] A, B,
input ALUOp1, ALUOp0,
input[6:0] funct7,
input[2:0] funct3,
output[N-1:0] result,
output zero
);

parameter N = 64;
//reg zero;
wire[3:0] Op;

ALUcontrol aluControl(ALUOp1, ALUOp0, funct7, funct3, Op);

n_bit_ALU alu(Op[3], Op[2], Op[2], Op[1:0], A, B, result, zero);

/*
always @ (result,A,B,ALUOp0,ALUOp1,funct3,funct7) begin

	if(result == 0)
		zero = 1;
	else
		assign zero = 0;
	
end
*/
endmodule
