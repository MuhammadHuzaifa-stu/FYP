//Operand a comes from register a only
//Operand b is hardwired to 4'd0
//because whenever last bit of Operand(register) B becomes "0" it will send 0 to adder
module mux2x1(input logic [3:0]a,b,input logic s, output logic [3:0]c);
	assign c = s ? a : b;
endmodule