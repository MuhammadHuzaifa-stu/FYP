`timescale 1ps/1ps
module tb_multiplier;
	logic clk, rst, ld; logic [3:0]Ain, Bin; logic [7:0] mul_out;
	integer i , k = 20, m;
	
	multiplier DUT(clk,rst,ld,Ain,Bin,mul_out);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		for (i=0 ; i<k ; i=i+1) begin
			rst= 1;
			ld = 0;
			@(posedge clk);
			rst= 0;
			ld = 1;
			Ain= {$random} %16 ; 
			Bin= {$random} %16 ; 
			m = Ain*Bin;
			@(posedge clk);
			rst= 0;
			ld = 0;
			repeat(6) @(posedge clk);
			assert(m == mul_out) $display ("____test pass____");
		end
		$stop;
	end
endmodule
