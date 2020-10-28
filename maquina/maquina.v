module maquina (
    input clk,
    input reset,
    input init,
    input [1:0] Umbrales_MFs,
    input [1:0] Umbrales_VCs,
    input [1:0] Umbrales_Ds,
    input [4:0] FIFO_empties,
    input [4:0] FIFO_errors,
    output reg [1:0] Umbrales_MFs_internos,
    output reg [1:0] Umbrales_VCs_internos,
    output reg [1:0] Umbrales_Ds_internos,
    output reg error_out,
    output reg active_out,
    output reg idle_out);

    reg [4:0] estado, estado_proximo;

    parameter RESET = 1;
    parameter INIT = 2;
    parameter IDLE = 4;
    parameter ACTIVE = 8;
    parameter ERROR = 16;

    always @ (posedge clk) begin
        if (!reset) begin
            Umbrales_MFs_internos <= 00;
            Umbrales_VCs_internos <= 00;
            Umbrales_Ds_internos <= 00;
            error_out <= 0;
            active_out <= 0;
            idle_out <= 0;
        end
    end

    always @ (posedge clk) begin
        if (!reset) estado <= RESET;
        else estado <= estado_proximo;
    end

    always @ (*) begin

        // Valores por defecto
        idle_out = 0;
        active_out = 0;
        error_out = 0;
        Umbrales_MFs_internos = Umbrales_MFs_internos;
        Umbrales_VCs_internos = Umbrales_VCs_internos;
        Umbrales_Ds_internos = Umbrales_Ds_internos;
        estado_proximo = estado;

        case(estado)
        
            RESET: begin

                estado_proximo = INIT;

            end

            INIT: begin

                Umbrales_MFs_internos = Umbrales_MFs;
                Umbrales_VCs_internos = Umbrales_VCs;
                Umbrales_Ds_internos = Umbrales_Ds;

                estado_proximo = IDLE;

                if (init) estado_proximo = INIT;

            end

            IDLE: begin
   
                idle_out = 1;

                if (init) estado_proximo = INIT;
                else if (FIFO_errors != 'b00000) estado_proximo = ERROR;
                else if (FIFO_empties != 'b11111) estado_proximo = ACTIVE;

            end

            ACTIVE: begin

                active_out = 1;

                if (init) estado_proximo = INIT;
                else if (FIFO_errors != 'b00000) estado_proximo = ERROR;
                else if (FIFO_empties == 'b11111) estado_proximo = IDLE;

            end

            ERROR: begin

                error_out = 1;

                if (reset) estado_proximo = RESET;

            end

            default:
                estado_proximo = RESET;
        
        endcase

    end

endmodule