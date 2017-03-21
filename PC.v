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
module PC(in1,in2,out,clk);
    input wire [7:0]in1;
	 input wire [7:0]in2;
	 input wire clk;
	 output [7:0]out;
    reg [7:0]out;
	 initial begin
	     out = in2;
		  $monitor("out initial: %b",out);
     end
	 always @ (posedge clk)
	 begin
	      out = in1;
			$monitor("out: %b",out);
	 end
endmodule
