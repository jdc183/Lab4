`timescale 10ns / 10ps
module Mux( a[3:0], s1, s0, o[3:0]);
	input[3:0] a;
	input s1, s0;
	output[3:0] o;

	wire[3:0] an, zer, one, add, sub, inc, dec, s1a, s0a, s1n, s0n;
	
	assign an = ~a;
	assign zer = 4'b0000;
	assign one = 4'b1111;
	
	assign #1 s1a = {s1,s1,s1,s1};
	assign #1 s0a = {s0,s0,s0,s0};
	assign #1 s1n = ~s1a;
	assign #1 s0n = ~s0a;
	
	assign #1 add = a&s1n&s0n;
	assign #1 sub = an&s1n&s0a;
	assign #1 inc = zer&s1a&s0n;
	assign #1 dec = one&s1a&s0a;
	
	assign #1 o[3:0] = add|sub|inc|dec;
	//assign #1 cin = ~(s1^s0);
endmodule
