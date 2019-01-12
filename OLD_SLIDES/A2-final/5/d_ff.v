module d_ff(d, clock, reset, q, write);

	input  d;
	input clock, reset, write;
	output  q;
	
	reg  q;
	
	always @(posedge clock, negedge reset) begin
		if(reset == 0) begin 
				 q <= 0;
		end
		
		if(reset ==1 && write == 1) begin 
			 q <= d;
		end
	end

endmodule
