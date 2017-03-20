`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:58 03/14/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(in,out,clk);
	input  [7:0]in; // sinal de entrada de 8 bits
	 input clk; // sinal de clock
	output [7:0]out; // sinal de saida de 8 bits
    reg [7:0]out;
	 initial begin
		 out = {8{1'b0}}; // o sinal de saida recebe 8 bits 'zero' (00000000)
	 end
	 always @ (negedge clk)
	 begin
	      out = in; // a cada passagem do clock o sinal de saida recebe o sinal de entrada
	 end
endmodule
