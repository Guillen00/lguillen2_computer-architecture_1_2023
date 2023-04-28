module imem (input logic [31:0] pc,
				output logic [31:0] instruction);
	
	logic [31:0] imem_ROM[399:0];
	
	initial
	
		// Instructions memory.
		// DIRECCIÓN DE JOSE
		//$readmemh("C:/altera/14.1/procesador_pipeline/instructions.txt", imem_ROM);
		// DIRECCIÓN DE NACHO NAVARRO
		$readmemh("/home/guillen/Downloads/Arqui/proyecto2_arqui_hecho/Proyecto 2/procesador-pipeline-final/procesador-pipeline/instructions.txt", imem_ROM);
		
		
	assign instruction = imem_ROM[pc[31:0]];
	
endmodule 