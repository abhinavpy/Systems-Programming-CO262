//Ankit Jain (17CO208) and Abhinav PY (17CO103)



`include "ALU.v"

module _64ALU(Result,Cout,flag,a,b,Ain,Bin,Cin,op);

input [63:0]a; // input A
input [63:0]b; // input B
input Ain,Bin,Cin; // Ainvert, Binvert, Cinvert
input [1:0]op; //Operation
output [63:0]Result;
output Cout,flag; // flag=1 => Result is zero
wire [63:0]carry,f;

genvar i;

for(i=0;i<64;i=i+1)
begin
	if (i==0) begin // Cin is given by ALU
		ALU alu(Result[i],carry[i],f[i],a[i],b[i],Ain,Bin,Cin,op);
	end
	else begin // Cin is given by the previous ALU
		ALU alu(Result[i],carry[i],f[i],a[i],b[i],Ain,Bin,carry[i-1],op);
	end
end

assign Cout=carry[63];

assign flag=&f; // and of all individual flags (if each bit is zero then flag is zero)

endmodule
