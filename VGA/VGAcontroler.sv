module VGAcontroler(
	input CLOCK_50,
	input move,
	input select,
	input reset,
	output VGA_HS,
	output VGA_VS,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N,
	output finish,
   output counting,
   output finish_30sec
	);
	
	// indica al controlador del video que mostrar 
	logic [3:0] selected;
	logic [3:0] outCont;
   wire [1:0] pos1,pos2,pos3,
    pos4,pos5,pos6,pos7,pos8,pos9;
	
	
	
	video_controller VGA (
	CLOCK_50,
	reset,
	selected,
	VGA_HS,
	VGA_VS,
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_CLK,
	VGA_SYNC_N,
	VGA_BLANK_N);
	
endmodule