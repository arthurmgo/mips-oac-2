`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:01 03/14/2017 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
		input wire			clk, // sinal de clock
	input wire	[15:0]	addr, // sinal de entrada de 16 bits
		input wire			rd, wr, 
	input wire 	[31:0]	wdata,  // sinal de entrada de 32 bits
	output wire	[31:0]	rdata);  // sinal de saida de 32 bits

	reg [31:0] mem [0:127];  // 32 bits de memoria com 128 entradas

	always @(posedge clk) begin
		if (wr) begin
			mem[addr] <= wdata; // Armazena os sinais de entrada de 32 bits no 'vetor' de memoria
		end
	end

	assign rdata = wr ? wdata : mem[addr][31:0];
	// Durante uma escrita, evite o atraso de um ciclo lendo de 'wdata'

endmodule

