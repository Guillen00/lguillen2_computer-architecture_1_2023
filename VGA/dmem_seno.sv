module dmem_seno (input logic [31:0] address,
				output logic [31:0] rd);
	
	logic signed [31:0] dmem_seno[0:8099];
	
	initial
	
		//Lee valores del seno
		$readmemh("/home/ridivi/intelFPGA_lite/22.1std/Projects/gpttuto/VGA/seno.txt", dmem_seno);
		
		
	assign rd = dmem_seno[address[31:0]];
	
endmodule 