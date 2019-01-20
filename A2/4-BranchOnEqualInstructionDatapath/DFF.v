/*************************************************
* Behavioral code for D Flip Flop(with reset)
* October 14, 2018
*************************************************/

module DFF(D, clk, reset, enable, Q);

input D,clk,reset,enable;
output Q;

reg Q;

always @ (posedge clk, negedge reset) begin

    if(enable == 1'b1)
        if(reset == 1'b0)
		Q <= 1'b0;
	    else
		Q <= D;

end

endmodule

