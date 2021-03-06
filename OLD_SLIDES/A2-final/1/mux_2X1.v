/***************************************************
* 2X1 MUX program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
****************************************************/

module mux_2X1(
input[N-1:0] in,
input[N/2-1:0] select,
output out
);

parameter N = 2;

wire[N-1:0] in;
wire[N/2-1:0] select;
wire out;

assign out = in[select];

endmodule

