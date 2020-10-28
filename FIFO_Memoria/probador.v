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

        fifo_data_in<=0;
        fifo_rd<=0;
        fifo_wr<=0;
        empty_threshold<=1;
        full_threshold<=MEM_SIZE-1;
        reset_L<=0;

        repeat (5) begin
            @(posedge clk);
            fifo_data_in<=$random;
        end

        @(posedge clk);
        fifo_data_in<=fifo_data_in+$random;
        reset_L<=1;
        fifo_wr<=1;

        repeat (3) begin
            @(posedge clk);
            fifo_data_in<=$random+8;
        end
        
        fifo_rd<=1;

        repeat (10) begin
            @(posedge clk);
            fifo_data_in<=$random;
        end
        @(posedge clk);
        fifo_data_in<=$random;
        fifo_wr<=0;

        repeat (10) begin
            @(posedge clk);
            fifo_data_in<=$random;
        end
        fifo_rd<=0;
        @(posedge clk);
        @(posedge clk);

        $finish;
    end

    initial clk <= 0;
    always #1 clk <= ~clk;

endmodule