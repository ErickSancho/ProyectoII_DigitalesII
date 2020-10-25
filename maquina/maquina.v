module maquina (
    input reset,
    input init,
    input Umbrales_MFs,
    input Umbrales_VCs,
    input Umbrales_Ds,
    input [4:0] FIFO_empties,
    input [4:0] FIFO_errors,
    output Umbrales_internos,
    output error_out,
    output active_out,
    output idle_out);

    reg [1:0] estado, estado_proximo;

    parameter RESET = 0;
    parameter INIT = ;
    parameter IDLE = ;
    parameter ACTIVE = ;
    parameter ERROR = ;

    always @ (posedge clk) begin
        if (!reset) estado <= RESET;
        else estado <= estado_proximo;
    end

    always @ (*) begin
        estado_proximo = estado;

        case(estado)
        
            RESET: begin

            end

            INIT: begin

            end

            IDLE: begin

            end

            ACTIVE: begin

            end

            ERROR: begin

            end
        
        endcase

    end

endmodule