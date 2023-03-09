//Counter to count uptill 4
//provides stop signal
module counter(input logic clk, rst, shift, output logic stop);
	logic [2:0]counter_up;
	always_ff @(posedge clk)
	begin
		if (rst) begin
			counter_up <= 3'd0;
			stop <= 1'b0;
		end
		if (shift) begin
			counter_up <= counter_up + 3'd1;
			stop <= 1'b0;
		end
		if (counter_up == 3'd4) begin
			stop <= 1'b1;
			counter_up <= 3'd0;
		end
	end 
endmodule