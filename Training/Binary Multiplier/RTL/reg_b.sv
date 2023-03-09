//Operand B (4 bits)
//Used as a shift register and it starts shifting as "shift" gets asserted by controller
module reg_b(input logic clk, shift, en, rst,input logic [3:0]In,output logic Out);
	logic [3:0]tmp;
	always_ff @(posedge clk) begin
		
		if (rst) begin
			Out <= 1'b0;
			tmp <= 4'd0;
		end
		else if(en) begin
			tmp <= In;
		end
		else if (shift) begin
			Out <= tmp[0];
			tmp <= {1'b0,tmp[3:1]};
		end
	end
endmodule
