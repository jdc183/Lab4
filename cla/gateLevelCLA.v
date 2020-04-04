`timescale 10ns/10ps

module _3and (out, x,y,z);
	input x,y,z;
	output out;
	assign out = x&y&z;
endmodule

module _4and (out, x,y,z,w);
	input x,y,z,w;
	output out;
	assign out = x&y&z&w;
endmodule

module _5and (out, x,y,z,w,v);
	input x,y,z,w,v;
	output out;
	assign out = x&y&z&w&x;
endmodule

module _3or (out, x,y,z);
	input x,y,z;
	output out;
	assign out = x|y|z;
endmodule

module _4or (out, x,y,z,w);
	input x,y,z,w;
	output out;
	assign out = x|y|z|w;
endmodule

module _5or (out, x,y,z,w,v);
	input x,y,z,w,v;
	output out;
	assign out = x|y|z|w|v;
endmodule

module GateLevelCLA (
	a[3:0],
	b[3:0],
	cin,
	s[3:0],
	cout
	);
	
	input[3:0] a, b;
	input cin;
	output[3:0] s;
	output cout;
	
	wire[3:0] p, g, c;
	
	wire p0c,
	p1g0, 
	p1p0c, 
	p2g1, 
	p2p1g0, 
	p2p1p0c, 
	p3g2, 
	p3p2g1, 
	p3p2p1g0, 
	p3p2p1p0c;
	
	xor #1 xor1[3:0] (p[3:0], a[3:0],  b[3:0]);
	and #1 and1[3:0] (g[3:0], a[3:0], b[3:0]);
	
	and #1 and2 (p0c, p[0], cin);
	and #1 and3 (p1g0, p[1], g[0]);
	_3and #1 and4 (p1p0c, p[1], p[0], cin);
	assign #1 p2g1 = p[2] & g[1];
	assign #1 p2p1g0 = p[2] & p[1] & g[0];
	assign #1 p2p1p0c = p[2] & p[1] & p[0] & cin;
	assign #1 p3g2 = p[3] & g[2];
	assign #1 p3p2g1 = p[3] & p[2] & g[1];
	assign #1 p3p2p1g0 = p[3] & p[2] & p[1] & g[0];
	assign #1 p3p2p1p0c = p[3] & p[2] & p[1] & p[0] & cin;
	
	assign #1 c[0] = g[0] | p0c;
	assign #1 c[1] = g[1] | p1g0 | p1p0c;
	assign #1 c[2] = g[2] | p2g1 | p2p1g0 | p2p1p0c;
	assign #1 c[3] = g[3] | p3g2 | p3p2g1 | p3p2p1g0 | p3p2p1p0c;
	
	assign #1 s[3:0] = p[3:0] ^ {c[2:0], cin};
	
	assign cout = c[3];
	
	
	
endmodule
