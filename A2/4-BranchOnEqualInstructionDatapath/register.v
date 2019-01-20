/*************************************************
* Register
* October 14, 2018
*************************************************/

`include "DFF.v"

module register(I, clk, reset, enable, O);

parameter N = 64;
input[N-1:0] I;
input clk,reset,enable;
output[N-1:0] O;

DFF dff[N-1:0] (I, clk, reset, enable, O);

endmodule
