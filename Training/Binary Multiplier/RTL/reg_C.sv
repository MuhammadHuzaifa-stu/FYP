//an 8 bit shift register
//it holds final value after multiplication
module reg_C(input logic clk,shift,c,en,rst,input logic [7:0]In,output logic [7:0]Out);
	
	always @(posedge clk) begin
		if (rst)
			Out <= 8'd0;
		if(en) begin
			Out <= In;
		end
		if (shift) begin
			Out <= {c,In[7:1]};
		end
	end
endmodule
