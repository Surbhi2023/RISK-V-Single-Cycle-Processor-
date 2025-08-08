// Data Memory 
module Data_Memory(clk, reset, MemWrite, MemRead, read_address, Write_data, MemData_out);
  input clk, reset, MemWrite, MemRead;
  input [31:0] read_address, Write_data;
  input[31:0] MemData_out;
  integer k;
  reg [31:0] D_memory[63:0];
  always @(posedge clk or posedge reset)
    begin 
      if(reset)
        begin 
          for (k=0;k<64;k=k+1) begin 
            D_Memory[k] <=32'b00;
          end
        end
      else if(MemWrite) begin
        D_Memory[read_address] <= Write_data;
      end
      assign MemData_out = (MemRead) ? D_Memory[read_address] : 32'b00;//when memread high read data from memory at read from D_memory otherwise output 0
endmodule
  
