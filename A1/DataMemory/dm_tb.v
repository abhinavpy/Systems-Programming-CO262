//Ankit Jain (17CO208) and Abhinav PY (17CO103)
`include "dm.v"
module dm_tb;
	reg [6:0]address;
	reg [63:0]write_data;
	reg mem_write,mem_read;
	wire [63:0]read_data;
	integer k;
	
	
	dm A(address,write_data,mem_read,mem_write,read_data);
	initial
	begin
		$dumpfile("dm_tb.vcd");
		$dumpvars(0,dm_tb);
		$display("address mem_read mem_write 		 	write_data 						 read_data");
		$monitor("%7b     %d     %d     %64b %64b",address,mem_read,mem_write,write_data,read_data);
		address=7'b0000001;
		write_data=64'hf;
		mem_read=0;
		mem_write=1;	
		#5  mem_read=1;
		mem_write=0;
		#5 address=7'h2;
		write_data=64'ha2;
		mem_read=0;
		mem_write=1;
		#5	mem_read=1;
		mem_write=0;
		#5 address=7'ha;
		write_data=64'ha1b34;
		mem_read=0;
		mem_write=1;
		#5	mem_read=1;
		mem_write=0;
	end
	
	
endmodule
