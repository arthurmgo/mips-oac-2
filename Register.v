`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:33 03/14/2017 
// Design Name: 
// Module Name:    Register 
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
module Register(readReg1,readReg2,writeRegister,clk,writeData,readData1,readData2,regWrite);
            input[4:0]readReg1;
				input [4:0]readReg2;
				input [4:0]writeRegister;
            input [31:0]writeData;
				input regWrite;
				input clk;
				wire [31:0]readData1;
				wire [31:0]readData2;
				output [31:0]readData1;
				output [31:0]readData2;
				
				
				reg[31:0]RegMemory[0:31];
				
				integer i,j;
				initial begin 
				  for(i=0;i<32;i=i+1)
				  begin
				      for(j=0;j<32;j=j+1)
						begin
						    RegMemory[i][j]=1'b0;
						end
				  
				  end
				end
				
				assign  readData1 = RegMemory[readReg1];
			   assign  readData2 = RegMemory[readReg2];     
			   always @ (negedge clk)
            begin
				    if(regWrite==1'b1)
					 begin
					    RegMemory[writeRegister]=writeData;
					 end
				end
endmodule
