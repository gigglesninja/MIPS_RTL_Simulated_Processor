`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:38:45 04/06/2015
// Design Name:   branch_address
// Module Name:   /home/preston/Documents/MIPSProcessor/Mips16/tb_branch_address.v
// Project Name:  Mips16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_address
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_branch_address;

	// Inputs
	reg [9:0] pc;
	reg [6:0] immediate;

	// Outputs
	wire [9:0] branch_address;

	// Instantiate the Unit Under Test (UUT)
	branch_address uut (
		.pc(pc), 
		.immediate(immediate), 
		.branch_address(branch_address)
	);

	initial begin
		// Initialize Inputs
		pc = 0;
		immediate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		pc = 80;
		immediate = -30;
		#100;
		pc = 80;
		immediate = 30;
		#100;
		pc = 10'b1111111111;
		immediate = 10;
		#100;
		pc = 2;
		immediate = -10;
	end
      
endmodule

