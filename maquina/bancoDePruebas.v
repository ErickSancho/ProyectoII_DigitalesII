`timescale 	1ns				/ 100ps

`include "maquina.v"
`include "maquina_E.v"
`include "probador.v"

module BancoPruebas; 
	wire clk, reset, init, active_out, error_out, idle_out, active_out_E, error_out_E, idle_out_E;
	wire [1:0] Umbrales_MFs, Umbrales_VCs, Umbrales_Ds, Umbrales_MFs_internos, Umbrales_VCs_internos, Umbrales_Ds_internos;
	wire [4:0] FIFO_empties, FIFO_errors;

	// Descripcion conductual
	maquina cond1(	 /*AUTOINST*/
		      // Outputs
		      .Umbrales_MFs_internos(Umbrales_MFs_internos[1:0]),
		      .Umbrales_VCs_internos(Umbrales_VCs_internos[1:0]),
		      .Umbrales_Ds_internos(Umbrales_Ds_internos[1:0]),
		      .error_out	(error_out),
		      .active_out	(active_out),
		      .idle_out		(idle_out),
		      // Inputs
		      .clk		(clk),
		      .reset		(reset),
		      .init		(init),
		      .Umbrales_MFs	(Umbrales_MFs[1:0]),
		      .Umbrales_VCs	(Umbrales_VCs[1:0]),
		      .Umbrales_Ds	(Umbrales_Ds[1:0]),
		      .FIFO_empties	(FIFO_empties[4:0]),
		      .FIFO_errors	(FIFO_errors[4:0]));

	maquina_E est1 ( /*AUTOINST*/
			// Outputs
			.Umbrales_Ds_internos(Umbrales_Ds_internos[1:0]),
			.Umbrales_MFs_internos(Umbrales_MFs_internos[1:0]),
			.Umbrales_VCs_internos(Umbrales_VCs_internos[1:0]),
			.active_out_E	(active_out_E),
			.error_out_E	(error_out_E),
			.idle_out_E	(idle_out_E),
			// Inputs
			.FIFO_empties	(FIFO_empties[4:0]),
			.FIFO_errors	(FIFO_errors[4:0]),
			.Umbrales_Ds	(Umbrales_Ds[1:0]),
			.Umbrales_MFs	(Umbrales_MFs[1:0]),
			.Umbrales_VCs	(Umbrales_VCs[1:0]),
			.clk		(clk),
			.init		(init),
			.reset		(reset));

	// Probador
	probador probador_(		 /*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset		(reset),
			   .init		(init),
			   .Umbrales_MFs	(Umbrales_MFs),
			   .Umbrales_VCs	(Umbrales_VCs),
			   .Umbrales_Ds		(Umbrales_Ds),
			   .FIFO_empties	(FIFO_empties[4:0]),
			   .FIFO_errors		(FIFO_errors[4:0]),
			   // Inputs
			   .Umbrales_MFs_internos(Umbrales_MFs_internos[1:0]),
			   .Umbrales_VCs_internos(Umbrales_VCs_internos[1:0]),
			   .Umbrales_Ds_internos(Umbrales_Ds_internos[1:0]),
			   .error_out		(error_out),
			   .active_out		(active_out),
			   .idle_out		(idle_out));

endmodule
