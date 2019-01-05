//Ankit Jain (17CO208) and Abhinav PY (17CO103)
`include "IF.v"
module IF_tb;
reg clk,reset;
wire[31:0] instruction;
instructionFetch A(clk,reset,instruction);

initial 
begin
	clk=1'b0;
	reset=0;
	#1 reset=1;
	#1 reset=0;
	repeat(16)
		#5 clk = ~clk;
end

initial
begin
	$dumpfile("IF_tb.vcd");
	$dumpvars(0,IF_tb);
	$display("instruction");
	
	//$monitor("%32b %d",instruction,clk);
end

always@(negedge clk)
begin
	$display("%32b\n",instruction);
end

endmodule
