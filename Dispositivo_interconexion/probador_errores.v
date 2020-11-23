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
    input next_pop_D0,
    input next_pop_D1,
    input MAIN_FIFO_pause,
    input [5:0] data_out0_synth,
    input [5:0] data_out1_synth,
    input error_out_synth,
    input active_out_synth,
    input idle_out_synth,
    input [4:0] errors_synth,
    input MAIN_FIFO_pause_synth,
    input next_pop_D0_synth,
    input next_pop_D1_synth);

    initial begin
        $dumpfile("dispositivo_errores.vcd");	// Nombre de archivo del "dump"
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

        repeat(4) begin
            @(posedge clk);
        end

        @(posedge clk);
        reset <= 1;       
        @(posedge clk);

        umbral_M_full <= 2; // 1 menos del total
        umbral_M_empty <= 1;
        umbral_V_full <= 15; // 1 menos del total
        umbral_V_empty <= 1;
        umbral_D_full <= 3; // 1 menos del total
        umbral_D_empty <= 1;


        @(posedge clk);
        data_in<=0;
        push_data_in <= 0;

        repeat(50) begin
            @(posedge clk);
            push_data_in<=1;
            data_in <= data_in + 1; // Todos irian a VC0 y D0
        end

        repeat (5) begin
            @(posedge clk);
            data_in<=0;
            push_data_in<=0;
        end
        reset<=0;
        repeat (10) begin
            @(posedge clk);
        end
        reset<=1;
        repeat (10) begin
            @(posedge clk);
        end

        @(posedge clk);
        repeat(40) begin
            @(posedge clk);
            if (!MAIN_FIFO_pause) begin
                push_data_in<=1;
                data_in <= (data_in + 1) | 'b110000; // Todos irian a VC0 y D0
            end
            else begin
                push_data_in<=0;
                data_in<=0;
            end
        end

        repeat (35) begin
            @(posedge clk);
            pop_D0 <= 1;
            pop_D1 <= 1;
        end

        repeat (35) begin
            @(posedge clk);
            reset<=0;
            data_in<=0;
            push_data_in<=0;
        end

        @(posedge clk);

        $finish;
    end

    // clock
    initial clk <= 0;
    always #1 clk <= ~clk; //hace toggle cada 2 nanosegundos

endmodule