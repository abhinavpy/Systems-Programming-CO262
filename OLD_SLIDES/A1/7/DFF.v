/*************************************************
* Behavioral code for D Flip Flop(with reset)
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

module D_FF(D,clk,Q,reset);

input D,clk,reset;
output Q;

reg Q;

always @ (posedge clk,negedge reset) begin
	if(reset == 0)
		Q <= 1'b0;
	else
		Q <= D;
end

endmodule

