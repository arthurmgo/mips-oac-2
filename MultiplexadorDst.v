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
module MultiplexadorDst(r1,r2,controle,rst);
    input r1;
	 input r2;
	 input controle;
	 wire [4:0]r1;
	 wire [4:0]r2;
	 wire controle;
	 output rst;
    reg [4:0]rst;
	 
	 always @ (r1 or r2 or controle)begin
	     case(controle)
		     1'b0: rst <= r1;
	        default: rst<= r2;
		  endcase
    end
endmodule
