/****************************
* Mem-Type Datapath
* Jan 11, 2019
****************************/

`include "reg_file.v"
`include "ALU_unit_64.v"
`include "imm_generate.v"
`include "DM.v"

module t_mem_type();

reg[63:0] write_data;
reg clk, rst, RegWrite;
wire[63:0] write_value;
wire[63:0] read_data1;
wire[63:0] result;
wire[63:0] return_back;
reg select;
reg[31:0] inst;
wire[63:0] imm;
reg[63:0] write_to_DM;
reg MemWrite, MemRead;
reg[63:0] address;
wire[63:0] to_mem;

//only for load
mux_2x1 m(write_data, return_back, select, write_value);
reg_file rf(inst[19:15], , inst[11:7], write_value, clk, rst, RegWrite, read_data1, );
imm_generate im(inst[31:20], imm);
ALU_unit_64 alu64(read_data1, imm, 1'b0, 1'b0, , , result, );
mux_2x1 m1(address, result, select, to_mem);
DM dm(to_mem, write_to_DM, MemWrite, MemRead, return_back);

always #5 clk = ~clk;

integer i;

initial begin
   
    //$monitor("clk=%d, read_reg1=%d, read_data1=%d", clk, inst[19:15], read_data1);
    $display("Operations on x2 and imm and result stored in x3");

    //store some values
    select = 0;
    clk = 1;
    rst = 1; #5
    write_data = 0;
    inst[11:7] = 2; RegWrite = 1; #8
    inst[19:15] = 2; RegWrite = 0; #8

    select = 1;
    $display($time, " clk=%d, reg2 = %d", clk, read_data1); 

    //ld instruction
    inst = 32'b00000000000000010000000110000011; RegWrite = 1; MemRead = 1;#8
    inst[19:15] = 4; RegWrite = 0;#8 
    $display($time, " clk=%d, value stored back = %d", clk, read_data1);
    
    $finish;
end

initial begin

    $dumpfile("mem_type_datapath.vcd");
    $dumpvars(0, t_mem_type);

end

endmodule
