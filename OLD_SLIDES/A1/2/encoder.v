/*************************************************
* 16X4 encoder
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/

//design for 16X4 encoder
module encoder(in,out);
	
input[15:0] in;
input enable;
output[3:0] out;

reg[3:0] out;

always @ (in) 
begin
		case(in)
			16'h0001 : out = 4'h0;		
			16'h0002 : out = 4'h1;		
			16'h0004 : out = 4'h2;		
			16'h0008 : out = 4'h3;		
			16'h0010 : out = 4'h4;		
			16'h0020 : out = 4'h5;		
			16'h0040 : out = 4'h6;		
			16'h0080 : out = 4'h7;		
			16'h0100 : out = 4'h8;		
			16'h0200 : out = 4'h9;		
			16'h0400 : out = 4'hA;		
			16'h0800 : out = 4'hB;		
			16'h1000 : out = 4'hC;		
			16'h2000 : out = 4'hD;		
			16'h4000 : out = 4'hE;		
			16'h8000 : out = 4'hF;		
		endcase
end

endmodule

//test bench
module t_encoder;
	
reg[15:0] in;
wire[3:0] out;

encoder E(in, out);

initial begin
	$monitor($time," in = %b, out = %b", in, out);
        #50	in = 	16'h0001;		
        #50	in =	16'h0002;		
        #50	in =	16'h0004;		
	#50	in =	16'h0008;		
	#50	in =	16'h0010;		
	#50	in =	16'h0020;		
	#50	in =	16'h0040;		
	#50	in =	16'h0080;		
	#50	in =	16'h0100;		
	#50	in =	16'h0200;		
	#50	in =	16'h0400;		
	#50	in =	16'h0800;		
	#50	in =	16'h1000;		
	#50	in =	16'h2000;		
	#50	in =	16'h4000;		
	#50	in =	16'h8000;
end

initial begin
	$dumpfile("encoder.vcd");
	$dumpvars(0, t_encoder);
end

initial #1000 $finish;

endmodule
