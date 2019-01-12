/*********************************
* Shanthanu S Rai (17CO242)
* Varun V Pattar (171CO249)
* Register file
* January 5, 2019
*********************************/

`include "decoder.v"
`include "mux_32x1.v"
`include "register.v"


module reg_file(read_reg1, read_reg2, write_reg, write_data, clk, rst, RegWrite, read_data1, read_data2);

input[4:0] read_reg1, read_reg2, write_reg;
input[63:0] write_data;
input clk, rst, RegWrite;
output[63:0] read_data1, read_data2;

wire[31:0] dec_out, write_in_this_reg; //wires out of decoder and output of and

decoder dec(write_reg, 1'b1, dec_out);

wire[31:0] reg_enable, reg_out;

and and_gate[31:0](reg_enable, RegWrite, dec_out);

//32 register outputs
wire[63:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;

register r0(write_data, clk, rst, reg_enable[0], q0);
register r1(write_data, clk, rst, reg_enable[1], q1);
register r2(write_data, clk, rst, reg_enable[2], q2);
register r3(write_data, clk, rst, reg_enable[3], q3);
register r4(write_data, clk, rst, reg_enable[4], q4);
register r5(write_data, clk, rst, reg_enable[5], q5);
register r6(write_data, clk, rst, reg_enable[6], q6);
register r7(write_data, clk, rst, reg_enable[7], q7);
register r8(write_data, clk, rst, reg_enable[8], q8);
register r9(write_data, clk, rst, reg_enable[9], q9);
register r10(write_data, clk, rst, reg_enable[10], q10);
register r11(write_data, clk, rst, reg_enable[11], q11);
register r12(write_data, clk, rst, reg_enable[12], q12);
register r13(write_data, clk, rst, reg_enable[13], q13);
register r14(write_data, clk, rst, reg_enable[14], q14);
register r15(write_data, clk, rst, reg_enable[15], q15);
register r16(write_data, clk, rst, reg_enable[16], q16);
register r17(write_data, clk, rst, reg_enable[17], q17);
register r18(write_data, clk, rst, reg_enable[18], q18);
register r19(write_data, clk, rst, reg_enable[19], q19);
register r20(write_data, clk, rst, reg_enable[20], q20);
register r21(write_data, clk, rst, reg_enable[21], q21);
register r22(write_data, clk, rst, reg_enable[22], q22);
register r23(write_data, clk, rst, reg_enable[23], q23);
register r24(write_data, clk, rst, reg_enable[24], q24);
register r25(write_data, clk, rst, reg_enable[25], q25);
register r26(write_data, clk, rst, reg_enable[26], q26);
register r27(write_data, clk, rst, reg_enable[27], q27);
register r28(write_data, clk, rst, reg_enable[28], q28);
register r29(write_data, clk, rst, reg_enable[29], q29);
register r30(write_data, clk, rst, reg_enable[30], q30);
register r31(write_data, clk, rst, reg_enable[31], q31);


mux_32x1 m1(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, read_reg1, read_data1);

mux_32x1 m2(q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, read_reg2, read_data2);

endmodule
