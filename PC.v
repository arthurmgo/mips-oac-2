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
    input  [7:0]in;
	 input clk;
	 output [7:0]out;
    reg [7:0]out;
	 initial begin
	      out = {8{1'b0}};
	 end
	 always @ (negedge clk)
	 begin
	      out = in;
	 end
endmodule
