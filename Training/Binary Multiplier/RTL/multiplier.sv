module multiplier(input logic clk,rst,ld,input logic [3:0]Ain,Bin,output logic [7:0] mul_out);
	
	logic stop,en,shift,Out,c;
	logic [3:0]a,Ad1;
	logic [7:0]sumext,sum,out_put;
	//FSM
	FSM f1 (.clk(clk),.ld(ld),.rst(rst),.stop(stop),.en(en),.shift(shift));
	
	//reg_a
	reg_a a1 (.clk(clk),.en(en),.rst(rst),.In(Ain),.Out(a));
	
	//reg_b
	reg_b b1 (.clk(clk),.shift(shift),.en(en),.rst(rst),.In(Bin),.Out(Out));
	
	//mux 2x1
	mux2x1 m1 (.a(a),.b(4'd0),.s(Out),.c(Ad1));

	//Adder
	adder ad1 (.a(sumext),.b(out_put),.sum(sum),.c(c));
	
	//counter
	counter ct1 (.clk(clk),.rst(rst),.shift(shift),.stop(stop));
	
	//8' shift register
	reg_C cr1 (.clk(clk),.shift(shift),.c(c),.en(en),.rst(rst),.In(sum),.Out(out_put));
	
	//sign extend
	signext se1 (.a(Ad1),.c(sumext));
	
	always_comb begin
		if (stop)
			mul_out = out_put;
	end
	
endmodule