module find_space (
  input clock,
  input reset,
  input [15:0] PL_en,
  input [15:0] PC_en,
  output put_random,
  output [3:0] position_random
  );
 
reg [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9;
wire put; 
wire [3:0] pos;

// Position 1 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos1 <= 2'b00;
  else begin
   if(PC_en[0]==1'b1)
    pos1 <= 2'b10; // guarda J2(pc) info  
   else if (PL_en[0]==1'b1)
    pos1 <= 2'b01;// guarda J1 info 
   else 
    pos1 <= pos1;//mantiene la data antigua
  end 
 end 
 // Position 2 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos2 <= 2'b00;
  else begin
   if(PC_en[1]==1'b1)
    pos2 <= 2'b10; //  guarda J2(pc) info   
   else if (PL_en[1]==1'b1)
    pos2 <= 2'b01;// guarda J1 info 
   else 
    pos2 <= pos2;// mantiene la data antigua
  end 
 end 
// Position 3 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos3 <= 2'b00;
  else begin
   if(PC_en[2]==1'b1)
    pos3 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[2]==1'b1)
    pos3 <= 2'b01;//guarda J1 info 
   else 
    pos3 <= pos3;// mantiene la data antigua
  end 
 end  
 // Position 4 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos4 <= 2'b00;
  else begin
   if(PC_en[3]==1'b1)
    pos4 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[3]==1'b1)
    pos4 <= 2'b01;// guarda J1 info 
   else 
    pos4 <= pos4;// mantiene la data antigua
  end 
 end 
 // Position 5 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos5 <= 2'b00;
  else begin
   if(PC_en[4]==1'b1)
    pos5 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[4]==1'b1)
    pos5 <= 2'b01;// guarda J1 info 
   else 
    pos5 <= pos5;//mantiene la data antigua
  end 
 end 
 // Position 6 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos6 <= 2'b00;
  else begin
   if(PC_en[5]==1'b1)
    pos6 <= 2'b10; //  guarda J2(pc) info   
   else if (PL_en[5]==1'b1)
    pos6 <= 2'b01;// guarda J1 info 
   else 
    pos6 <= pos6;// mantiene la data antigua
  end 
 end 
 // Position 7 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos7 <= 2'b00;
  else begin
   if(PC_en[6]==1'b1)
    pos7 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[6]==1'b1)
    pos7 <= 2'b01;// guarda J1 info 
   else 
    pos7 <= pos7;//mantiene la data antigua
  end 
 end 
 // Position 8 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos8 <= 2'b00;
  else begin
   if(PC_en[7]==1'b1)
    pos8 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[7]==1'b1)
    pos8 <= 2'b01;// guarda J1 info 
   else 
    pos8 <= pos8;//mantiene la data antigua
  end 
 end 
 // Position 9 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos9 <= 2'b00;
  else begin
   if(PC_en[8]==1'b1)
    pos9 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[8]==1'b1)
    pos9 <= 2'b01;// guarda J1 info  
   else 
    pos9 <= pos9;// mantiene la data antigua
  end 
 end  

assign temp1 = ~(pos1[1] | pos1[0]);
assign temp2 = ~(pos2[1] | pos2[0]);
assign temp3 = ~(pos3[1] | pos3[0]);
assign temp4 = ~(pos4[1] | pos4[0]);
assign temp5 = ~(pos5[1] | pos5[0]);
assign temp6 = ~(pos6[1] | pos6[0]);
assign temp7 = ~(pos7[1] | pos7[0]);
assign temp8 = ~(pos8[1] | pos8[0]);
assign temp9 = ~(pos9[1] | pos9[0]);

always @(*) begin
	if (temp1) begin
		put = 1'b1;
		pos = 4'b0000;
		end
	else if (temp2) begin
		put = 1'b1;
		pos = 4'b0001;
		end
	else if (temp3) begin
		put = 1'b1;
		pos = 4'b0010;
		end
	else if (temp4) begin
		put = 1'b1;
		pos = 4'b0011;
		end
	else if (temp5) begin
		put = 1'b1;
		pos = 4'b0100;
		end
	else if (temp6) begin
		put = 1'b1;
		pos = 4'b0101;
		end
	else if (temp7) begin
		put = 1'b1;
		pos = 4'b0110;
		end
	else if (temp8) begin
		put = 1'b1;
		pos = 4'b0111;
		end
	else if (temp9) begin
		put = 1'b1;
		pos = 4'b1000;
		end
	else begin
		put = 1'b0;
		pos = 4'b0000;
		end
end
always @(*) begin
	put_random = put;
	position_random = pos;
end


	
endmodule