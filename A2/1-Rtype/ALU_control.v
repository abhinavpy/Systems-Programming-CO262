//Ankit Jain (17CO208) and Abhinav PY (17CO103)


/*
Instrn_Opcode  ALU_Op 	  Operation	    funct7 	funct3	 ALU Action 	ALU_control_output
    LD		00 	Load doubleword	   XXXXXXX 	 XXX 	  add	 	0010
    SD 		00 	Store doubleword   XXXXXXX	 XXX 	  add	 	0010
    BEQ 	01 	Branch if equal    XXXXXXX	 XXX 	subtract	0110
    R-type 	10		add	   0000000	 000	  add 		0010
    R-type 	10		sub 	   0100000 	 000 	subtract 	0110
    R-type 	10		and        0000000	 111	  AND 		0000
    R-type 	10		or	   0000000 	 110	  OR 		0001
*/
//Only 6th bit of Func7 is used (f7)
//All 3 bits of Func3 are used ([2:0]f3)
//2 bits for ALU_Op ([1:0]Op)
// alu_out is the ALU_control_unit_output
module ALU_control(alu_out,Op,f7,f3);
input [1:0]Op;
input f7;
input [2:0]f3;
output [3:0]alu_out;
reg alu_out;
always @ (*)
begin
	case (Op)
		2'b00: alu_out=4'b0010;
		2'b01: alu_out=4'b0110;
		2'b10: case (f3)
			3'b000: if (f7==0)
				alu_out=4'b0010;
				else if (f7==1)
				alu_out=4'b0110;
			3'b111: if (f7==0)
				alu_out=4'b0000;
			3'b110: if (f7==0)
				alu_out=4'b0001;
			endcase
		
	endcase
end
endmodule
