/*************************************************
* Test bench for testing D Flip flop(all 3)
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

//include different versions for testing differnet D FFs
`include "DFF-v3.v"

module t_DFF;

reg D, clk = 1'b0;
wire Q,Qbar;

D_FF d(D,clk,Q,Qbar);

//assign clk = 1'b1;
always #10 clk = ~clk;


initial begin
	
end

initial begin
	$monitor($time," D = %b, clk = %b, Q = %b, Qbar = %b", D, clk, Q, Qbar);
	D = 1'b1;
#20	D = 1'b0;
#30 	D = 1'b1;
#50 	D = 1'b0;
#40	D = 1'b1;
#20 	D = 1'b0;
#30 	D = 1'b1;
#10	D = 1'b0;
end

initial begin
	//change dumpfile to relevant version
	$dumpfile("t_DFF-v3.vcd");
	$dumpvars(0, t_DFF);
end

initial #200 $finish;

endmodule
