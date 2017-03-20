// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(r1,r2,rst,zero,controle); // Este modulo recebe dois sinais de entrada de 32 bits e um sinal de controle de 4 bits. E a partir do sinal de controle, será decido qual operação deve ser realizado entre os dois sinais de 32 bits de entrada. Assim emitindo um sinal de saida de 32 bits.
	 input r1; //sinal de entrada de 32 bits
	 input r2; //sinal de entrada de 32 bits
	 input controle; //sinal de controle de 4 bits
	 wire [31:0]r1;
	 wire [31:0]r2;
	 wire [3:0]controle;
    output rst; //sinal de saida de 32 bits
    output wire zero;
	 
	 reg [31:0]rst;
	 assign zero = (r1==r2);
	 always @ (r1,r2,controle)begin
	    case(controle)
	        4'b0000: rst <= r1 & r2;
		     4'b0001: rst <= r1| r2; // Essa operação será realizada entre os dois sinais de entrada, caso o sinal de controle seja 0000 e gerando um sinal de saida resultante
		     4'b0010: rst <= r1 + r2; // Essa operação será realizada entre os dois sinais de entrada, caso o sinal de controle seja 0010 e gerando um sinal de saida resultante
		     4'b0110: rst <= r1 - r2; // Essa operação será realizada entre os dois sinais de entrada, caso o sinal de controle seja 0110 e gerando um sinal de saida resultante
		    4'b0111: rst <= (r1 < r2); // Essa operação será realizada entre os dois sinais de entrada, caso o sinal de controle seja 0111 e gerando um sinal de saida resultante
		    4'b1100: rst <= ~|(r1 | r2); // Essa operação será realizada entre os dois sinais de entrada, caso o sinal de controle seja 1100 e gerando um sinal de saida resultante
		     default: rst <= 32'b0; // Sinal de saida padrão, caso nao seja identificado os casos acima
       endcase
	 end	 
endmodule
