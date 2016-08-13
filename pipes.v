`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:43 05/16/2016 
// Design Name: 
// Module Name:    pipes 
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
module pipes(clk, enable, pos, pipe_array
    );
	input clk;
	input enable;
	input pos;
	output reg [2:0] pipe_array [3:0];
	
	reg [7:0] rand;
	
	RNG pipe_gen(
		.clk(clk),
		.rst(rst),
		.pos(pos),
		.out(rand)
	);
	
	always @ (posedge clk)
		if(&pos && enable)
		begin
			pipe_array[3:1] <= pipe_array[2:0];
			pipe_array[0] <= rand[2:0];
		end

endmodule
