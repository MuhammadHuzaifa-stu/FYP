module FSM(input logic clk,ld,rst,stop, output logic en,shift);
	
	parameter S0 = 1'b0;
	parameter S1 = 1'b1;
	logic cs, ns;
	
	// NS
	always_comb 
	begin
		case(cs)
		S0: begin
			if (ld) ns = S1;
			else ns = S0;
			end
		S1: begin
			if (stop)  ns = S0;
			else ns = S1;
			end
		default begin
			ns = S0;
			end
		endcase
	end
	
	always_ff @(posedge clk) begin
		if (rst) cs <= S0;
		else cs <= ns;
	end
	
	//output logic
	always_comb 
	begin
		case(cs)
		S0: begin
			if (~ld) begin
				en = 0;shift = 0;
			end
			else if (ld) begin
				en = 1;shift = 0;
			end
			end
		S1: begin
			if (~stop) begin
				en = 0;shift = 1;
			end
			else if (stop) begin
				en = 0;shift = 0;
			end
			end
		endcase
	end 
endmodule