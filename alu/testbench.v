`timescale 10ns / 10ps

module Testbench;
	reg[3:0] a, b;
	reg s1, s0;
	wire[3:0] out;
	wire cout;
	wire[3:0] ain;
	wire cint;
	Alu UUT (a, b, s1, s0, out, cout, ain, cint);

	initial begin
		$monitor($time,," A=%b B=%b s1=%b s0=%b Ain=%b Cin=%b Sum=%b Cout=%b", a,b,s1,s0,ain,cint,out,cout);
		a = 4'b0100;
		b = 4'b0010;
		s1 = 1'b0;
		s0 = 1'b0;
		#20;
		
		a = 4'b0100;
		b = 4'b0010;
		s1 = 1'b0;
		s0 = 1'b1;
		#20;
		
		
//		$monitor($time," A=%b B=%b Cin=%b Sum=%b Cout==%b", a,b,cin,s,cout);

	end
endmodule
