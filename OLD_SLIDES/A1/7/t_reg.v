/*************************************************
* Test bench for Register
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

`include "reg.v"

module t_reg;

parameter N = 32;
reg[N-1:0] I;
reg clk = 1'b0,reset = 1'b0;
wire[N-1:0] O;

register R(I,clk,O,reset);

always #5 clk = ~clk;

initial begin
	$monitor($time," reset = %b, I = %d, clk = %b, O = %d", reset, I, clk, O);
	I = 21512;
#7	reset = 1'b1;
#7	I = 2352521;
#7	I = 3251255;
#7	I = 2254;
#7	I = 234522;
#7	I = 3425692;
#7	reset = 0;
#7	I = 13964;
#7	I = 342981;
#7	reset = 1;
#7	I = 4519856;
#7	I = 1;
end

initial begin
	$dumpfile("t_reg.vcd");
	$dumpvars(0, t_reg);
end

initial #100 $finish;

endmodule
