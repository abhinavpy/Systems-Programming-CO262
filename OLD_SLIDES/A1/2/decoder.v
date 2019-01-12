/*************************************************
* 4X16 decoder
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/

//design for 4X16 decoder
module decoder(in,out,enable);

input[3:0] in;
output[15:0] out;
input enable;
reg[15:0] out;

always @ (in or enable)
begin
	out = 16'h0000;
	if(enable) begin
		case(in)
			4'h0: out = 16'h0001;
			4'h1: out = 16'h0002;
			4'h2: out = 16'h0004;
			4'h3: out = 16'h0008;
			4'h4: out = 16'h0010;
			4'h5: out = 16'h0020;
			4'h6: out = 16'h0040;
			4'h7: out = 16'h0080;
			4'h8: out = 16'h0100;
			4'h9: out = 16'h0200;
			4'hA: out = 16'h0400;
			4'hB: out = 16'h0800;
			4'hC: out = 16'h1000;
			4'hD: out = 16'h2000;
			4'hE: out = 16'h4000;
			4'hF: out = 16'h8000;
		endcase
	end
end

endmodule

//test bench
module t_decoder;

reg[3:0] in;
reg enable;
wire[15:0] out;

decoder D(in, out, enable);

initial begin
	$monitor($time," enable = %b, in = %b, out = %b", enable, in, out);
	enable = 0;
#50	in = 	4'h0;
#50	in = 	4'h1;
#50  	in =	4'h2;
#50	in = 	4'h3;
#50	in = 	4'h4;
#50	in =	4'h5;
#50	in =	4'h6;
#50	in =	4'h7;
#50	in =	4'h8;
#50	in =	4'h9;
#50	in =	4'hA;
#50	in =	4'hB;
#50	in =	4'hC;
#50	in =	4'hD;
#50	in =	4'hE;
#50	in =	4'hF;
#50	enable = 1;
#50	in = 	4'h0;
#50	in = 	4'h1;
#50  	in =	4'h2;
#50	in = 	4'h3;
#50	in = 	4'h4;
#50	in =	4'h5;
#50	in =	4'h6;
#50	in =	4'h7;
#50	in =	4'h8;
#50	in =	4'h9;
#50	in =	4'hA;
#50	in =	4'hB;
#50	in =	4'hC;
#50	in =	4'hD;
#50	in =	4'hE;
#50 	in = 	4'hF;
end

initial begin
	$dumpfile("decoder.vcd");
	$dumpvars(0, t_decoder);
end

initial #2000 $finish;

endmodule
