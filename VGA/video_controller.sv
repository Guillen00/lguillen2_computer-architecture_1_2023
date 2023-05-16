module video_controller (
	input logic clk,
	input logic reset,
	input logic [3:0] selected,
	output logic h_synq,
	output logic v_synq,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue,
	output logic clk_25mhz,
	output logic sync_n,
	output logic blank_n
	);
	
	// VGA variables de control 
	logic enable_v_counter;
	logic [15:0] h_count_value;
	logic [15:0] v_count_value;
	
	// variables de sprite/imagen 
	logic [7:0] xr;
	logic [7:0] xg;
	logic [7:0] xb;
	logic [7:0] circulor;
	logic [7:0] circulog;
	logic [7:0] circulob;
	logic [7:0] white;
	logic [7:0] black;
	logic [18:0] address;
	
	// Clock divider
	clock_divider vga_clock_gen (clk, clk_25mhz);
	
	// Counters
	horizontal_counter vga_horizontal (clk_25mhz, enable_v_counter, h_count_value);
	vertical_counter vga_Vertical (clk_25mhz, enable_v_counter, v_count_value);
	
	// vertical y horizontal sync basados en los estandares 
	assign h_synq = (h_count_value < 96) ? 1'b1:1'b0;
	assign v_synq = (v_count_value < 2) ? 1'b1:1'b0;
	
	// imagen de (X) 
	sram #(18, 8, 90000, "/home/ridivi/intelFPGA_lite/22.1std/Projects/gpttuto/VGA/Image processing/imageOutput.txt")
	vamo_r(clk, address, 0, 18'b0, xr);
	sram #(18, 8, 90000, "/home/ridivi/intelFPGA_lite/22.1std/Projects/gpttuto/VGA/Image processing/imageOutput.txt")
	vamo_g(clk, address, 0, 18'b0, xg);
	sram #(18, 8, 90000, "/home/ridivi/intelFPGA_lite/22.1std/Projects/gpttuto/VGA/Image processing/imageOutput.txt")
	vamo_b(clk, address, 0, 18'b0, xb);
	
	// blanco
	assign white = 8'hFF;
	assign black = 8'h0;
	

	always @*
	//always @(posedge clk)
	begin		
		if (reset == 1'b1) begin
		// Block 01
		if(h_count_value < 784 && h_count_value > 143 && v_count_value < 515 && v_count_value > 34)
		begin
		   if(h_count_value <= 570 && h_count_value >= 270 && v_count_value <= 352 && v_count_value >= 52)
			begin
				address = (h_count_value - 270) + (v_count_value - 52 - 1) * 300;
				
				red = (xr > 255) ? (xr - 255) : (255 - xr);
				green = (xg > 255) ? (xg - 255) : (255 - xg);
				blue = (xb > 255) ? (xb - 255) : (255 - xb);
				//red = xr;
				//green = xg;
				//blue = xb;
			
			end else
			begin
				
				red = 8'hC8;
				green = 8'hC8;
				blue = 8'hC8;
			end
		// cualquier otro caso 
		end else
		begin
			red = black;
			green = black;
			blue = black;
		end
		end
		if (reset == 1'b0) begin
			red = black;
         green = black;
         blue = black;
		end
	end



	assign sync_n = 1'b0;
	assign blank_n = 1'b1;
	
endmodule