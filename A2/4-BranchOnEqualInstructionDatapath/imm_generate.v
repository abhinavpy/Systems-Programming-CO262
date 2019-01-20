/*********************************
* Immediate generation block
*********************************/

module imm_generate(imm12, imm64);

input[11:0] imm12;
output[63:0] imm64;

assign imm64[11:0] = imm12;
assign imm64[63:12] = imm12[11]?{52{1'b1}}:{52{1'b0}};

endmodule

