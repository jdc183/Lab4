`timescale 10ns/10ps

module CarryLookAhead (
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
	
	assign #1 p[3:0] = a[3:0] ^ b[3:0];
	assign #1 g[3:0] = a[3:0] & b[3:0];
	
	assign #1 p0c = p[0] & cin;
	assign #1 p1g0 = p[1] & g[0];
	assign #1 p1p0c = p[1] & p[0] & cin;
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
	
	assign #1 s[3:0] = p[3:0] ^ {c[2:0],cin};
	
	assign cout = c[3];
	
	
	
endmodule
