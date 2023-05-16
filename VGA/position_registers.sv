// Con ayuda del codifgo de fpga4student.com, modulo para guardar las posiciones de los jugadores 
module position_registers(
      input clock, // clock
      input reset, // reset  
      input illegal_move, // movimiento ilegal  
      input [8:0] PC_en, // J2 (pc)
      input [8:0] PL_en, // J1 
      output reg[1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9// guardar las posiciones 
      );
 // Position 1 
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos1 <= 2'b00;
  else begin
   if(illegal_move==1'b1)
    pos1 <= pos1;//mantiene la data antigua
   else if(PC_en[0]==1'b1)
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
   if(illegal_move==1'b1)
    pos2 <= pos2;// mantiene la data antigua
   else if(PC_en[1]==1'b1)
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
   if(illegal_move==1'b1)
    pos3 <= pos3;// mantiene la data antigua
   else if(PC_en[2]==1'b1)
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
   if(illegal_move==1'b1)
    pos4 <= pos4;// mantiene la data antigua
   else if(PC_en[3]==1'b1)
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
   if(illegal_move==1'b1)
    pos5 <= pos5;// mantiene la data antigua
   else if(PC_en[4]==1'b1)
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
   if(illegal_move==1'b1)
    pos6 <= pos6;//mantiene la data antigua
   else if(PC_en[5]==1'b1)
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
   if(illegal_move==1'b1)
    pos7 <= pos7;//mantiene la data antigua
   else if(PC_en[6]==1'b1)
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
   if(illegal_move==1'b1)
    pos8 <= pos8;// mantiene la data antigua
   else if(PC_en[7]==1'b1)
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
   if(illegal_move==1'b1)
    pos9 <= pos9;//mantiene la data antigua
   else if(PC_en[8]==1'b1)
    pos9 <= 2'b10; //  guarda J2(pc) info  
   else if (PL_en[8]==1'b1)
    pos9 <= 2'b01;// guarda J1 info  
   else 
    pos9 <= pos9;// mantiene la data antigua
  end 
 end  
endmodule 