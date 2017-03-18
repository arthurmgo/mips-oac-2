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
module Add1(r1,r2,rst,overflow);
    input [7:0]r1;
	 input [7:0]r2;
	 output [7:0]rst;
	 reg [7:0]rst;
	 output overflow;
	 reg overflow;
	 
	 always @ (r1,r2)begin
	    {overflow,rst} = r1+r2;
    end
endmodule
