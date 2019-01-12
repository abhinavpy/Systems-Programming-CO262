/*************************************************
* Full Adder program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/

`include "half_adder.v"

module full_adder(A,B,Cin,Cout,S);

input A,B,Cin;
output Cout, S;
wire S1,C1,C2;

half_adder HA1(A,B,C1,S1);
half_adder HA2(S1,Cin,C2,S);
or G(Cout,C1,C2);

endmodule
