`timescale 10ns / 10ps

module RippleCarryAdder (aRCA[3:0], bRCA[3:0], cinRCA, sRCA[3:0], coutRCA);
	input[3:0] aRCA, bRCA;
	input cinRCA;
	output[3:0] sRCA;
	output coutRCA;

	wire[3:0] cins, couts;
	
	Slice sliceInst[3:0] (aRCA, bRCA, cins, sRCA, couts);
	
	assign cins[0] = cinRCA;
	assign cins[3:1] = couts[2:0];
	assign coutRCA = couts[3];
endmodule
