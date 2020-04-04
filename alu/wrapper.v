`timescale 10ns /10ps
module Alu (a[3:0],b[3:0],s1,s0, out[3:0], cout, ain[3:0], cint);
	input[3:0] a,b;
	input s1, s0;
	output[3:0] out, ain;
	output cout, cint;
	wire[3:0] summand;
	wire cin;
	assign ain = summand;
	assign cint = cin;
	Mux mux (a[3:0], s1,s0, summand);
	Carry carry (s1, s0, cin);
	CarryLookAhead adder (summand, b, cin, out[3:0], cout);
endmodule
