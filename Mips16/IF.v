`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:29 03/29/2015 
// Design Name: 
// Module Name:    IF 
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


//Fetch Stage
module IF(clk, reset, din, branch_address, pc_src, inst_mem, wen, next_address, pc_reset, rd_en);

	input clk, reset, pc_src, wen, pc_reset, rd_en;
	input [8:0] branch_address;
	input [15:0] din; 
	
	output [15:0] inst_mem;
	output [8:0] next_address;
	
	reg[8:0] counter;
	reg[15:0] inst_mem;
	wire negclk = ~clk;
	wire[15:0] inst;
	assign next_address = counter + 1;
	
	
	
	//instruction memory
	//might need to place a read enable mux on inst output
	instruction_memory im (
		.addra(counter),
		.dina(din),
		.wea(wen),
		.rsta(reset),
		.clka(negclk),
		.douta(inst));
		
	always @* begin
		case(rd_en)
			1'b0:
				inst_mem = 16'h0000;
			1'b1:
				inst_mem = inst;
		endcase
	end
	
	always @(negedge clk or posedge reset or posedge pc_reset) begin
		if(reset || pc_reset) begin
			counter <= 9'b000000000;
		end
		else
			case (pc_src)
			1'b0: begin
				counter <= next_address;
			end
			1'b1: begin
				counter <= branch_address;
			end
		endcase
	end
	
endmodule
