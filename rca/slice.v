//A full-adder slice of a ripple carry adder

`timescale 1ns / 10ps

module Slice (
	a, b, cin,
	s, cout
	);
	input a, b, cin;
	output s, cout;

	wire p, g, h;
	
	assign #1 p = a ^ b;
	assign #1 g = a & b;

	assign #1 s = p ^ cin;
	assign #1 h = (p & cin);
	assign #1 cout = h | g;

endmodule

/*               Schematic
           _____
a --+-----\\    \          _____
    |      ))XOR )--p--+--\\    \
b --|--+--//____/      |   ))XOR )--s
cin-|--|------------+--|--//____/
    |  |            |  |   _____
    |  |            |  +--|     \   _____ 
    |  |   _____    |     | AND  )--\    \
    |  +--|     \   +-----|_____/    )OR  )--cout
    |     |  AND )--g---------------/____/
    +-----|_____/      
*/
