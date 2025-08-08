// Control Unit 
module Control_Unit(instruction, Branch, MemRead MemtoReg , ALUOp , MemWrite, ALUSrc , Regwrite);
input[6:0] instruction;
output Branch, MemRead MemtoReg , MemWrite, ALUSrc , Regwrite;
output[1:0] ALUOp;
always @(*)
begin
  case(instruction)
    7'b0110011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b001000_01;//  R-Type
    7'b0000011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b111100_00; //load_Type
    7'b0100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b100010_00; //store_Type
    7'b1100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b000001_10; // branch_type
  endcase
end

endmodule
