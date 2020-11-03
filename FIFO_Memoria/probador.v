module probador 
#(
    parameter MEM_SIZE = 4,     //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6,    //Cantidad de bits
    parameter PTR_L = 3         //Longitud de bits para el puntero
)
(
    input [WORD_SIZE-1:0] fifo_data_out,
    input [WORD_SIZE-1:0] fifo_data_out_synth,
    input almost_empty,
    input almost_full,
    input fifo_full,
    input fifo_empty,
    input error,
    input almost_empty_synth,
    input almost_full_synth,
    input fifo_full_synth,
    input fifo_empty_synth,
    input error_synth,
    output reg [WORD_SIZE-1:0] fifo_data_in,
    output reg fifo_rd,
    output reg fifo_wr,
    output reg [PTR_L-1:0] empty_threshold,
    output reg [PTR_L-1:0] full_threshold,
    output reg reset_L,
    output reg clk);

    initial begin

        $dumpfile("Resultados.vcd");
        $dumpvars;
        //Inicializacion de variables
        fifo_data_in<=0;
        fifo_rd<=0;
        fifo_wr<=0;
        empty_threshold<=1;
        full_threshold<=MEM_SIZE-1;
        reset_L<=0;
        //Secuencia de ciclos con reset = 0
        repeat (5) begin
            @(posedge clk);
        end

        //Se levanta el reset
        @(posedge clk);
        reset_L<=1;

        //Se carga 3 datos en memoria
        repeat (4) begin
            @(posedge clk);
            fifo_wr<=1;
            fifo_data_in<=$random;
        end
        
        //Se comienza a leer los datos
        fifo_rd<=1;

        //Se realiza la lectura y escritura en paralelo por 10 ciclos seguidos
        repeat (10) begin
            @(posedge clk);
            fifo_data_in<=$random;
        end

        //Se termina de leer ingresar datos
        @(posedge clk);
        fifo_data_in<=$random;
        fifo_wr<=0;

        repeat (3) begin
            @(posedge clk);
            fifo_data_in<=$random;
        end
        //Se saca todos los datos sin llegar al error
        fifo_rd<=0;

        //Se realiza una prueba de las senales de error, para ello se comienza
        //por el caso de tener la memoria llena y querer seguir ingresando datos.
        
        repeat (8) begin
            @(posedge clk);
            fifo_wr<=1;
            fifo_data_in<=$random;
        end
        
        fifo_wr<=0;
        reset_L<=0;
        
        //En el segundo bloque de error se prueba el caso para el error de llegar a toda la memoria llena
        //e intentar hacer pop y push con la memoria llena
        @(posedge clk);
        fifo_data_in<=$random;
        reset_L<=1;
        repeat (4) begin
            @(posedge clk);
            fifo_wr<=1;
            fifo_data_in<=$random;
        end
        @(posedge clk);
        fifo_data_in<=$random;
        fifo_rd<=1;
        repeat (8) begin
            @(posedge clk);
            fifo_data_in<=$random;
        end
        
        @(posedge clk);
        reset_L<=0;
        repeat (3) begin
            @(posedge clk);
        end

        $finish;
    end

    initial clk <= 0;
    always #1 clk <= ~clk;

endmodule