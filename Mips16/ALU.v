`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:24 04/05/2015 
// Design Name: 
// Module Name:    ALU 
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
/*
Name | Opcode | Funct
add  | 000    | 0001
sub  | 000    | 0010
addi | 001	  | ----
and  | 000    | 0011
or   | 000	  | 0100
ori  | 010	  | ----
xor  | 000    | 0101
slt  | 000    | 0110
slti | 011    | ----
sll  | 000	  | 0000
srl  | 000    | 0111
lw   | 110    | ----
sw   | 111    | ----

*/
module ALU(data_1, data_2, opcode, funct, alu_result, zero);

input [15:0] data_1, data_2;
input [2:0] opcode;
input [3:0] funct;
output [15:0] alu_result;
output zero;


// add control signal logic
// add defaults to zero
// add is asserted during add, addi, lw, sw
reg add;
always @* begin
	add = 0;
	if ((opcode == 3'b000 && funct == 4'b0001) || (opcode == 3'b001) || (opcode == 3'b110) || (opcode == 3'b111)) begin
		add = 1;
	end
end

// Adder/subtractor unit
// The adder/subtractor unit does not contain any form of error detection.
// Therefore signed overflow and underflow are possible with this implementation.
wire [15:0] adder_out;
adder addsub (.add(add), .a(data_1), .b(data_2), .s(adder_out));

// Adder for determining memory locations
wire [15:0] mem_adder_out;
word_adder mem_adder(.a(data_1), .b(data_2), .s(mem_adder_out));

// Alu_result output logic
reg [15:0] alu_result;
always @* begin
	alu_result = 16'h0000;
	// add, sub, addi output set
	if ((opcode == 3'b000 && (funct == 4'b0001 || funct == 4'b0010)) || (opcode == 3'b001)) begin
		alu_result = adder_out;
	end
	// and output set
	else if (opcode == 3'b000 && funct == 4'b0011) begin
		alu_result = (data_1 & data_2);
	end
	// or, ori output set
	else if ((opcode == 3'b000 && funct == 4'b0100) || (opcode == 3'b010)) begin
		alu_result = (data_1 | data_2);
	end
	// xor output set
	else if (opcode == 3'b000 && funct == 4'b0101) begin
		alu_result = (data_1 ^ data_2);
	end
	// slt, slti output set
	else if ((opcode == 3'b000 && funct == 4'b0110) || (opcode == 3'b011)) begin
		if (data_1 < data_2) begin
			alu_result = 16'h0001;
		end
		else begin
			alu_result = 16'h0000;
		end
	end
	// sll output set
	else if (opcode == 3'b000 && funct == 4'b0000) begin
		alu_result = (data_2 << data_1);
	end
	// srl output set
	else if (opcode == 3'b000 && funct == 4'b0111) begin
		alu_result = (data_2 >> data_1);
	end
	// lw, sw output set
	else if (opcode == 3'b110 || opcode == 3'b111) begin
		alu_result = mem_adder_out;
	end
end

// Zero output logic
// outputs zero if alu_result is zero
// does not check to see if instruction is add, sub, or subi
reg zero;
always @* begin
	zero = 1'b0;
	if (alu_result == 16'h0000) begin
		zero = 1'b1;
	end
end

endmodule
