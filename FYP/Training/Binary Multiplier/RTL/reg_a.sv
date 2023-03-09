//Operand A (4 bits)
module reg_a(input logic clk, en, rst,input logic [3:0]In,output logic [3:0]Out);
	
	always_ff @(posedge clk) begin
		if (rst)
			Out <= 4'b0;
		else if(en)
			Out <= In;
	end
	
endmodule
