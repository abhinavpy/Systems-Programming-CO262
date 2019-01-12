/*************************************************
* Half Adder program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/

module half_adder(A,B,C,S);

input A,B;
output C,S;

and G1(C,A,B);
xor G2(S,A,B);

endmodule


