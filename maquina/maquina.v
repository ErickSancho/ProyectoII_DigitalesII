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
    output reg [4:0] errors_out,
    output reg active_out,
    output reg idle_out);

    reg [4:0] estado, estado_proximo;

    // Salidas intermedias:
    reg [1:0] Umbrales_MFs_internos_temp;
    reg [1:0] Umbrales_VCs_internos_temp;
    reg [1:0] Umbrales_Ds_internos_temp;
    reg error_out_temp;
    reg [4:0] errors_out_temp;
    reg active_out_temp;
    reg idle_out_temp;

    // Se guarda el valor de los errores
    reg [4:0] FIFO_errors_temp;

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
            errors_out <= 00000;
            active_out <= 0;
            idle_out <= 0;
            FIFO_errors_temp <= 00000;
        end

        else begin
            Umbrales_MFs_internos <= Umbrales_MFs_internos_temp;
            Umbrales_VCs_internos <= Umbrales_VCs_internos_temp;
            Umbrales_Ds_internos <= Umbrales_Ds_internos_temp;
            error_out <= error_out_temp;
            errors_out <= errors_out_temp;
            active_out <= active_out_temp;
            idle_out <= idle_out_temp;
            FIFO_errors_temp <= FIFO_errors;
        end
    end

    always @ (posedge clk) begin
        if (!reset) estado <= RESET;
        else estado <= estado_proximo;
    end

    always @ (*) begin

        // Valores por defecto
        idle_out_temp = 0;
        active_out_temp = 0;
        error_out_temp = 0;
        errors_out_temp = 00000;
        Umbrales_MFs_internos_temp = Umbrales_MFs_internos;
        Umbrales_VCs_internos_temp = Umbrales_VCs_internos;
        Umbrales_Ds_internos_temp = Umbrales_Ds_internos;

        estado_proximo = estado;

        case(estado)
        
            RESET: begin

                estado_proximo = INIT;

            end

            INIT: begin

                Umbrales_MFs_internos_temp = Umbrales_MFs;
                Umbrales_VCs_internos_temp = Umbrales_VCs;
                Umbrales_Ds_internos_temp = Umbrales_Ds;

                estado_proximo = IDLE;

                if (init) estado_proximo = INIT;

            end

            IDLE: begin
   
                idle_out_temp = 1;

                if (init) estado_proximo = INIT;
                else if (FIFO_errors != 'b00000) estado_proximo = ERROR;
                else if (FIFO_empties != 'b11111) estado_proximo = ACTIVE;

            end

            ACTIVE: begin

                active_out_temp = 1;

                if (init) estado_proximo = INIT;
                else if (FIFO_errors != 'b00000) estado_proximo = ERROR;
                else if (FIFO_empties == 'b11111) estado_proximo = IDLE;

            end

            ERROR: begin

                error_out_temp = 1;
                errors_out_temp = FIFO_errors_temp;

                if (reset) estado_proximo = RESET;

            end

            default:
                estado_proximo = RESET;
        
        endcase

    end

endmodule