module probador (
    output reg clk,
    output reg reset,
    output reg init,
    output reg [1:0] Umbral_MF_alto,
    output reg [1:0] Umbral_MF_bajo,
    output reg [1:0] Umbral_VC_alto,
    output reg [1:0] Umbral_VC_bajo,
    output reg [1:0] Umbral_D_alto,
    output reg [1:0] Umbral_D_bajo,
    output reg [4:0] FIFO_empties,
    output reg [4:0] FIFO_errors,
    input[1:0] Umbral_MF_alto_interno,
    input[1:0] Umbral_MF_bajo_interno,
    input[1:0] Umbral_VC_alto_interno,
    input[1:0] Umbral_VC_bajo_interno,
    input[1:0] Umbral_D_alto_interno,
    input[1:0] Umbral_D_bajo_interno,
    input error_out,
    input [4:0] errors_out,
    input active_out,
    input idle_out);

    initial begin
        $dumpfile("mux.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables

        // valores iniciales
        reset <= 0;
        init <= 0;
        Umbral_MF_alto <= 00;
        Umbral_VC_alto <= 00;
        Umbral_D_alto <= 00;
        Umbral_MF_bajo <= 00;
        Umbral_VC_bajo <= 00;
        Umbral_D_bajo <= 00;
        FIFO_empties <= 'b11111; // Todos estan activos
        FIFO_errors <= 'b00000; // Ninguno tiene error

        repeat(5) begin
            @(posedge clk);
        end

        @(posedge clk);
        reset <= 1;
        Umbral_MF_alto <= 01;
        Umbral_VC_alto <= 10;
        Umbral_D_alto <= 11;
        Umbral_MF_bajo <= 10;
        Umbral_VC_bajo <= 01;
        Umbral_D_bajo <= 11;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        FIFO_empties <= 'b11011;

        @(posedge clk);
        FIFO_empties <= 'b01011;
        Umbral_MF_alto <= 10;
        Umbral_VC_alto <= 01;
        Umbral_D_alto <= 10;
        Umbral_MF_bajo <= 11;
        Umbral_VC_bajo <= 11;
        Umbral_D_bajo <= 00;

        @(posedge clk);

        @(posedge clk);
        FIFO_errors <= 'b00010;

        @(posedge clk);
        FIFO_errors <= 'b00000;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        init <= 1;

        @(posedge clk);
        init <= 0;

        repeat(6) begin
            @(posedge clk);
        end
        
        $finish;
    end

    // clock
    initial clk <= 0;
    always #20 clk <= ~clk; //hace toggle cada 20 nanosegundos

endmodule