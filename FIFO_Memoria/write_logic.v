module write_logic 
#(
    parameter MEM_SIZE = 4,     //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6,    //Cantidad de bits
    parameter PTR_L = 3         //Longitud de bits para el puntero
)
(
    input fifo_wr,
    input fifo_full,
    input clk,
    input reset_L,
    output reg [PTR_L-1:0] wr_ptr,
    output reg push
);

always @(posedge clk) begin
    if (!reset_L) begin
        wr_ptr <= 0;
        push <= 0;
    end 
    else begin
        if (fifo_wr && !fifo_full) begin
            push <= 1;
            wr_ptr <= wr_ptr + 1;
            if (wr_ptr == MEM_SIZE-1) begin
                wr_ptr <= 0;
            end
        end
        else begin
            push <= 0;
        end
    end
end

endmodule