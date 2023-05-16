module dmem_ram(input logic switchStart, clk, we,
                input logic [31:0] address, wd,
                output logic [31:0] rd);

    logic [31:0] dmem_RAM[0:129599];
    always @(switchStart)
    $writememh("/home/ridivi/intelFPGA_lite/22.1std/Projects/gpttuto/VGA/imageOutput.txt", dmem_RAM);


    // Escribe en memoria 
    always_ff @(posedge clk)
        begin
            if (we) 
                begin
                    if (address >= 'd0 && address <= 'd129599)
                        begin
                        dmem_RAM[address] <= wd;
                        //$writememh("C:\altera\14.1\procesador_pipeline\imageOutput.txt", dmem_RAM);
                        // DIRECCION DE NACHO NAVARRO
                        end


                end
        end
    assign rd = {31'b0, dmem_RAM[address]};





endmodule