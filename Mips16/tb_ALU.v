`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:51:56 04/06/2015
// Design Name:   ALU
// Module Name:   /home/preston/Documents/MIPSProcessor/Mips16/tb_ALU.v
// Project Name:  Mips16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ALU;

	// Inputs
	reg [15:0] data_1;
	reg [15:0] data_2;
	reg [2:0] opcode;
	reg [3:0] funct;

	// Outputs
	wire [15:0] alu_result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.data_1(data_1), 
		.data_2(data_2), 
		.opcode(opcode), 
		.funct(funct), 
		.alu_result(alu_result), 
		.zero(zero)
	);
	
	reg[8*100:1] aline;
	integer fd;
	integer count, status;
	integer i_data_1, i_data_2;
	integer i_opcode, i_funct;
	integer i_alu_result, i_zero;
	integer errors;
	
	initial begin
		// Initialize Inputs
		data_1 = 0;
		data_2 = 0;
		opcode = 0;
		funct = 0;
		fd = $fopen("alu_vectors.txt","r");
		count = 1;

		// Wait 100 ns for global reset to finish
		#100;
		errors = 0;
		while ($fgets(aline,fd)) begin
			status = $sscanf(aline,"%x %x %x %x %x %x",i_opcode, i_funct, i_data_1, i_data_2, i_alu_result, i_zero);
			opcode = i_opcode;
			funct = i_funct;
			data_1 = i_data_1;
			data_2 = i_data_2;
			#100;
			if ((i_alu_result == alu_result) && (i_zero == zero)) begin
				$display("%d) %t: PASS, opcode: %x, funct: %x, data_1: %x, data_2: %x, alu_result: %x, zero: %x\n",count, $time, opcode, funct, data_1, data_2, alu_result, zero);
			end
			else begin
				$display("%d) %t: FAIL, opcode: %x, funct: %x, data_1: %x, data_2: %x, alu_result: %x (expected: %x), zero: %x (expected %x)\n",count, $time, opcode, funct, data_1, data_2, alu_result, i_alu_result, zero, i_zero);
				errors = errors + 1;
			end
			count = count + 1;
			
		end
        
		if (errors == 0) $display("PASS: All vectors passed.\n");
		else $display("FAIL: %d vectors failed.\n",errors);
		
	end
      
endmodule

