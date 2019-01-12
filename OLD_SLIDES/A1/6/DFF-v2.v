/*************************************************
* D Flip Flop using SR latchs program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 14, 2018
*************************************************/

module D_FF(D,clk,Q,Qbar);

input D,clk;
output Q,Qbar;

wire S,R;
wire w1,w2;

assign w1 = ~(D&R);
assign R = ~(w1&clk&S);
assign S = ~(clk&w2);
assign w2 = ~(S&w1);
assign Q = ~(Qbar&S);
assign Qbar = ~(Q&R);

endmodule
