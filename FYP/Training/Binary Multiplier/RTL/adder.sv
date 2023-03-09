module adder(input logic [7:0]a,b, output logic [7:0]sum, output logic c);	
	assign {c, sum} = a + b;
endmodule
