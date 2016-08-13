`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:50:25 05/25/2016
// Design Name:   vga640x480
// Module Name:   C:/Users/152/Documents/New folder/NERP_demo/tb_vga.v
// Project Name:  NERP_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga640x480
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_vga;

	// Inputs
	reg dclk;
	reg clr;
	reg [9:0] bird_coord;
	reg [8:0] pipe_pos;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;

	// Instantiate the Unit Under Test (UUT)
	vga640x480 uut (
		.dclk(dclk), 
		.clr(clr), 
		.bird_coord(bird_coord), 
		.pipe_pos(pipe_pos), 
		.hsync(hsync), 
		.vsync(vsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);

	initial begin
		// Initialize Inputs
		dclk = 0;
		clr = 0;
		bird_coord = 0;
		pipe_pos = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	always # 10 dclk = ~dclk;
      
endmodule

