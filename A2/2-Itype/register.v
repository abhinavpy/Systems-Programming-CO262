module register(clk,rdata1,rdata2,rr1,rr2,wr,data,reg_write);
	input wire clk;
	input [4:0]rr1,rr2,wr;
	input reg_write;
	input wire [63:0] data;
	output reg [63:0]rdata1,rdata2;

	reg [63:0] REG [31:0];

	integer my_int;

	integer i;
	//Initializes all the memory spaces so that it can be used to read
	initial begin
  	for (i = 0; i < 32; i = i + 1) 
  	begin
    		REG[i] = i;
  	end
	end


	always @(posedge clk ) 
	begin
		if(reg_write)
		begin
			my_int=wr;
			REG[my_int]<=data;
		end
	end
	integer my_int1;
	integer my_int2;
	always @(posedge clk) 
	begin
		my_int1=rr1;
		my_int2=rr2;
		rdata2<=REG[my_int2];
		rdata1<=REG[my_int1];
	end
endmodule
