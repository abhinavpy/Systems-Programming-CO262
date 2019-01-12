/*********************************
* Shanthanu S Rai (17CO242)
* Varun V Pattar (171CO249)
* Implementation of combinational 
* memory block
*********************************/

//NOTE: The given address must be a multiple of 8 (double word boundary)

module DM(Address, WriteData, MemWrite, MemRead, ReadData);

parameter SIZE = 1048576*8; //in bytes (1MB)
parameter dword = 64;

input[dword-1:0] Address, WriteData;
input MemWrite, MemRead;
output[dword-1:0] ReadData;

reg[dword-1:0] ReadData;
reg[SIZE-1:0] mem;
integer i;

always @ (Address, WriteData, MemWrite, MemRead) begin

    if(MemWrite)
        if(Address%8 == 0)  //double word granularity
            for(i = 0; i < dword; i++)
                mem[i+8*Address] = WriteData[i];

    if(MemRead)
        if(Address%8 == 0) //double word graularity
            for(i = 0; i < dword; i++)
                ReadData[i] = mem[i+8*Address];

end

endmodule
