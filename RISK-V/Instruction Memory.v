//Instruction Memory 
module Instruction_Mem(clk, reset, read_address, instruction_out);
  input clk, reset;
  input [31:0] read_address;
  output reg [31:0] instruction_out;
  integer k;
  reg [31:0] I_Mem[63:0];   // memory for 64 location , width of each location 32
  always @(posedge clk or posedge reset)
    begin 
      if (reset)
        begin 
          for (k=0;k<64;k=k+1)begin
            I_Mem[k] <=32'b00;
          end
        end
      else
        instruction_out <= I_Mem[read_address];
    end
endmodule
  
