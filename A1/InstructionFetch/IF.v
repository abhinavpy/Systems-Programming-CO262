//Ankit Jain (17CO208) and Abhinav PY (17CO103)
module instructionFetch(clk,reset,instruction);
reg[31:0] IM[0:7];
input clk,reset;
output reg[31:0] instruction;
reg[2:0] pc;


initial
begin
	pc<=0;
	IM[0]=32'haffa01aa;
	IM[1]=32'habcdef12;
	IM[2]=32'h09128745;
	IM[3]=32'h1839405f;
	IM[4]=32'habcef264;
	IM[5]=32'h3682bcef;
	IM[6]=32'h18364789;
	IM[7]=32'hafccaaaa;
end

always@(posedge reset)
begin
	
	pc<=3'b0;
end

always@(posedge clk)
begin
	//$display("after posedge");
	instruction<=IM[pc];
	pc=pc+1;
end

endmodule
