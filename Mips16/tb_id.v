`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:19 04/03/2015 
// Design Name: 
// Module Name:    tb_id 
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
module tb_id;

	reg clock;
	reg reset;
	
	//inputs
	reg [15:0] bai, instin, writedata;
	reg regwrite_in;
	
	//outputs
	wire [15:0] signext, rd1, rd2, instout, bao;
	wire regdst, regwrite, alusrc, branch, memwrite, memread, memtoreg;
	wire [1:0] aluop;
	
	//instructions to run
	`define ADD 16'h531  	//add reg 1 to reg 2 store in reg 1 result should be 3
	`define SUB 16'h1F22 	//sub reg 6 from reg 7 store in reg 2 results should be 1
	`define AND 16'h1F33 	//and reg 7 to reg 6 store in reg 3 result should be 6
	`define OR 	16'h1343 	//or reg 4 to reg 6 store in reg 3 result should be 6
	`define XOR 16'h1493 	//xor reg 5 to reg 1 store in reg 1 result should be 6
	`define SW  16'hF4E7    //store word reg 2 to address = 5 + 103 = 108
	`define LW 	16'hD7E7
	
	integer errors;
	integer aluresults;
	integer address;
	integer word;
	
	ID uut (
		.clk(clock),
		.reset(reset),
		.branch_adder_in(bai),
		.branch_adder_out(bao),
		.sign_ext(signext),
		.rd_data1(rd1),
		.rd_data2(rd2),
		.instin(instin),
		.instout(instout),
		.writedata(writedata),
		.regwrite_in(regwrite_in),
		.regdst(regdst),
		.regwrite(regwrite),
		.alusrc(alusrc),
		.aluop(aluop),
		.branch(branch),
		.memwrite(memwrite),
		.memread(memread),
		.memtoreg(memtoreg)
	);
	
	initial begin
		clock = 0;
		#100
		forever #20 clock = ~clock;
	end
	
	initial begin
		errors = 0;
		clock = 0;
		reset = 1;
		address = 0;
		word = 0;
		bai = 16'h000;
		instin = 16'h000;
		writedata = 16'h000;
		regwrite_in = 16'h000;
		#100;
		reset = 0;
		@(negedge clock);
		//test branch flow through
		bai = 16'hA16;
		@(posedge clock);
		$display("-------------------------------------------------------");
		$display("!!!This script is no longer relevant because of changes to the registers!!!");
		if(bao!= 16'hA16) begin
			$display("branch adder pass-though fails = %d need 2582 ", bao, $time());
			errors = errors + 1;
		end
		else
			$display("branch adder pass-though works! %d ", bao);
			
		@(posedge clock);
		//test add
		instin = `ADD;
		@(negedge clock);
		aluresults = rd1 + rd2;
		writedata = aluresults;
		regwrite_in = 1;
		@(negedge clock);
		regwrite_in = 0;
		@(posedge clock);
		if(rd1 != 5) begin
			$display("add instruction failed: expected 5 got %d ", rd1, $time());
			errors = errors + 1;
		end
		else
			$display("add instruction workes: got %d ", rd1, $time());
		
//		@(posedge clock);
//		//test sub
//		instin = `SUB;
//		@(negedge clock);
//		aluresults = rd1 - rd2;
//		writedata = aluresults;
//		regwrite_in = 1;
//		instin[12:10] = 3'b010;
//		@(negedge clock);
//		regwrite_in = 0;
//		@(posedge clock);
//		if(rd1 != 1) begin
//			$display("sub instruction failed: expected 1 got %d ", rd1, $time());
//			errors = errors + 1;
//		end
//		else
//			$display("sub instruction workes: got %d ", rd1, $time());
//			
//		@(posedge clock);
//		//test and
//		instin = `AND;
//		@(negedge clock);
//		aluresults = rd1 & rd2;
//		writedata = aluresults;
//		regwrite_in = 1;
//		instin[12:10] = 3'b011;
//		@(negedge clock);
//		regwrite_in = 0;
//		@(posedge clock);
//		if(rd1 != 6) begin
//			$display("and instruction failed: expected 6 got %d ", rd1, $time());
//			errors = errors + 1;
//		end
//		else
//			$display("and instruction workes: got %d ", rd1, $time());
//			
//		@(posedge clock);
//		//test SW
//		instin = `SW;
//		@(negedge clock);
//		address = rd1 + 103;
//		word = rd2;
//		@(negedge clock);
//		if(address != 108 || word != 3) begin
//			$display("sw failed: expected address 108; word 3 got %d ", address, word, $time());
//			errors = errors + 1;
//		end
//		else
//			$display("sw instruction workes: got address %d word %d", address, word);
//			
//			
//		@(posedge clock);
//		//test OR
//		instin = `OR;
//		@(negedge clock);
//		aluresults = rd1 | rd2;
//		writedata = aluresults;
//		regwrite_in = 1;
//		instin[12:10] = 3'b011;
//		@(negedge clock);
//		regwrite_in = 0;
//		@(posedge clock);
//		if(rd1 != 6) begin
//			$display("or instruction failed: expected 6 got %d ", rd1, $time());
//			errors = errors + 1;
//		end
//		else
//			$display("or instruction workes: got %d ", rd1, $time());
//			
//		@(posedge clock);
//		//test LW
//		instin = `LW;
//		@(negedge clock);
//		address = rd1 + 103;
//		writedata = word;
//		instin[6:4] = 3'b101;
//		regwrite_in = 1;	
//		@(negedge clock);
//		regwrite_in = 0;
//		@(posedge clock);
//		if(rd1 != 3) begin
//			$display("lw failed: expected 3 got %d ", rd1, $time());
//			errors = errors + 1;
//		end
//		else
//			$display("sw instruction workes: got %d", rd1, $time());
//			
//		//reset to test signals
//		reset = 1;
//		#100;
//		reset = 0;
//		
//		@(posedge clock);
//		instin = 16'h000;
//		@(negedge clock);
//		if(regdst != 1 && regwrite != 1 && aluop != 2'b10)
//			$display("r-format does not work!", $time());
//		else
//			$display("r-format works!", $time());
//			
//		@(posedge clock);
//		instin = 16'h2000;
//		@(negedge clock);
//		if(alusrc != 1 && regwrite != 1 && aluop != 2'b01)
//			$display("addi does not work!", $time());
//		else
//			$display("addi works!", $time());
//		
//		@(posedge clock);
//		instin = 16'h4000;
//		@(negedge clock);
//		if(alusrc != 1 && regwrite != 1 && aluop != 2'b01)
//			$display("ori does not work!", $time());
//		else
//			$display("ori works!", $time());
//		
//		@(posedge clock);
//		instin = 16'h6000;
//		@(negedge clock);
//		if(alusrc != 1 && regwrite != 1 && aluop != 2'b01)
//			$display("slti does not work!", $time());
//		else
//			$display("slti works!", $time());
//		
//		@(posedge clock);
//		instin = 16'h8000;
//		@(negedge clock);
//		if(branch != 1 && aluop != 2'b01)
//			$display("beq does not work!", $time());
//		else
//			$display("beq works!", $time());
//			
//		@(posedge clock);
//		instin = 16'hA000;
//		@(negedge clock);
//		if(branch != 1 && aluop != 2'b01)
//			$display("bnq does not work!", $time());
//		else
//			$display("bnq works!", $time());
//		
//		@(posedge clock);
//		instin = 16'hC000;
//		@(negedge clock);
//		if(alusrc != 1 && regwrite != 1 && memtoreg !=1 && memread != 1 && aluop != 2'b00)
//			$display("lw does not work!", $time());
//		else
//			$display("lw works!", $time());
//			
//		@(posedge clock);
//		instin = 16'hE000;
//		@(negedge clock);
//		if(alusrc != 1 && memwrite != 1 && aluop != 2'b00)
//			$display("sw does not work!", $time());
//		else
//			$display("sw works!", $time());
//			
		
		if(errors)
			$display("%d errors!", errors);
		else 
			$display("no errors");
			
	end
	


endmodule
