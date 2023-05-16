
module mark_new_position(
	input clock, reset,
   input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
   input [8:0] PC_en, PL_en,
	input status,
	input pc, play,
	output [1:0] pos11,pos22,pos33,pos44,pos55,pos66,pos77,pos88,pos99
   );
 // Random pos
 reg changed;
 always @(posedge clock or posedge reset)
 begin
	if (reset) begin
		pos11 = 2'b00;
		pos22 = 2'b00;
		pos33 = 2'b00;
		pos44 = 2'b00;
		pos55 = 2'b00;
		pos66 = 2'b00;
		pos77 = 2'b00;
		pos88 = 2'b00;
		pos99 = 2'b00;		
	end
	else begin	
 
		 if (pos1 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos11 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos1 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos11 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos11 = pos1;
			
			
		 if (pos2 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos22 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos2 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos22 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos22 = pos2;
		 
		 
		 if (pos3 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos33 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos3 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos33 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos33 = pos3;
		 
		 
		 if (pos4 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos44 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos4 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos44 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos44 = pos4;
		 
		 
		 if (pos5 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos55 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos5 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos55 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos55 = pos5;
	
	
		 if (pos6 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos66 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos6 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos66 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos66 = pos6;
	
	
	    if (pos7 == 2'b00  & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos77 <= 2'b01;
			changed = 1'b1;
	    end
	    else if (pos7 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos77 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos77 = pos7;
		 
		 
		 if (pos8 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos88 <= 2'b01;
			changed = 1'b1;
		 end
		 else if (pos8 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos88 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos88 = pos8;
	 
	 
		 if (pos9 == 2'b00 & play == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos99 <= 2'b01;
			changed = 1'b1;
		 end
		 
		 else if (pos9 == 2'b00 & pc == 1'b1 & status == 1'b0 & changed == 1'b0)begin
			pos99 <= 2'b01;
			changed = 1'b1;
		 end
		 else pos99 = pos9;
	end
end
	

	
endmodule 