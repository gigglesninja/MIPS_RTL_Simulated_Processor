`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:03:51 04/10/2015 
// Design Name: 
// Module Name:    tb_Mips16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tb_Mips16(
    );
	 
	reg clk;
	reg reset;
	
	reg [15:0] din;
	reg pc_src;
	reg wen, pc_reset, rd;
	
	wire[15:0] dout; 
	`define ADDI   16'h2081 //these load in values to the registers
	`define ADDI1  16'h2102
	`define ADDI2  16'h2183
	`define ADDI3  16'h2204
	`define ADDI4  16'h2285
	`define ADDI5  16'h2306
	`define ADDI6  16'h2387
	

	Mips16 uut(
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.dout(dout), 
		.pc_reset(pc_reset), 
		.rd_en(rd), 
		.wen(wen));
	
	initial begin
		clk = 0;
		#100
		forever #15 clk = ~clk;
	end
	
	
	initial begin
		clk = 0;
		reset = 1;
		din = 16'h0000;
		pc_src = 0;
		pc_reset = 0;
		rd = 0;
		#100;
		reset = 0;
		wen = 1;
		@(posedge clk);
		$display("loading to IM", $time());
		din = `ADDI;  //save 1 in a
		@(posedge clk);
		din = `ADDI1; //save 2 in b
		@(posedge clk);
		din = `ADDI2; //save 3 in c
		@(posedge clk);
		din = `ADDI3; //save 4 in d
		@(posedge clk);
		din = `ADDI4; //save 5 in e
		@(posedge clk);
		din = `ADDI5; //save 6 in f
		@(posedge clk);
		din = `ADDI6; //save 7 in g
		@(posedge clk);
		din = 16'h541; //add 1 + 2 save in d :: a=1 , b=2, c=3, d=3, e=5 , f=6, g=7
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h1E12; //sub 7 - 3 save in a :: a=4 , b=2, c=3, d=3, e=5 , f=6, g=7
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h19A2; //sub 6-3 save in b :: a=3 , b=3, c=3, d=3, e=5 , f=6, g=7
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'hC61;  //add 3 + 0 save in f :: a=3 , b=3, c=3, d=3, e=5 , f=3, g=7
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h6D7; //shift 5 by 1 store in e :: a=3 , b=3, c=3, d=3, e=5 , f=3, g=7
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h3681; //add 1 to e store in e :: a=3 , b=3, c=3, d=3, e=3 , f=3, g=7
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h0000; //no op
		@(posedge clk);
		din = 16'h1E72; //sub 7-3 store in g :: a=3 , b=3, c=3, d=3, e=3 , f=3, g=4
		@(posedge clk);
		din = 16'h0000; //no op
		
		///-----------------------------------
		//everthing before this works, currently I instructions, 
		
		//------------------------------------------------
		//start looking at results
		@(posedge clk);
		$display("loading finished", $time());
		din = 16'h0000;
		wen = 0;
		pc_reset = 1;
		@(negedge clk);
		pc_reset = 0;
			$display("testing", $time());
		@(posedge clk);
		rd = 1;
		//this is just to loop the output
		while (dout != 1234) begin
			@(posedge clk);
				$display("%d", dout, $time());
		end
//		if(inst != 16'h0001)
//			$display("failed expected 1 got %d ", inst, $time());
//		else
//			$display("got %d", inst, $time());
//		@(negedge clk);
//		@(posedge clk);
//		if(inst != 16'h0002)
//			$display("failed expected 2 got %d ", inst, $time());
//		else
//			$display("got %d", inst, $time());
//		@(posedge clk);
//		if(inst != 16'h0003)
//			$display("failed expected 3 got %d ", inst, $time());
//		else
//			$display("got %d", inst, $time());
//		@(posedge clk);
//		if(inst != 16'h0004)
//			$display("failed expected 4 got %d ", inst, $time());
//		else
//			$display("got %d", inst, $time());
//		@(posedge clk);
//		if(inst != 16'h0005)
//			$display("failed expected 5 got %d ", inst, $time());
//		else
//			$display("got %d", inst, $time());
//		pc_src = 1;
//		branch_adder = 9'b000000011;
//		//this is a problem
//		@(posedge clk);
//		pc_src = 0;
//		if(inst != 16'h0003)
//			$display("failed expected 3 got %d ", inst, $time());
//		else
//			$display("got %d", inst, $time());
			
	end
endmodule
