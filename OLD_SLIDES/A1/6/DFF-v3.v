/*************************************************
* Behavioral code for D Flip Flop
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

module D_FF(D,clk,Q,Qbar);

input D,clk;
output Q,Qbar;

reg Q,Qbar;

always @ (posedge clk) begin
	Q <= D;
	Qbar <= ~D;
end

endmodule

