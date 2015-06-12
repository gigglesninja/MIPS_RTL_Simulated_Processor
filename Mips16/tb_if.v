`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:45 04/09/2015 
// Design Name: 
// Module Name:    tb_if 
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
module tb_if;

	reg clk;
	reg reset;
	
	reg [15:0] din;
	reg [8:0] branch_adder;
	reg pc_src;
	reg wen, pc_reset, en, rd;
	
	wire [15:0] inst;
	wire [8:0] next_address;
	 
	
	IF uut(
		.clk (clk), //in 
		.reset (reset),  //in
		.din (din), //in
		.branch_address (branch_adder), //in 
		.pc_src(pc_src), //in 
		.inst_mem(inst), //out
		.wen(wen), //in
		.next_address(next_address), //out
		.pc_reset(pc_reset),
		.rd_en(rd)); //in
		
	initial begin
		clk = 0;
		#100
		forever #20 clk = ~clk;
	end
	
	initial begin
		clk = 0;
		reset = 1;
		din = 16'h0000;
		pc_src = 0;
		branch_adder = 9'b000000000; 
		pc_reset = 0;
		en = 0;
		rd = 0;
		#100;
		reset = 0;
		wen = 1;
		@(posedge clk);
		$display("loading to IM", $time());
		din = 16'h0001;
		@(posedge clk);
		din = 16'h0002;
		@(posedge clk);
		din = 16'h0003;
		@(posedge clk);
		din = 16'h0004;
		@(posedge clk);
		din = 16'h0005;
		@(posedge clk);
		din = 16'h0000;
		wen = 0;
		pc_reset = 1;
		@(negedge clk);
		pc_reset = 0;
			$display("testing", $time());
		@(negedge clk);
		rd = 1;
		@(posedge clk);
		if(inst != 16'h0001)
			$display("failed expected 1 got %d ", inst, $time());
		else
			$display("got %d", inst, $time());
		@(negedge clk);
		@(posedge clk);
		if(inst != 16'h0002)
			$display("failed expected 2 got %d ", inst, $time());
		else
			$display("got %d", inst, $time());
		@(posedge clk);
		if(inst != 16'h0003)
			$display("failed expected 3 got %d ", inst, $time());
		else
			$display("got %d", inst, $time());
		@(posedge clk);
		if(inst != 16'h0004)
			$display("failed expected 4 got %d ", inst, $time());
		else
			$display("got %d", inst, $time());
		@(posedge clk);
		if(inst != 16'h0005)
			$display("failed expected 5 got %d ", inst, $time());
		else
			$display("got %d", inst, $time());
		pc_src = 1;
		branch_adder = 9'b000000011;
		//this is a problem
		@(posedge clk);
		pc_src = 0;
		if(inst != 16'h0003)
			$display("failed expected 3 got %d ", inst, $time());
		else
			$display("got %d", inst, $time());
			
	end

endmodule
