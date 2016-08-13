`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
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
module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	input wire [9:0] bird_coord,
	input wire [8:0] pipe_pos,
	input wire [7:0]pipe_array0,
	input wire [7:0]pipe_array1,
	input wire [3:0] current_score,
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue	//blue vga output
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =

reg a;
initial a = 0;
reg b;
initial b = 0;
reg c;
initial c = 0;
reg d;
initial d = 0;
reg e;
initial e = 0;
reg f;
initial f = 0;
reg g;
initial g = 0;
reg h;
initial h = 0;
reg i;
initial i = 0;
reg j;
initial j = 0;
reg k;
initial k = 0;
reg l;
initial l = 0;
reg m;
initial m = 0;
reg n;
initial n = 0;
reg o;
initial o = 0;

always @ (*)
begin
case(current_score)
0:
begin
	a = 0;
	b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	m = 0;
	n = 0;
	o = 0;
end
1:
begin
	a = 1;
end
2: 
begin
	a = 1;
	b = 1;
end
3: 
begin
	a = 1;
	b = 1;
	c = 1;
end
4: 
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
end
5:
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
end
6: 
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
end
7:
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
end
8:
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
end
9: 
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
end
10:
begin 
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
	j = 1;
end
11:
begin 
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
	j = 1;
	k = 1;
end
12:
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
	j = 1;
	k = 1;
	l = 1;
end
13:
begin
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
	j = 1;
	k = 1;
	l = 1;
	m = 1;
end
14:
begin 
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
	j = 1;
	k = 1;
	l = 1;
	m = 1;
	n = 1;
end
15:
begin 
	a = 1;
	b = 1;
	c = 1;
	d = 1;
	e = 1;
	f = 1;
	g = 1;
	h = 1;
	i = 1;
	j = 1;
	k = 1;
	l = 1;
	m = 1;
	n = 1;
	o = 1;
end
endcase
end
	



always @(*)
begin

	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// -----------------
		if(hc > (hbp+20) && hc < (hbp+25)&& a && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+30) && hc < (hbp+35) && b && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+40) && hc < (hbp+45) && c && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+50) && hc < (hbp+55) && d && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+60) && hc < (hbp+65) && e && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+70) && hc < (hbp+75) && f && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+80) && hc < (hbp+85) && g && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+90) && hc < (hbp+95) && h && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+100) && hc < (hbp+105) && i && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+110) && hc < (hbp+115) && j && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+120) && hc < (hbp+125) && k && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+130) && hc < (hbp+135) && l && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+140) && hc < (hbp+145) && m && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+150) && hc < (hbp+155) && n && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else 	if(hc > (hbp+160) && hc < (hbp+165) && o && vc >= 504 && vc <= 514)
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
		else if(vc > (480-bird_coord)-20 && vc < (480-bird_coord)+20 && hc > hbp+100 && hc < hbp+140)
			begin
				red = 3'b000;
				green = 3'b000;
				blue = 2'b00;
			end
		//pipes
		else if ((hc < hfp-pipe_pos+50 && hc > hfp-pipe_pos) && (vc < pipe_array1+75 || vc > pipe_array1+215 && vc < 500))
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b00;
		end		
		else if ((hc < hfp-345-pipe_pos+50 && hc > hfp-345-pipe_pos) && (vc < pipe_array0+75 || vc > pipe_array0+215 && vc < 500))
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b00;
		end		
		//grass -- not marijuana
		else if (vc >= 500)
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end
		// display cyan bar
		else if (hc >= (hbp) && hc < (hbp+640))
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end
		// we're outside active horizontal range so display black
		else
		begin
			red = 0;
			green = 0;
			blue = 0;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule
