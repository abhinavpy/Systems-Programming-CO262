/*****************************************************
* 1 bit ALU
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 21, 2018
******************************************************/

`include "full_adder.v"
`include "mux_2X1.v"
`include "mux_4X1.v"

module ALU(
input Ainvert, Binvert, Cin,
input[1:0] Op,
input a, b,
output result, Cout, zero
);

wire oa, ob, result;

wire[1:0] in_a, in_b;
assign in_a[0] = a;
assign in_a[1] = ~a;
assign in_b[0] = b;
assign in_b[1] = ~b;

mux_2X1 m1(in_a, Ainvert, oa);
mux_2X1 m2(in_b, Binvert, ob);

wire[3:0] out;

and A(out[0],oa,ob);
or O(out[1],oa,ob);
full_adder S(oa,ob,Cin,Cout,out[2]);

mux_4X1 m3(out, Op, result);

wire zero = ~result;

endmodule
