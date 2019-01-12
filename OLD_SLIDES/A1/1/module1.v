/*************************************************
* Hello World program
* Shanthanu S Rai(17CO242) and Varun Pattar(17CO249)
* October 13, 2018
*************************************************/

module t_hello_world;
 
integer i;

initial begin
 for(i = 1; i <= 100; i = i+1) begin
  #1 $display ($time, " Hello World");
 end
end

initial begin  
 $dumpfile("module1.vcd");
 $dumpvars(0, t_hello_world);
end

endmodule
