`timescale 	1ns				/ 100ps

`include "maquina.v"
`include "maquina_synth.v"
`include "probador.v"

module BancoPruebas; 
	wire clk, reset, init, active_out, error_out, idle_out, active_out_synth, error_out_synth, idle_out_synth;
	// Umbrales conductual:
	wire [1:0] Umbral_MF_alto, Umbral_MF_bajo, Umbral_VC_alto, Umbral_VC_bajo, Umbral_D_alto, Umbral_D_bajo;
	wire [1:0] Umbral_MF_alto_interno, Umbral_MF_bajo_interno, Umbral_VC_alto_interno, Umbral_VC_bajo_interno, Umbral_D_alto_interno, Umbral_D_bajo_interno;
	// Umbralles estructural:
	wire [1:0] Umbral_MF_alto_synth, Umbral_MF_bajo_synth, Umbral_VC_alto_synth, Umbral_VC_bajo_synth, Umbral_D_alto_synth, Umbral_D_bajo_synth;
	wire [1:0] Umbral_MF_alto_interno_synth, Umbral_MF_bajo_interno_synth, Umbral_VC_alto_interno_synth, Umbral_VC_bajo_interno_synth, Umbral_D_alto_interno_synth, Umbral_D_bajo_interno_synth;
	wire [4:0] FIFO_empties, FIFO_errors, errors_out, errors_out_synth;

	// Descripcion conductual
	maquina cond1(	 /*AUTOINST*/
		      // Outputs
		      .Umbral_MF_alto_interno(Umbral_MF_alto_interno[1:0]),
		      .Umbral_MF_bajo_interno(Umbral_MF_bajo_interno[1:0]),
		      .Umbral_VC_alto_interno(Umbral_VC_alto_interno[1:0]),
		      .Umbral_VC_bajo_interno(Umbral_VC_bajo_interno[1:0]),
		      .Umbral_D_alto_interno(Umbral_D_alto_interno[1:0]),
		      .Umbral_D_bajo_interno(Umbral_D_bajo_interno[1:0]),
		      .error_out	(error_out),
		      .errors_out	(errors_out[4:0]),
		      .active_out	(active_out),
		      .idle_out		(idle_out),
		      // Inputs
		      .clk		(clk),
		      .reset		(reset),
		      .init		(init),
		      .Umbral_MF_alto	(Umbral_MF_alto[1:0]),
		      .Umbral_MF_bajo	(Umbral_MF_bajo[1:0]),
		      .Umbral_VC_alto	(Umbral_VC_alto[1:0]),
		      .Umbral_VC_bajo	(Umbral_VC_bajo[1:0]),
		      .Umbral_D_alto	(Umbral_D_alto[1:0]),
		      .Umbral_D_bajo	(Umbral_D_bajo[1:0]),
		      .FIFO_empties	(FIFO_empties[4:0]),
		      .FIFO_errors	(FIFO_errors[4:0]));

	maquina_synth est1 ( /*AUTOINST*/
			    // Outputs
			    .Umbral_D_alto_interno_synth(Umbral_D_alto_interno_synth[1:0]),
			    .Umbral_D_bajo_interno_synth(Umbral_D_bajo_interno_synth[1:0]),
			    .Umbral_MF_alto_interno_synth(Umbral_MF_alto_interno_synth[1:0]),
			    .Umbral_MF_bajo_interno_synth(Umbral_MF_bajo_interno_synth[1:0]),
			    .Umbral_VC_alto_interno_synth(Umbral_VC_alto_interno_synth[1:0]),
			    .Umbral_VC_bajo_interno_synth(Umbral_VC_bajo_interno_synth[1:0]),
			    .active_out_synth	(active_out_synth),
			    .error_out_synth	(error_out_synth),
			    .errors_out_synth	(errors_out_synth[4:0]),
			    .idle_out_synth	(idle_out_synth),
			    // Inputs
			    .FIFO_empties	(FIFO_empties[4:0]),
			    .FIFO_errors	(FIFO_errors[4:0]),
			    .Umbral_D_alto	(Umbral_D_alto[1:0]),
			    .Umbral_D_bajo	(Umbral_D_bajo[1:0]),
			    .Umbral_MF_alto	(Umbral_MF_alto[1:0]),
			    .Umbral_MF_bajo	(Umbral_MF_bajo[1:0]),
			    .Umbral_VC_alto	(Umbral_VC_alto[1:0]),
			    .Umbral_VC_bajo	(Umbral_VC_bajo[1:0]),
			    .clk		(clk),
			    .init		(init),
			    .reset		(reset));

	// Probador
	probador probador_(		 /*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset		(reset),
			   .init		(init),
			   .Umbral_MF_alto	(Umbral_MF_alto[1:0]),
			   .Umbral_MF_bajo	(Umbral_MF_bajo[1:0]),
			   .Umbral_VC_alto	(Umbral_VC_alto[1:0]),
			   .Umbral_VC_bajo	(Umbral_VC_bajo[1:0]),
			   .Umbral_D_alto	(Umbral_D_alto[1:0]),
			   .Umbral_D_bajo	(Umbral_D_bajo[1:0]),
			   .FIFO_empties	(FIFO_empties[4:0]),
			   .FIFO_errors		(FIFO_errors[4:0]),
			   // Inputs
			   .Umbral_MF_alto_interno(Umbral_MF_alto_interno[1:0]),
			   .Umbral_MF_bajo_interno(Umbral_MF_bajo_interno[1:0]),
			   .Umbral_VC_alto_interno(Umbral_VC_alto_interno[1:0]),
			   .Umbral_VC_bajo_interno(Umbral_VC_bajo_interno[1:0]),
			   .Umbral_D_alto_interno(Umbral_D_alto_interno[1:0]),
			   .Umbral_D_bajo_interno(Umbral_D_bajo_interno[1:0]),
			   .error_out		(error_out),
			   .errors_out		(errors_out[4:0]),
			   .active_out		(active_out),
			   .idle_out		(idle_out));

endmodule
