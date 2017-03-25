module Mul8(r1,r2,controle,rst);
    input r1; //MenToReg a ordem ir� mudar!!!
	 input r2;
	 input controle;
	 wire [7:0]r1;
	 wire [7:0]r2;
	 wire controle;
	 output rst;
    reg [7:0]rst;

	 always @ (r1 or r2 or controle)begin
	     case(controle)
		     1'b0: rst <= r1;
	        1'b1: rst<= r2;
		  endcase
    end
endmodule
