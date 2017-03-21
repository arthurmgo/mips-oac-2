`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:20 03/14/2017 
// Design Name: 
// Module Name:    ALUControl 
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
module ALUControl(funct,aluop,aluct);

   input wire [5:0] funct;
   input wire [1:0] aluop;
	output reg [3:0] aluct;


	always @(*) begin
	
	   if(aluop==2'b00)
	      aluct = 4'b0010;
		else if(aluop==2'b01)
		   aluct = 4'b0110;
		else
		case(funct[5:0])
			6'b100000:  aluct = 4'b0010;	/* add */
			6'b100010:  aluct = 4'b0110;	/* sub */
			6'b100100:  aluct = 4'b0000;	/* and */
			6'b100101:  aluct= 4'b0001;	/* or*/
			6'b101010:  aluct = 4'b0111;	/* slt */
			
			default: aluct = 4'b1111;
		endcase
	end

	

endmodule
