`timescale 1ns / 10ps

module Testbench;
	reg[3:0] a, b;
	reg cin;
	wire[3:0] s;
	wire cout;
	
	RippleCarryAdder UUT (a, b, cin, s, cout);

	initial begin
		$monitor($time,," A=%b B=%b Cin=%b Sum=%b Cout=%b", a,b,cin,s,cout);
		a = 4'b1111;
		b = 4'b0000;
		cin = 0;
		#20;
		
		a = 4'b1111;
		b = 4'b0000;
		cin = 1;
		#20;
		
		
//		$monitor($time," A=%b B=%b Cin=%b Sum=%b Cout==%b", a,b,cin,s,cout);

	end
endmodule
