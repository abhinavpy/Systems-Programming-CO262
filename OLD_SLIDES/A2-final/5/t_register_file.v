/*****************************************************
* Test bench for Register File
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 25, 2018
******************************************************/


`include "register_block.v"

module t_register_file();

	reg [4:0] read_reg1, read_reg2, write_reg;
	reg [31:0] write_data;
	reg reg_write, clock, reset;
	
	wire [31:0] read_data1, read_data2;

	reg_file r(read_reg1, read_reg2, write_reg, write_data, reg_write, clock, reset, read_data1, read_data2);
	
	integer i;

	initial begin
		clock = 0; reset = 1; /*reseting the registers to zero
		#1 reset = 0;

		#1 reset = 1;                                  */

		for(i=0; i<32; i=i+1) begin
			#10 write_data = i; write_reg = i ; reg_write = 1;  //writing data to registers
		end

		for(i=0; i<32; i=i+2) begin
			#10 reg_write = 0; read_reg1 = i; read_reg2 = i+1; #1 $display("Register%2d : %b \tRegister%2d : %b",i, read_data1, i+1 , read_data2);
			                                                                       //reading data from consecutive registers
		end

		#100 $finish;
	end
		
	initial begin
		$dumpfile("t_register_file.vcd");
		$dumpvars(0, t_register_file);
	end
	
	always begin
		#5 clock = ~clock;
	end
 	

endmodule
