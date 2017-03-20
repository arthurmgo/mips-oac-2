`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:04 03/14/2017 
// Design Name: 
// Module Name:    Multiplexador 
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
module Multiplexador(r1,r2,controle,rst);
    input r1; // sinal de entrada de 32 bits
	 input r2; // sinal de entrada de 32 bits
	 input controle; // sinal de controle de 2 bits
	 wire [31:0]r1;
	 wire [31:0]r2;
	 wire controle;
	 output rst; // sinal de saida de 32 bits
    reg [31:0]rst;
	 
	 always @ (r1,r2,controle)begin
	     case(controle)
		     1'b0: rst <= r1; // caso o sinal de controle seja 0, o sinal de saida receberá o primeiro sinal de entrada. Caso contrário, o sinal de saida receberá so segundo sinal de entrada
	        default: rst<= r2;
		  endcase
    end
endmodule
