`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:11 03/14/2017 
// Design Name: 
// Module Name:    Shift 
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
module Shift(in,out);
   input [31:0]in;
	output [31:0]out;
	reg [31:0]out;
   
	always @ (in)begin
	   out = in<<2;
   end
endmodule
