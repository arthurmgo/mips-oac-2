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


	 input wire	[7:0]	pc;
    output reg	[31:0] 	instruction;
	 reg	[31:0] instruction_memory [255:0];
	 integer i; 
	 initial
	 begin
	 for(i=0;i<256;i=i+1) begin
		  instruction_memory[i]=0;
	 end 
                                                                                   //deve-se Inicializar $s1 e $s2(valores)!!			//deve-se Inicializar $s7(endereço)
		    instruction_memory[0]=32'b00000010001100101000000000100000;  //add $s0,$s1,$s2(18)  4+1 (16) 		 
		    instruction_memory[1]=32'b00100010001101000000000000000011;  //addi $s4,$s1,3   4+3 (20)
		    instruction_memory[2]=32'b00000010000100001011000000100100;  //and $s6,$s0,$s0  //5  (22)
		    instruction_memory[3]=32'b00000010100100001010100000100101;  //or $s5,$s4,$s0  // 7 (21)
			 //ate aqui esta correto 
		   instruction_memory[4]=32'b00010010001100010000000000000001;  //beq $s1,$s1, deveria pular uma instrucao
			instruction_memory[5]=32'b00000010101100101000000000100000;  //add $s0,$s5,$s2 //7 + 1  (16)

		   //  instruction_memory[7]=32'b00100010001100000000000000000011;  //addi $s3,$s0,3   // 7+3=10  (19)
		  // instruction_memory[6]=32'b00010110000100010000000001000000;  //bne $s0,$s1,pula 2 instrucoes  
		   //instruction_memory[6]=32'b00000010001100101000000000100000;  //add $s0,$s1,$s2
		    instruction_memory[6]=32'b00100010000100110000000000000011;  //addi $s3,$s0,3 //5+3 (19)
		//  instruction_memory[10]=32'b10001110111100100000000000000000;  //lw $s2,0($s7)
		//  instruction_memory[11]=32'b10101110111100010000000000000000;   //sw $s1,0($s7)
		//  instruction_memory[12]=32'b00000010001100101000000000101010;   //slt $s0,$s1,$s2 
		//  instruction_memory[13]=32'b00101010010100000000000000001000;   //slti $s0,$s2,8   s2 é menor que 8?
		  
		  
	 end
	
always@(pc)begin
     instruction = instruction_memory[pc];
	  
end	
 endmodule  

