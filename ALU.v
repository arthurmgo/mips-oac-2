// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(r1,r2,rst,zero,controle);
	 input r1;
	 input r2;
	 input controle;
	 wire [31:0]r1;
	 wire [31:0]r2;
	 wire [3:0]controle;
    output rst;
    output wire zero;
	 
	 reg [31:0]rst;
	 assign zero = (r1==r2);
	 always @ (r1,r2,controle)begin
	    case(controle)
	        4'b0000: rst <= r1 & r2;
		     4'b0001: rst <= r1| r2;
		     4'b0010: rst <= r1 + r2;
		     4'b0110: rst <= r1 - r2;
		     4'b0111: rst <= (r1 < r2);
		     4'b1100: rst <= ~|(r1 | r2);
		     default: rst <= 32'b0;
       endcase
	 end	 
endmodule
