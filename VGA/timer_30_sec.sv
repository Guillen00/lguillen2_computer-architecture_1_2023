module timer_30_sec (
  input reg clock,
  input reg reset,
  input select,
  output reg finish,
  output reg counting,
  output reg finish_30sec
  );
  
reg [8:0] accum = 0;
reg status = 1'b1;

timer sec_one(clock,finish,counting);

always @(posedge clock or negedge reset) begin
	 if (~reset) begin
			accum = 0;
			finish_30sec <= 1'b0;	
		end
	 else if (~select) begin
		   accum = 0;
			finish_30sec <= 1'b0;
	 end
	 else if (accum == 10) begin 
				finish_30sec <= 1'b1;
				accum = accum +1;
			end
	 else if (accum == 12) begin
				finish_30sec <= 1'b0;
				accum = 0;
			end
	 
	 else if(status == 1'b1 && finish == 1'b1) begin
			status = 1'b0;
			accum = accum +1;
		end
	 
	 else if(status == 1'b0 && finish == 1'b0) begin
			status = 1'b1;
			accum = accum +1;
		end
end

endmodule