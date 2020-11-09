module probador
# (
    parameter PTR_L = 5         //Longitud de bits para el puntero
)
 (
    output reg reset,
    output reg clk,
    output reg init,
    output reg [PTR_L-1:0] umbral_M_full,
    output reg [PTR_L-1:0] umbral_M_empty,
    output reg [PTR_L-1:0] umbral_V_full,
    output reg [PTR_L-1:0] umbral_V_empty,
    output reg [PTR_L-1:0] umbral_D_full,
    output reg [PTR_L-1:0] umbral_D_empty,
    output reg [5:0] data_in,
    output reg push_data_in,
    output reg pop_D0,
    output reg pop_D1,
    input [5:0] data_out0,
    input [5:0] data_out1,
    input error_out,
    input active_out,
    input idle_out,
    input [4:0] errors,
    input MAIN_FIFO_pause
    );

    initial begin
        $dumpfile("dispositivo.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables

        // valores iniciales
        reset <= 0;
        init <= 0;
        umbral_M_full <= 0;
        umbral_M_empty <= 0;
        umbral_V_full <= 0;
        umbral_V_empty <= 0;
        umbral_D_full <= 0;
        umbral_D_empty <= 0;
        data_in <= 0;
        push_data_in <= 0;
        pop_D0 <= 0;
        pop_D1 <= 0;

        repeat(6) begin
            @(posedge clk);
        end

        @(posedge clk);
        reset <= 1;
        
        
        @(posedge clk);

        umbral_M_full <= 3; // 1 menos del total
        umbral_M_empty <= 1;
        umbral_V_full <= 15; // 1 menos del total
        umbral_V_empty <= 1;
        umbral_D_full <= 3; // 1 menos del total
        umbral_D_empty <= 1;
        
        @(posedge clk);
        repeat(40) begin
            @(posedge clk);
            data_in <= data_in + 1; // Todos irian a VC0 y D0
            if (!MAIN_FIFO_pause) begin
                push_data_in<=1;
            end
            else 
                push_data_in<=0;
            
        end
        repeat (20) begin
            @(posedge clk);
            pop_D0 <= 1;
        end


        @(posedge clk);
        pop_D0 <= 0;
        pop_D1 <= 0; // Deberia dar error
        
        $finish;
    end

    // clock
    initial clk <= 0;
    always #20 clk <= ~clk; //hace toggle cada 20 nanosegundos

endmodule