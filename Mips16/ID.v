`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Mighty MIPsters
// Engineer: James Tate
// 
// Create Date:    21:42:50 03/29/2015 
// Design Name: MIPS decode module
// Module Name:    ID 
// Project Name: MIPS 16 bit
//////////////////////////////////////////////////////////////////////////////////
module ID(
	clk,
	reset,
	sign_ext,
	rd_data1,
	rd_data2,
	instin,
	writedata,
	regwrite_in,
	regwrite,
	alusrc,
	regdst,
	branch,
	memwrite,
	memread,
	memtoreg, 
	ready,
	write_reg);

//needed to run the system and reset
input clk, reset, regwrite_in, ready;
//in from the branch adder
////the instruction from the IF stage
input [15:0] instin;
//data to write to reg
input [15:0] writedata;
input [2:0] write_reg;
//sign extend and branch adder out for branch
output [15:0] sign_ext;
//data to the ALU
output [15:0] rd_data1, rd_data2;
//these will be the control outputs for datapath pg 301 book
output regdst, regwrite, alusrc, branch, memwrite, memtoreg, memread;

//internal wires
wire [3:0] op, rs, rt, write_address, rd;
wire [4:0] func;
wire [6:0] immediate;
reg [15:0] regdata;
reg [15:0] sign_ext, rd_data1, rd_data2;
reg regdst, regwrite, alusrc, branch, memwrite, memtoreg;
//reg [3:0] rd;

//register files
reg [15:0] a, b, c, d, e, f, g, zero;

//passthough
//assign branch_adder_out = branch_adder_in;
//assign instout = instin;

//register addresses

`define ZERO 3'b000
`define A_ADDRESS 3'b001
`define B_ADDRESS 3'b010
`define C_ADDRESS 3'b011
`define D_ADDRESS 3'b100
`define E_ADDRESS 3'b101
`define F_ADDRESS 3'b110
`define G_ADDRESS 3'b111

//breakdown of inst
//r type
// | OP	| rs	| rt	| rd	| func |
//	| 000 | 000 | 000 | 000 | 0000 |
//i type
// | OP	| rs	| rt	| immediate  |
//	| 000 | 000 | 000 |  0000000 	 |
assign op = instin[15:13];
assign rs = instin[12:10];
assign rt = instin[9:7];
assign rd = write_reg;
assign func = instin[3:0];
assign immediate = instin[6:0];
//Control op codes and functions for instructions
// 		  op	 func
//sll		| 000	| 000	|
//add 	| 000	| 001	|
//sub		| 000	| 010	|
//and		| 000	| 011	|
//or		| 000	| 100	|
//xor		| 000	| 101	|
//slt		| 000	| 110	|
//srl		| 000	| 111	|
//addi	| 001	| --- |
//ori		| 010	| --- |
//slti	| 011	| --- |
//beq		| 100	| --- |
//bne		| 101	| --- |
//lw		| 110	| --- |
//sw		| 111	| --- |

//ALU 	  OP 
//lw		| 00 |
//sw		| 00 |
//beq		| 01 |
//r-type | 10 |

//sign extend block "I done this first because it is the easy :O"
always @* begin
	sign_ext[15:7] = 9'b000000000;
	sign_ext[6:0] = immediate;
	if(immediate[6] == 1) 
		sign_ext[15:7] = 9'b111111111;
end

//mux to send rs if shift is enabled
always @* begin
	rd_data1 = regdata;
	if((op == 3'b000 && func == 3'b000) || (op == 3'b000 && func == 3'b111)) begin
		rd_data1[15:3] = 13'b0000000000000;
		rd_data1[2:0] = rs;
	end
end

//mux for write data
//always @* begin
//	//might need to change this
//	rd = instin[6:4]; 
//	case(op)
//		3'b000:
//			rd = instin[6:4];
//		3'b001:
//			rd = rt;
//		3'b110:
//			rd = rt;
//	endcase;
//end

//enable reading from reg 
always @* begin
	regdata = 16'h0000;
	rd_data2 = 16'h0000;
	//rs address
	case(rs)
		`ZERO:
			regdata = 16'h0000;
		`A_ADDRESS:
			regdata = a;
		`B_ADDRESS:
			regdata = b;		
		`C_ADDRESS:
			regdata = c;
		`D_ADDRESS:
			regdata = d;
		`E_ADDRESS:
			regdata = e;
		`F_ADDRESS:
			regdata = f;
		`G_ADDRESS:
			regdata = g;
	endcase
	//rt address
	case(rt)
		`ZERO:
			rd_data2 = 16'h0000;
		`A_ADDRESS:
			rd_data2 = a;
		`B_ADDRESS:
			rd_data2 = b;		
		`C_ADDRESS:
			rd_data2 = c;
		`D_ADDRESS:
			rd_data2 = d;
		`E_ADDRESS:
			rd_data2 = e;
		`F_ADDRESS:
			rd_data2 = f;
		`G_ADDRESS:
			rd_data2 = g;
	endcase
end

//holding info in the registers and writing to them
always @(negedge clk or posedge reset) begin
	if(reset) begin
		a <= 16'h000;
		a <= 16'h000;
		b <= 16'h000;
		c <= 16'h000;
		d <= 16'h000;
		e <= 16'h000;
		f <= 16'h000;
		g <= 16'h000;
	end
	else begin
		if(regwrite_in == 1) begin
			//rd address writing
			case(rd) 
				`A_ADDRESS: begin
					a <= writedata;
					b <= b;
					c <= c;
					d <= d;
					e <= e;
					f <= f;
					g <= g;
				end
				`B_ADDRESS: begin
					b <= writedata;
					a <= a;
					c <= c;
					d <= d;
					e <= e;
					f <= f;
					g <= g;
				end
				`C_ADDRESS: begin
					c <= writedata;
					b <= b;
					a <= a;
					d <= d;
					e <= e;
					f <= f;
					g <= g;
				end
				`D_ADDRESS: begin
					d <= writedata;
					b <= b;
					c <= c;
					a <= a;
					e <= e;
					f <= f;
					g <= g;
				end
				`E_ADDRESS: begin
					e <= writedata;
					b <= b;
					c <= c;
					d <= d;
					a <= a;
					f <= f;
					g <= g;
				end
				`F_ADDRESS: begin
					f <= writedata;
					b <= b;
					c <= c;
					d <= d;
					e <= e;
					a <= a;
					g <= g;
				end
				`G_ADDRESS: begin
					g <= writedata;
					b <= b;
					c <= c;
					d <= d;
					e <= e;
					f <= f;
					a <= a;
				end
							endcase
		end
		else begin
		//keep info in the registers
			zero <= 16'h000;
			a <= a;
			b <= b;
			c <= c;
			d <= d;
			e <= e;
			f <= f;
			g <= g;
		end
	end
end

//this will set the control signals.
always @* begin
	regwrite = 0;
	alusrc = 0;
	regdst = 0; 
	branch = 0;
	memwrite = 0;
	memtoreg = 0;
	//R-Type
	if(op == 3'b000 && ready) begin
		//register for rd
		regdst = 1;
		regwrite = 1;
	end
	//beq
	else if(op == 3'b100) begin
		branch = 1;
	end
	//bne
	if(op == 3'b101) begin
		branch = 1;
	end
	//lw
	if(op == 3'b110) begin
		alusrc = 1;
		regwrite = 1;
		memtoreg = 1;
	end
	//sw
	else if(op == 3'b111) begin
		alusrc = 1;
		memwrite = 1;
	end
	//immediate inst
	else if(op == 001 || op == 010 || op == 011) begin
		alusrc = 1;
		regwrite = 1;
	end
	
end

endmodule
