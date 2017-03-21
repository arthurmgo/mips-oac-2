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
module Extensor(r1,rst);
      input r1;
		wire [15:0]r1;

      output rst;
		reg [31:0]rst;
		
		always @ (r1)begin
		   rst[31:16] <= 16'b0000000000000000;
			rst[15:0] <= r1[15:0];
		end
endmodule
