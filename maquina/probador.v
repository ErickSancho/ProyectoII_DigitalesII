module probador (
    output reg clk,
    output reg reset,
    output reg init,
    output reg [1:0] Umbrales_MFs,
    output reg [1:0] Umbrales_VCs,
    output reg [1:0] Umbrales_Ds,
    output reg [4:0] FIFO_empties,
    output reg [4:0] FIFO_errors,
    input [1:0] Umbrales_MFs_internos,
    input [1:0] Umbrales_VCs_internos,
    input [1:0] Umbrales_Ds_internos,
    input error_out,
    input active_out,
    input idle_out);

    initial begin
        $dumpfile("mux.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables

        // valores iniciales
        reset <= 0;
        init <= 0;
        Umbrales_MFs <= 00;
        Umbrales_VCs <= 00;
        Umbrales_Ds <= 00;
        FIFO_empties <= 'b11111; // Todos estan activos
        FIFO_errors <= 'b00000; // Ninguno tiene error

        repeat(5) begin
            @(posedge clk);
        end

        @(posedge clk);
        reset <= 1;
        Umbrales_MFs <= 11;
        Umbrales_VCs <= 10;
        Umbrales_Ds <= 01;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        FIFO_empties <= 'b11011;

        @(posedge clk);
        FIFO_empties <= 'b01011;
        Umbrales_MFs <= 10;
        Umbrales_VCs <= 01;
        Umbrales_Ds <= 11;

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