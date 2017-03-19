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
                                                                     //deve-se Inicializar $s1 e $s2!!!
																							//deve-se Inicializar $s7
		  instruction_memory[0]=32'b00000010001100101000000000100000;  //add $s0,$s1,$s2
		  instruction_memory[1]=32'b00100010001100000000000000000011;  //addi $s3,$s0,3
		  instruction_memory[2]=32'b00000010011100001010000000100100;  //and $s4,$s3,$s0
		  instruction_memory[3]=32'b00000010011100001010100000100101;  //or $s5,$s3,$s0
		  instruction_memory[4]=32'b00010010001100010000000001000000;  //beq $s1,$s1,pula 2 instrucoes 
		  instruction_memory[5]=32'b00010110000100010000000001000000;  //bne $s0,$s1,pula 2 instrucoes
		  instruction_memory[6]=32'b10001110111100100000000000000000;  //lw $s2,0($s7)
		  instruction_memory[7]=32'b11111111111111111111111111111111;
		  instruction_memory[8]=32'b11111111111111111111111111111111;
		  instruction_memory[9]=32'b11111111111111111111111111111111;
		  instruction_memory[10]=32'b11111111111111111111111111111111;
		  
	 end
	
	 assign instruction = instruction_memory[pc];
	
 endmodule  

