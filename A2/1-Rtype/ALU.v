//Ankit Jain (17CO208) and Abhinav PY (17CO103)




module ALU(Result,Cout,flag,a,b,Ain,Bin,Cin,Op);

input a,b,Ain,Bin,Cin; // inputs a,b, Ainvert, Binvert, CarryIn
input [1:0] Op;
output Result, Cout, flag; // outputs result, flag, CarryOut
reg Result;
reg Aout,Bout;
reg S,Cout;

assign flag=~Result; // zero flag. Result=0 => flag=1

always @ (*)
begin
	if (Ain)	// Invert A
		Aout=~a;
	else
		Aout=a;
	if (Bin)
		Bout=~b;	// Invert B
	else
		Bout=b;
	S=(Aout^Bout^Cin);	// Full Adder
	Cout=(Aout&Bout)|(Cin&(Aout^Bout));
	case (Op)
		2'b00: Result = Aout & Bout; // AND
		2'b01: Result = Aout | Bout; // OR
		2'b10: Result = S; 
	endcase
end
endmodule
