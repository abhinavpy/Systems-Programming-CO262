
module ALUcontrol(
input ALUOp1, ALUOp0,
input[6:0] funct7,
input[2:0] funct3,
output[3:0] Op
);

reg[3:0] Op;
wire f;

assign f = funct7[5];

always @ (ALUOp1, ALUOp0, f, funct3) begin
	
	if(ALUOp1 == 1'b0 && ALUOp0 == 1'b0)
		Op = 4'b0010;
	else if(ALUOp1 == 1'b0 && ALUOp0 == 1'b1)
		Op = 4'b0110;
	else if(ALUOp1 == 1'b1 && ALUOp0 == 1'b0) begin
		if(f == 1'b0 && funct3 == 3'b000)
			Op = 4'b0010;
		else if(f == 1'b1 && funct3 == 3'b000)
			Op = 4'b0110;
		else if(f == 1'b0 && funct3 == 3'b111)
			Op = 4'b0000;
		else if(f == 1'b0 && funct3 == 3'b110)
			Op = 4'b0001;
	end
	else 
		Op <= Op;
end

endmodule
