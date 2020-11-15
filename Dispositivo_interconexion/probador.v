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
    input almost_empty_d0,
    input almost_empty_d1,
    input MAIN_FIFO_pause,
    input [5:0] data_out0_synth,
    input [5:0] data_out1_synth,
    input error_out_synth,
    input active_out_synth,
    input idle_out_synth,
    input [4:0] errors_synth,
    input MAIN_FIFO_pause_synth,
    input almost_empty_d0_synth,
    input almost_empty_d1_synth);

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
        umbral_V_full <= 14; // 1 menos del total
        umbral_V_empty <= 1;
        umbral_D_full <= 3; // 1 menos del total
        umbral_D_empty <= 1;
        

        @(posedge clk);
        repeat(79) begin
            @(posedge clk);
            if (!MAIN_FIFO_pause) begin
                push_data_in<=1;
                data_in <= data_in + 1; // Todos irian a VC0 y D0
            end
            else begin
                push_data_in<=0;
                data_in<=0;
            end
                

            
        end
        repeat (10) begin
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
        repeat(80) begin
            @(posedge clk);
            if (!MAIN_FIFO_pause) begin
                push_data_in<=1;
                data_in <= $random; // Todos irian a VC0 y D0
            end
            else begin
                push_data_in<=0;
                data_in<=0;
            end
                
            
        end
        repeat (50) begin
            @(posedge clk);
            data_in<=0;
            push_data_in<=0;
            // pop_D0 <= 1;
            // pop_D1 <= 1;
        end


        @(posedge clk);
        // pop_D0 <= 0;
        // pop_D1 <= 0; // Deberia dar error
        
        $finish;
    end

    // clock
    initial clk <= 0;
    always #1 clk <= ~clk; //hace toggle cada 20 nanosegundos

    // initial pop_D0 <= 0;
    // always #8 pop_D0 <= ~pop_D0; //hace toggle cada 20 nanosegundos

    // initial pop_D1 <= 1;
    // always #8 pop_D1 <= ~pop_D1; //hace toggle cada 20 nanosegundos
    always @(*) begin
        if(almost_empty_d0_synth == 1) begin
            pop_D0=0;
        end
        else begin
            pop_D0=1;
        end

        if(almost_empty_d1_synth == 1) begin
            pop_D1=0;
        end
        else begin
            pop_D1=1;
        end
    end


endmodule