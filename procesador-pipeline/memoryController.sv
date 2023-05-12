module memoryController (input logic clk, we, switchStart,
					 input logic [31:0] pc, address, wd,
					 output logic [31:0] rd, instruction
);
						 
	logic [31:0] mapAddressROM, mapAddressRAM, mapAddressInstructions, romData, ramData, instructionData,mapAddressSENO,SENOData;
						 
	dmem_ram ram (switchStart, clk, we, mapAddressRAM, wd, ramData);
	dmem_rom rom (mapAddressROM, romData);
	imem imem_rom (mapAddressInstructions, instructionData);
	dmem_seno seno (mapAddressSENO, SENOData);
	
	always_latch
		begin
		
			// Lee las intrucciones en ROM.
			if (pc >= 'd0 && pc < 'd399)
				begin
					mapAddressInstructions = pc;
					instruction = instructionData;
				end
		
			// Lee valores de pixeles en ROM.
			//if (address >= 'd400 && address < 'd90400)
			if (address >= 'd400 && address < 'd8500)
				begin
					mapAddressROM = address - 'd400;
					rd = romData;
				end
			
			//Obtiene el valor del seno respectivo	
			else if (address >= 'd8500 && address < 'd8800)
				begin
					mapAddressSENO = address - 'd8500;
					rd = SENOData;
				end
			// Guarda y lee valores en RAM.
			//else if (address >= 'd90400 && address < 'd220000)
			else if (address >= 'd8900 && address < 'd138100)
				begin
					//mapAddressRAM = address - 'd90400;
					mapAddressRAM = address - 'd8900;
					rd = ramData;
				end
			
				
			// Caso por deafult
			else
				begin
					mapAddressRAM = 32'b0;
					mapAddressROM = 32'b0;
					mapAddressSENO = 32'b0;
					rd = 32'b0;
				end
		end
						 
endmodule 