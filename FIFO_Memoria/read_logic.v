module read_logic 
#(
    parameter MEM_SIZE = 4,   //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6,    //Cantidad de bits
    parameter PTR_L = 3        //Longitud de bits para el puntero
)
(
    input fifo_rd,
    input fifo_empty,
    input clk,
    input reset_L,
    output reg [PTR_L-1:0] rd_ptr,
    output reg pop
);

always @(*) begin
    if (reset_L) begin
        if (fifo_rd && !fifo_empty) begin
            pop = 1;
        end
        else begin
            pop = 0;
        end
    end
    else begin
        pop=0;
    end
    
end

always @(posedge clk) begin
    if (!reset_L) begin
        rd_ptr <= 0;
    end 
    else begin
        if (fifo_rd && !fifo_empty) begin
            rd_ptr <= rd_ptr + 1;
            if (rd_ptr == MEM_SIZE-1) begin 
                rd_ptr <= 0;
            end
        end 
    end
end

endmodule