`timescale 10ns / 10ps
module Carry(s1,s0,cin);
	input s1, s0;
	output cin;
	assign #1 cin = (s1 ^s0);
endmodule
