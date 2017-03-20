`timescale 1ns / 1ps

module Register(readReg1,readReg2,writeRegister,writeData,readData1,readData2,regWrite); /*Banco de Registradores com capacidade
										de realizar uma leitura ou escrita em um registrador*/
	input[4:0]readReg1; 
	input [4:0]readReg2;  
	input [4:0]writeRegister; 
	input [31:0]writeData; 
	input regWrite;   
	wire [31:0]readData1; 
	wire [31:0]readData2; 
	output [31:0]readData1; 
	output [31:0]readData2; 
				
				
	reg[31:0]RegMemory[0:31]; //Matriz que armazena os Registradores
				
	integer i,j; 
	initial begin  //Todos os Registradores iniciam com valor 0 
		for(i=0;i<32;i=i+1) begin 
			for(j=0;j<32;j=j+1) begin 
				RegMemory[i][j]=1'b0; 
			end 
		 end 
		RegMemory[17]=32'b00000000000000000000000000000100;  //valor iniciado para o registrador $s1
		RegMemory[18]=32'b00000000000000000000000000000001;  //valor iniciado para o registrador $s2
		RegMemory[23]=32'b00000000000000000000000000010001; //endereço de $s1
	end 
	
	
				
	assign  readData1 = RegMemory[readReg1]; // Retorno de um Registrador
	assign  readData2 = RegMemory[readReg2]; // Retorno de um Registrador    
				
	initial begin  
		if(regWrite==1'b1)  
			RegMemory[writeRegister]=writeData; // Escrita de um Registrador
	 	end  
			  
endmodule
