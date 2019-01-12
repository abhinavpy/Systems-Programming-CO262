/****************************
* Shanthanu S Rai (171CO242)
* Varun V Pattar (171CO249)
* BEQ-Type Datapath
* Jan 11, 2019
****************************/

`include "reg_file.v"
`include "ALU_unit_64.v"
`include "imm_generate.v"

module t_beq_type();

reg[63:0] write_data;
reg clk, rst, RegWrite;
wire[63:0] write_value;
wire[63:0] read_data1, read_data2;
wire[63:0] result;
reg select;
reg[31:0] inst;
wire[63:0] imm1, shift;
wire zero;
reg[15:0] pc;//to simulate pc

mux_2x1 m(write_data, result, select, write_value);

reg_file rf(inst[19:15], inst[24:20], inst[11:7], write_value, clk, rst, RegWrite, read_data1, read_data2);
imm_generate im(inst[31:20], imm1);
assign shift = imm1<<1;
ALU_unit_64 alu64(read_data1, read_data2, 1'b0, 1'b1, inst[31:25], inst[14:12], result, zero);

always #5 clk = ~clk;

integer i;

initial begin
   
    //$monitor("clk=%d, read_reg1=%d, read_data1=%d", clk, inst[19:15], read_data1);
    $display("Operations on x2 and x3");

    //store some values
    select = 0;
    clk = 1;
    rst = 1; #5
    write_data = 123;
    inst[11:7] = 2; RegWrite = 1; #8
    write_data = 123;
    inst[11:7] = 3; RegWrite = 1; #8
    inst[19:15] = 2; RegWrite = 0; #8
    inst[24:20] = 3; RegWrite = 0; #8
    pc = 4;

    select = 1;
    $display($time, " clk=%d, reg2 = %d, reg3 = %d", clk, read_data1, read_data2); 
    $display("Old pc value is %d", pc);

    //add instruction
    inst = 32'bXXXXXXX0001000011000XXXXX0110011; RegWrite = 1; #8
    $display($time, " zero = %d", zero);
    if(zero) begin
        pc += 4;
        $display("New pc value is %d", pc);
    end
    inst[19:15] = 4; RegWrite = 0;#10

    $finish;
end

initial begin

    $dumpfile("beq_type_datapath.vcd");
    $dumpvars(0, t_beq_type);

end

endmodule
