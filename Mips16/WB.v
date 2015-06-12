`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Mighty MIPsters
// Engineer: James Tate
// 
// Create Date:     22:27:02 04/03/2015 
// Design Name: MIPS decode module
// Module Name:    ID 
// Project Name: MIPS 16 bit
//////////////////////////////////////////////////////////////////////////////////
module WB(
	memtoreg,
	rd_data_mem,
	rd_data_alu,
	write_data
    );
input memtoreg;
input [15:0] rd_data_mem, rd_data_alu;
output [15:0] write_data;

reg[15:0] write_data;

always @* begin
	write_data = rd_data_alu;
	case(memtoreg)
		1'b1:
			write_data = rd_data_mem;
	endcase
end

endmodule
