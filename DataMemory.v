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
		input wire			clk,
		input wire	[15:0]	addr,
		input wire			rd, wr,
		input wire 	[31:0]	wdata,
		output wire	[31:0]	rdata);

	reg [31:0] mem [0:127];  // 32-bit memory with 128 entries

   initial begin
	    /*integer i;
	    for(i=0;i<128;i=1+1)begin
	        mem[i] = 32'b0;
	    end
		 */
		 
		 mem[17]=32'b00000000000000000000000000001111; //Inicia esse endereço com um dado qualquer
	end

	always @(posedge clk) begin
		if (wr) begin
			mem[addr] <= wdata;
		end
	end

	assign rdata = wr ? wdata : mem[addr][31:0];
	// During a write, avoid the one cycle delay by reading from 'wdata'

endmodule

