// contador horizontal 
module horizontal_counter (
	input clk_25MHz,
	output logic enable_V_Counter = 0,
	output logic [15:0] h_Count_Value = 0
	);
	
	always @ (posedge clk_25MHz)
	begin
		if (h_Count_Value < 799)
		begin
			h_Count_Value = h_Count_Value + 1;
			enable_V_Counter = 0; // apaga contador vertical 
		end
		else
		begin
			h_Count_Value = 0; // Reset counter
			enable_V_Counter = 1; // activa contador vertical 
		end
	end

endmodule
