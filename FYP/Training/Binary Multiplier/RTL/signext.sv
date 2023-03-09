//making Operand A a 8 bit number
module signext(input logic [3:0]a, output logic [7:0]c);
	assign c[7:4] = a;
	assign c[3:0] = 4'b0000;
endmodule