`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:21 04/09/2015 
// Design Name: 
// Module Name:    DATA 
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
module DATA(clk, reset, alu_result, read_data, mem_write, write_data
    );

	input[15:0] alu_result, write_data;
	input mem_write, clk, reset;
	
	output[15:0] read_data;
	wire[8:0] addr = alu_result[8:0];	
	data_memory dm(
		.addra(addr),
		.dina(write_data),
		.wea(mem_write),
		.clka(~clk),
		.douta(read_data),
		.rsta(reset));

endmodule
