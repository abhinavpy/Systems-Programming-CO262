
//design for 5X32 decoder
module decoder(I, enable, O);

input[4:0] I;
input enable;
output[31:0] O;
integer i;

reg[31:0] O;

always @ (I, enable) begin
    
    if(enable) begin
        for(i = 0; i < 32; i++)
            O[i] = 1'b0;
        O[I] = 1'b1;
    end

end

endmodule
