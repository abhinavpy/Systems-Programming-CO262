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
endmodule // register_file

/*module test_bench_register_file;

	reg [4:0] rr1, rr2, wr;
	reg reg_write,clk;
	reg [63:0] d;
	wire [63:0]rdata1,rdata2;

	initial begin
		 wr = 5'd0;d = 32'd5; rr1 = 5'd0; rr2 = 5'd1; reg_write = 1'b1; #10	 $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);



		#1 wr = 5'd1; d = 32'd10; rr1 = 5'd0; rr2 = 5'd1; #10  $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2); 
		#1 wr = 5'd2; d = 32'd15; rr1 = 5'd0; rr2 = 5'd2;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd3; d = 32'd20; rr1 = 5'd1; rr2 = 5'd0;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd4; d = 32'd25; rr1 = 5'd1; rr2 = 5'd2;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd5; d = 32'd30; rr1 = 5'd1; rr2 = 5'd3;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd6; d = 32'd35; rr1 = 5'd3; rr2 = 5'd2;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd7; d = 32'd40; rr1 = 5'd4; rr2 = 5'd5;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd8; d = 32'd45; rr1 = 5'd7; rr2 = 5'd6;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd9; d = 32'd50; rr1 = 5'd8; rr2 = 5'd9;#10   $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd10; d = 32'd55; rr1 = 5'd0; rr2 = 5'd10;#10 $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd11; d = 32'd60; rr1 = 5'd11; rr2 = 5'd10;#10$display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		
		$display("Changing already stored values");

		#1 wr = 5'd0; d = 32'd65; rr1 = 5'd0; rr2 = 5'd1;#10 $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd1; d = 32'd70; rr1 = 5'd1; rr2 = 5'd2;#10 $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd2; d = 32'd75; rr1 = 5'd2; rr2 = 5'd3;#10 $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
		#1 wr = 5'd3; d = 32'd80; rr1 = 5'd3; rr2 = 5'd4;#10 $display("readReg1 %d readReg2 %d writeData %d writeReg %d reg_write %d readData1 %d readData2 %d",rr1,rr2,d,wr,reg_write,rdata1,rdata2);
	end 

	register_file RF(clk,rdata1,rdata2,rr1,rr2,wr,d,reg_write);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, test_bench_register_file);
	end

	initial begin
		clk=1'b0;
		repeat(500) #1 clk=~clk;
	end

endmodule*/
