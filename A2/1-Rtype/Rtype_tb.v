//Ankit Jain (17CO208) and Abhinav PY (17CO103)
`include "Rtype.v"
module Rtype_tb;
	reg [31:0]t_instr;
	reg [63:0]t_d;
	reg [1:0] t_ALUOp;
	reg t_reg_write;
	reg t_clk;
	Rtype myr(t_clk,t_ALUOp,t_reg_write,t_instr);
	initial begin
		$dumpfile("Rtype.vcd");
		$dumpvars(0, Rtype_tb);
	end

	initial begin
		t_clk=0;
		t_instr=32'h00000000;
		t_ALUOp=2'b00;
		t_reg_write=1'b1;
		#100 t_instr=32'b00000000000100010000000110110011;
	end

	
	always
		#20 t_clk = !t_clk;

	initial
		#300 $finish;
endmodule
