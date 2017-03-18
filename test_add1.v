`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:00:01 03/14/2017
// Design Name:   Add1
// Module Name:   C:/Users/home/ProjetosISE/TP-OAC/test_add1.v
// Project Name:  Teste
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Add1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_add1;

	// Inputs
	reg [31:0] r1;
	reg [31:0] r2;

	// Outputs
	wire [31:0] rst;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	Add1 uut (
		.r1(r1), 
		.r2(r2), 
		.rst(rst), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		r1 = 0;
		r2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      r1 = 00000000000000000000001111111111;
		r2 = 00000000000000000000001000000000;
	end
      
endmodule

