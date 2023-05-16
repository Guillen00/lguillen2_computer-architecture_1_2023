module tic_tac_toe_game(
     input clock, // clock del juego 
     input reset, // reset del juego
     input play, // boton para jugar
     input pc, // boton para que juegue la pc 
	  input select,
     input [3:0] computer_position,player_position, 
     // posiciones para jugar
     output wire [1:0] pos11,pos22,pos33,pos44,pos55,pos66,pos77,pos88,pos99,
     // LED display for positions 
     // 01: Player 
     // 10: Computer 
     output wire[1:0]who, 
     // quien es el ganador
	  //Outputs para ver tiempo
	  output finish,
     output counting,
     output finish_30sec 
     );
	  
 wire [15:0] PC_en;// señal de activacion de pc
 wire [15:0] PL_en; // señal de activacion de jugador 
 wire illegal_move; // detecta movimiento ilegal
 wire time_out; // detecta si se acabó el tiempo
 wire win; // señal de ganador 
 wire computer_play; 
 wire player_play;  
 wire no_space; // señal de no espacio 
 reg status = 1'b1;
 wire new_play;
 wire new_pc;
 reg[1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9;
 
   //detecta si se acabó el tiempo
 timer_30_sec timer_30_segundos(clock,~reset,select,finish,counting,finish_30sec);
 
 always @(*) begin
	 if(finish_30sec==1'b1 && status == 1'b1) begin
		   status = 1'b0;
			new_play = ~play;
			new_pc = ~pc;	
		end
	 else if (status == 1'b0) status = 1'b1;
	 else begin
		new_play = play;
		new_pc = pc;
	 end
 end
 
 
 // registro de posiciones 
  position_registers position_reg_unit(
      clock,  
      reset, 
      illegal_move,
      PC_en[8:0], 
      PL_en[8:0], 
      pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9// guardar la posiciones 
      );
		
	mark_new_position mark_new_position(
      clock,  
      reset, 
      pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,
      PC_en[8:0], 
      PL_en[8:0], 
      status, new_pc, new_play,
		pos11,pos22,pos33,pos44,pos55,pos66,pos77,pos88,pos99
      );	
		
		//detector de gane
 winner_detector win_detect_unit(pos11,pos22,pos33,pos44,pos55,pos66,pos77,pos88,pos99,win,who);
 
 // detecta movimiento ilegal 
  illegal_move_detector imd_unit(
   pos11,pos22,pos33,pos44,pos55,pos66,pos77,pos88,pos99, 
   PC_en[8:0], PL_en[8:0], 
   illegal_move
   );
 
 // decodificador de posiciones pc
  position_decoder pd1(player_position,computer_play,PC_en);
 
 // decodificador de posiciones jugador 
  position_decoder pd2(computer_position,player_play,PL_en);
 
 
 //detecta falta de espacios 
 nospace_detector nsd_unit(
   pos11,pos22,pos33,pos44,pos55,pos66,pos77,pos88,pos99, 
   no_space
    ); 
	 
 fsm_controller tic_tac_toe_controller(
     clock,// clock 
     reset,// reset 
     new_play, // juega jugador 
     new_pc,// juega jugador 2 (pc)
     illegal_move,// detecta movimiento ilegal 
     no_space, // detecta falta de espacio 
     win, // detecta ganador
     computer_play, // activa el juego de jugador 2 (pc)
     player_play // activa el juego de jugador
);    
endmodule 