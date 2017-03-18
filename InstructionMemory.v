`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Intel
// Engineer: Jean Kenned
// 
// Create Date:    14:56:35 03/14/2017 
// Design Name: 
// Module Name:    InstructionMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstructionMemory
 
(
	pc,
	instruction
);

	 input		[7:0]	pc;
    output 	[31:0] 	instruction;
	 reg	[31:0] instruction_memory [255:0];
	 integer i;
	 initial
	 begin
	 for(i=0;i<32;i=i+1)
		  instruction_memory[i]=0;

		  instruction_memory[0]=32'b11111111111111111111111111111111;
	 end
	
	 assign instruction = instruction_memory[pc];
	
 endmodule  

