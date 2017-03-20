`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:10 03/14/2017 
// Design Name: 
// Module Name:    Extensor 
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
module Extensor(r1,rst); //Este modulo recebe um sinal de entrada de 16 bits e o amplia para 32 bits.
	input r1;
	wire [15:0]r1; //Sinal de entrada de 16bits
	output rst;
	reg [31:0]rst;//Saida de 32bits
		
	always @ (r1)begin
		rst[31:16] <= {16{r1[15]}};//No sinal de saida os bits de 31 a 16 serão copia do bit mais significativo do sinal de entrada
		rst[15:0] <= r1[15:0];//Os bits de 15 a 0 do sinal de saida são o proprio sinal de entrada
		end
endmodule
