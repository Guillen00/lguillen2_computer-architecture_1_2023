module dmem_ram(input logic switchStart, clk, we,
                input logic [31:0] address, wd,
                output logic [31:0] rd);

    logic [31:0] dmem_RAM[0:129599];
    // synthesis translate_off
    always @(switchStart)
    $writememh("/home/guillen/Downloads/Arqui/proyecto2_arqui_hecho/Proyecto 2/procesador-pipeline-final/procesador-pipeline/imageOutput.txt", dmem_RAM);
    // synthesis translate_on

    // Memory meant to be read.
    /*always_ff @(negedge clk)
        begin
            if (address >= 'd0 && address <= 'd129599)
                rd = {31'b0, dmem_RAM[address]};
            else
                begin
                rd = 32'b0;
                //$writememh("C:\altera\14.1\procesador_pipeline\imageOutput.txt", dmem_RAM);
                end
        end*/

    // Memory meant to be written.
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