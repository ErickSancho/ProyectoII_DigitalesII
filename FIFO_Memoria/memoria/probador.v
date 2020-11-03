module probador 
#(
    parameter MEM_SIZE = 4,     //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6,    //Cantidad de bits
    parameter PTR_L = 3         //Longitud de bits para el puntero
)
(
    output reg [PTR_L-1:0] rd_ptr,
    output reg [PTR_L-1:0] wr_ptr,
    output reg [WORD_SIZE-1:0] data_in_MM,
    output reg push,
    output reg pop,
    output reg reset_L,
    output reg clk,
    input [WORD_SIZE-1:0] data_out_MM,
    input [WORD_SIZE-1:0] data_out_MM_synth);

    initial begin

        $dumpfile("Memoria.vcd");
        $dumpvars;
        
        reset_L<=0;
        rd_ptr<=0;
        wr_ptr<=0;
        data_in_MM<=0;
        push<=0;
        pop<=0;

        repeat (5) begin
            @(posedge clk);
        end
        
        reset_L<=1;

        //Pruebo a escribir
        @(posedge clk);
        data_in_MM<=$random;
        push<=1;
        repeat (3) begin
            @(posedge clk)
            data_in_MM<=$random;
            push<=1;
            wr_ptr<= wr_ptr+1;
        end
        
        //lectura
        @(posedge clk);
        wr_ptr<=0;
        data_in_MM<=0;
        pop<=1;
        push<=0;
        repeat (3) begin
            @(posedge clk)
            push<=1;
            rd_ptr<= rd_ptr+1;
        end
        
        repeat (5) begin
            @(posedge clk)
            rd_ptr<=0;
            wr_ptr<=0;
            data_in_MM<=0;
            push<=0;
            pop<=0;
        end

        //Ambos
        @(posedge clk);
        wr_ptr<=0;
        data_in_MM<=$random;
        pop<=0;
        push<=1;
        rd_ptr<=0;
        wr_ptr<=0;
        repeat (3) begin
            @(posedge clk)
            pop<=1;
            rd_ptr<= rd_ptr+1;
        end


        $finish;
    end

    initial clk <= 0;
    always #1 clk <= ~clk;

endmodule