`timescale 1ns / 1ps

module Teste_banch;

	// Inputs
	//reg [7:0] in;
	
	//reg [31:0]writedata;
   reg [7:0]valorum;
	reg controle_mul8;
	//reg zero;
	//reg [7:0]saida_mul8;
	// Outputs
	 
	//pc
	   
	reg clk;
	wire [7:0]addr;
	//InstructionMemory
   wire [31:0]i_buscada;
	
	//control
	wire branch_eq,branch_ne;
	wire memread, memwrite, memtoreg;
	wire regdst, regwrite, alusrc;
	wire [1:0]aluop;
	
	//MultiplexadorDst
	wire [4:0]rst;
	
	//register
	wire [31:0]readdata1;
	wire [31:0]readdata2;
	
	//Extensor
	wire [31:0]sinal_extendido;
	
	//Multiplexador
	wire [31:0]entrada2_ALU;
	
	//ALUControl
	wire [3:0]saida_alucontrol;
	
	//ALU
	wire [31:0]saida_alu;
	wire zero;
	
	//dataMemory
	wire [31:0]saida_datamemory;
	
	//multiplexador m3
	// Será writedata -> entrada do register
	wire [31:0]writedata;
	
	//Shift
	wire [31:0]saida_shift;
	
	//primeiro somador
	wire [7:0]saida_add1;
	
	//segundo somador
	wire [7:0]saida_add2;

	//Multiplexador mul8
	wire[7:0]saida_mul8;
	
	// Instantiate the Unit Under Test (UUT)
	//Parte PC
	PC uut (
		 .in1(saida_mul8),
      .in2(8'b00000000),		 
		.out(addr), 
		.clk(clk)
	);
	InstructionMemory i1(.pc(addr),.instruction(i_buscada));
	
   Control c1(.opcode(i_buscada[31:26]),.branch_eq(branch_eq),.branch_ne(branch_ne),.memread(memread),.memwrite(memwrite),.memtoreg(memtoreg),.regdst(regdst),.regwrite(regwrite),.alusrc(alusrc),.aluop(aluop));
	 
	MultiplexadorDst m1(.r1(i_buscada[20:16]),.r2(i_buscada[15:11]),.controle(regdst),.rst(rst));
	
	Extensor ex(.r1(i_buscada[15:0]),.rst(sinal_extendido));
	
	Multiplexador m2(.r1(readdata2),.r2(sinal_extendido),.controle(alusrc),.rst(entrada2_ALU));
	
	ALUControl alcon(.funct(i_buscada[5:0]),.aluop(aluop),.aluct(saida_alucontrol));
	///////                                                      
	ALU al(.r1(readdata1),.r2(entrada2_ALU),.branch_eq(branch_eq),.branch_neq(branch_ne),.controle(saida_alucontrol),.rst(saida_alu),.zero(zero));
	
	DataMemory dm(.clk(clk),.addr(saida_alu[15:0]),.rd(memread),.wr(memwrite),.wdata(readdata2),.rdata(saida_datamemory));
	
	Multiplexador m3(.r1(saida_alu),.r2(saida_datamemory),.controle(memtoreg),.rst(writedata));
	
	Register r1(.readReg1(i_buscada[25:21]),.readReg2(i_buscada[20:16]),.writeRegister(rst),
	.writeData(writedata),.readData1(readdata1),.readData2(readdata2),.regWrite(regwrite));
	
	//Shift sh(.in(sinal_extendido),.out(saida_shift));
	
	Add1 primeiroAdd(.r1(addr),.r2(valorum),.rst(saida_add1));
	
	Add1 segundoAdd(.r1(saida_add1),.r2(sinal_extendido[7:0]),.rst(saida_add2));
	
	Mul8 m4(.r1(saida_add1),.r2(saida_add2),.controle(controle_mul8),.rst(saida_mul8));
	 
	   
	 
	initial begin
		// Valor que precisam ser inicializados
		//addr = 8'b00000000; // Considera que a primeira instrução esteja no endereço 0.
		clk = 0;
		//talvez seja necessario writedata ser um reg
		//writedata=32'b0;
		valorum = 8'b00000001; //Valor utilizado no primeiro somador para incrementar pc+4
		//saida_mul8 = 8'b0;
		
		// Wait 100 ns for global reset to finish  ( Não sei o que isso faz!)
		#100;
		
		// Add stimulus here  
	end
        
		always begin
		   #100 clk = !clk;  //Gera um clock
			
		end
		 
		always @(branch_eq or branch_ne or zero)
		begin
		   if(i_buscada[26]==1'b0)begin
             controle_mul8 = branch_eq & zero;
				 
         end else begin
            controle_mul8 = branch_ne & zero;
				end
      end
		
      
endmodule

