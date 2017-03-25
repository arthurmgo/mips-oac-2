// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(r1,r2,branch_eq,branch_neq,rst,zero,controle);
	 input r1;
	 input r2;
	 input controle;
	 input branch_eq;
	 input branch_neq;
	 wire branch_eq;
	 wire branch_neq;
	 wire [31:0]r1;
	 wire [31:0]r2;
	 wire [3:0]controle;
    output rst;
    output reg zero;
	 
	 reg [31:0]rst;
	 
	 always@(r1 or r2 or branch_eq or branch_neq)begin
	     if(branch_eq==1'b1)
	        zero = (r1==r2);
	     else if(branch_neq==1'b1)
	        zero = (r1!=r2);
	     else
	        zero = 1'b0;
	 end
	 
	 always @ (r1 or r2 or controle)begin
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
