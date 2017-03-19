`timescale 1ns / 1ps

module Teste_banch;

	// Inputs
	reg [7:0] in;
	reg clk;

	// Outputs
	wire [7:0] out;
   wire [31:0]i_buscada;
	wire branch_eq,branch_ne;
	wire memread, memwrite, memtoreg;
	wire regdst, regwrite, alusrc;
	wire [1:0]aluop;
	
	
	// Instantiate the Unit Under Test (UUT)
	PC uut (
		 .in(in), 
		.out(out), 
		.clk(clk)
	);
	InstructionMemory i1(.pc(out),.instruction(i_buscada));
	
   Control c1(.opcode(i_buscada[31:26]),.branch_eq(branch_eq),.branch_ne(branch_ne),.memread(memread),
   .memwrite(memwrite),.memtoreg(memtoreg),.regdst(regdst),.regwrite(regwrite),.alusrc(alusrc),.aluop(aluop));
	 
	Register r1()
	
	 input[4:0]readReg1;
				input [4:0]readReg2;
				input [4:0]writeRegister;
            input [31:0]writeData;
				input regWrite;
				input clk;
				wire [31:0]readData1;
				wire [31:0]readData2;
				output [31:0]readData1;
				output [31:0]readData2;
				
	
	
	
	
	
	
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here  
	end
      
      
endmodule

