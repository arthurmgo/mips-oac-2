`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:18 03/14/2017 
// Design Name: 
// Module Name:    Add1 
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
module Add1(r1,r2,rst,overflow); //Realiza a soma de dois registros de 8bits e retorna a soma e um bit de overflow
	input [7:0]r1; //Primeira entrada
	input [7:0]r2; //Segunda Entrada
	output [7:0]rst; //Saida
	reg [7:0]rst; 
	output overflow;  //Bit de Overflow
	reg overflow; 
	 
	always @ (r1,r2)begin 
		{overflow,rst} = r1+r2; 
    	end 
endmodule 
