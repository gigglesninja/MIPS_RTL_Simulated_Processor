`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Mighty MIPsters
// Engineers: 	Preston Stinson
// 				James Tate
//					Josh Dowdy
//
// Create Date:    22:56:04 03/27/2015 
// Design Name: 	Mips 16bit Processor
// Module Name:    Mips16 
// Project Name:  2015 Computer Architecture

// Description: Final Project Create a Mips 16bit Processor
//
//
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mips16(clk, reset, din, dout, pc_reset, rd_en, wen);

//pc_reset to reset counter after IM has been loaded
//wen high when writeing to IM
input clk, reset, pc_reset, wen, rd_en;
input [15:0] din;
output [15:0] dout;

wire[15:0] inst, write_data, rd1, rd2, alu_result, sign_ext;
wire branch, zero, pc_src;
reg[2:0] write_reg_mem_wb;

reg[15:0] rd_2;
//----------------------------IF----------------------------------
IF i_f(
	.clk(clk), //clk
	.reset(reset), //reset
	.din(din), //din
	.branch_address(), //branch address in
	.pc_src(pc_src),  //pc source signal
	.inst_mem(inst),  //instruction out
	.wen(wen),  //write enable for din
	.next_address(),  //branch address out
	.pc_reset(pc_reset),  //reset pc counter after instruction load
	.rd_en(rd_en)); //ready enable to send instruction


//--------------------------IF/ID----------------------------------
reg[2:0] write_reg;
wire [2:0] rs, rt;

reg[15:0] inst_if_id;

always @(posedge clk) begin
	inst_if_id <= inst;
end
//-----------------------------ID----------------------------------
ID i_d(
	.clk(clk), //clk
	.reset(reset), //reset
	.sign_ext(sign_ext), //sign extend out
	.rd_data1(rd1), //read data 1
	.rd_data2(rd2), //read data 2
	.instin(inst_if_id), //instruction in
	.writedata(write_data), //write data in
	.regwrite_in(regwrite), //reg write signal in
	.regwrite(regwrite), //reg write signal out
	.alusrc(alusrc), //alu src signal
	.regdst(), //reg data
	.branch(branch), //branch signal
	.memwrite(), //memory write signal
	.memtoreg(), //memory to reg signal
	.ready(rd_en), //ready signal 
	.write_reg(write_reg_mem_wb), //reg to write results to
	.rs (rs), //rs register address
	.rt (rt)); // rt register address

wire [1:0] fwdALU1, fwdALU2; // Control signals for muxes for setting ALU input
reg [2:0] rs_id_ex, rt_id_ex, write_reg_ex_mem, rd_mem_wb;
reg regwrite_ex_mem, regwrite_mem_wb;
forwarding_unit fwd (.regwrite_ex_mem(regwrite_ex_mem), 
							.regwrite_mem_wb(regwrite_mem_wb), 
							.rs_id_ex(rs_id_ex), 
							.rt_id_ex(rt_id_ex), 
							.rd_ex_mem(write_reg_ex_mem), 
							.rd_mem_wb(rd_mem_wb), 
							.fwdALU1(fwdALU1), 
							.fwdALU2(fwdALU2));

//--------------------------ID/EX----------------------------------
reg[15:0] sign_ext_id_ex, rd1_id_ex, rd2_id_ex, inst_id_ex;
reg[3:0] funtc;
reg[2:0] opc;
reg alusrc_id_ex, regwrite_id_ex;

always @* begin
	write_reg = inst_id_ex[9:7];
	case(opc)
		3'b000:
			write_reg = inst_id_ex[6:4];
	endcase
end
	
always @(posedge clk) begin
	inst_id_ex <= inst_if_id;
	sign_ext_id_ex <= sign_ext;
	rd1_id_ex <= rd1;
	rd2_id_ex <= rd2;
	opc <= inst_if_id[15:13];
	funtc <= inst_if_id[3:0];
	alusrc_id_ex <= alusrc;
	regwrite_id_ex <= regwrite;
	rs_id_ex <= rs;
	rt_id_ex <= rt;
end

assign pc_src = branch & zero;

//--------------------------EX----------------------------------	
reg [15:0] data_1, data_2;
always @* begin
	// Default to sending data from the register
	data_1 = rd1_id_ex;
	data_2 = rd2_id_ex;
	// Forwarding mux for the first input to the ALU
	if (fwdALU1 == 1) begin
		data_1 = aluresult_ex_mem;
	end
	else if (fwdALU1 == 2) begin
		data_2 = write_data;
	end
	// Forwading mux for the second input to the ALU
	if (alusrc_id_ex) begin
		data_2 = sign_ext_id_ex;
	end
	else if (fwdALU2 == 1) begin
		data_2 = aluresult_ex_mem;
	end
	else if (fwdALU2 == 2) begin
		data_2 = write_data;
	end
end

ALU alu(
	.data_1(data_1), //rd1 in
	.data_2(data_2),  //rd 2 in
	.opcode(opc), //op code
	.funct(funtc), //function
	.alu_result(alu_result), //alu results out
	.zero(zero) //zero signal
	);
	
//--------------------------EX/MEM----------------------------------
reg[15:0] aluresult_ex_mem, rd2_ex_mem;
reg [2:0] rs_ex_mem, rt_ex_mem;

always @(posedge clk) begin
	write_reg_ex_mem <= write_reg;
	aluresult_ex_mem <= alu_result;
	rd2_ex_mem <= rd_2;
	regwrite_ex_mem <= regwrite_id_ex;
	rs_ex_mem <= rs_id_ex;
	rt_ex_mem <= rt_id_ex;
end

wire[15:0] memdata;
//--------------------------MEM----------------------------------
DATA data_mem(
	.clk(), //clk
	.reset(reset), //reset
	.alu_result(aluresult_ex_mem),  //alu_result
	.read_data(memdata), //read data from memory
	.mem_write(), //memwrite signal
	.write_data(rd2_ex_mem)); //write data to memory
//--------------------------MEM/WB----------------------------------

reg[15:0] memdata_mem_wb, aluresult_mem_wb;
reg [2:0] rs_mem_wb, rt_mem_wb;

always @(posedge clk) begin
	memdata_mem_wb <= memdata;
	aluresult_mem_wb <= aluresult_ex_mem;
	write_reg_mem_wb <= write_reg_ex_mem;
	regwrite_mem_wb <= regwrite_ex_mem;
	rs_mem_wb <= rs_ex_mem;
	rt_mem_wb <= rt_ex_mem;
	rd_mem_wb <= regwrite_ex_mem;
end

//--------------------------WB----------------------------------	
WB w_b(
	.memtoreg(), //memto reg mux signal
	.rd_data_mem(memdata_mem_wb), //rd data from memory
	.rd_data_alu(aluresult_mem_wb), //rd data from alu
	.write_data(write_data)); //data to register
	
assign dout = write_data;

endmodule
