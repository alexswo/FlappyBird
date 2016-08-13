`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:25 03/19/2013 
// Design Name: 
// Module Name:    NERP_demo_top 
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
module NERP_demo_top(
	input jump_btn,
	input enable_btn,
	input rst_btn,
	input wire clk,			//master clock = 50MHz
	input wire clr,			//right-most pushbutton for reset
	output wire [6:0] seg,	//7-segment display LEDs
	output wire [3:0] an,	//7-segment display anode enable
	output wire dp,			//7-segment display decimal point
	output wire [2:0] red,	//red vga output - 3 bits
	output wire [2:0] green,//green vga output - 3 bits
	output wire [1:0] blue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync			//vertical sync out
	);

//enabling & debouncing
reg jump;
reg enable;
initial enable = 0;
reg enable_d;
initial enable_d = 0;
always @ (posedge bird_clk)
	if(enable_btn && !enable_d && state == 2)
	begin
		enable <= !enable;
	end
	else if (state != 2)
		enable <= 0;
		
always @ (posedge bird_clk)
begin
	enable_d <= enable_btn;
	jump <= jump_btn;
end

// 7-segment clock interconnect
wire segclk;

// VGA display clock interconnect
wire dclk;

// disable the 7-segment decimal points
assign dp = 1;

//bird stuff
wire [10:0] bird_coord;
wire bird_clk;

//pipe stuff
wire [7:0] rand;
reg [7:0] pipe_array0;
initial pipe_array0 <= 100;
reg [7:0] pipe_array1;

//game state
reg [1:0] state; //00-lost 01-reset 02-start
initial state = 1;
always @ (posedge bird_clk)
begin
	if(state == 2)
	begin
		if(284 > (784-pipe_pos-345) && 244 < (784-pipe_pos+50-345)) //hc
			if((480-bird_coord)-20 < pipe_array0+75 || (480-bird_coord)+20 > pipe_array0+215) //vc
				state <= 0;
		else if(bird_coord == 0)
			state <= 0;
		if(current_score > high_score)
			high_score <= current_score;
	end
	else if( !state && rst_btn)
	begin
		state <= 1;
	end
	else if(jump && state==1)
		state <= 2;
end

reg [17:0] pos;
initial pos = 0;
always @ (posedge dclk)
begin
		pos <= pos + 1;
end

reg [9:0] pipe_pos;
initial pipe_pos = 0;
always @ (posedge pos[17])
begin
	if(!enable && state == 2 && pipe_pos < 345)
		pipe_pos <= pipe_pos+1;
	else if(!enable && state == 2)
	begin
		pipe_pos <= 0;
		pipe_array0 <= pipe_array1;
		pipe_array1 <= rand;
		current_score <= current_score + 1;
	end
	if(state == 1)
	begin
		pipe_pos <= 0;
		current_score <= 0;
		pipe_array0 <= 100;
	end
end

//scorekeeping
reg [3:0] current_score;
reg [3:0] high_score;
initial current_score = 0;
initial high_score = 0;


// generate 7-segment clock & display clock
clockdiv U1(
	.clk(clk),
	.clr(clr),
	.segclk(segclk),
	.dclk(dclk),
	.bird_clk(bird_clk)
	);

// 7-segment display controller
segdisplay U2(
	.score(high_score),
	.segclk(segclk),
	.clr(clr),
	.seg(seg),
	.an(an)
	);

// VGA controller
vga640x480 U3(
	.bird_coord(bird_coord),
	.pipe_pos(pipe_pos),
	.pipe_array0(pipe_array0),
	.pipe_array1(pipe_array1),
	.current_score(current_score),
	.dclk(dclk),
	.clr(clr),
	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue)
	);
	
bird flappy(
	.clk(bird_clk),
	.enable(!enable),
	.jump(jump),
	.state(state),
	.fall_accel(1),
	.y_coord(bird_coord)
);

RNG pipe_gen(
		.clk(clk),
		.out(rand)
	);
	

endmodule
