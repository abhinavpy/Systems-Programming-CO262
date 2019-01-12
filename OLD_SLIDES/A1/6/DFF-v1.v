/*************************************************
* D Flip Flop using Master Slave D latch program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

module D_latch(D,enable,Q,Qbar);

input D,enable;
output Q, Qbar;

reg Q, Qbar;

always @ (enable or D) begin
	if(enable) begin
		Q <= D;
		Qbar <= ~D;
	end
end

endmodule

module D_FF(D,clk,Q,Qbar);

input D,clk;
output Q,Qbar;
wire w;

D_latch D1(D,clk,w,);
D_latch D2(w,~clk,Q,Qbar);

endmodule
