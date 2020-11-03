module memory 
#(
    parameter MEM_SIZE = 4,   //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6,    //Cantidad de bits
    parameter PTR_L = 3)        //Longitud de bits para el puntero
 (
    input [PTR_L-1:0] rd_ptr,
    input [PTR_L-1:0] wr_ptr,
    input [WORD_SIZE-1:0] data_in_MM,
    input push,
    input pop,
    input reset_L,
    input clk,
    output reg [WORD_SIZE-1:0] data_out_MM);

reg [WORD_SIZE-1:0] Mem [MEM_SIZE-1:0]; //Matriz memoria                         
integer i;

always @(posedge clk)begin

    if(!reset_L)begin //Inicializacion
        data_out_MM <= 0;
        for(i = 0; i < MEM_SIZE; i = i + 1) begin
            Mem[i] <= 0;
        end
    end    
    else begin //Lectura Escritura

        if(push) begin
            Mem[wr_ptr] <= data_in_MM;
        end    

        if(pop) begin
            data_out_MM <= Mem[rd_ptr];
        end

        else begin
            data_out_MM <= 0; 
        end
    end   
end

endmodule