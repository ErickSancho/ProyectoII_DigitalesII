`timescale 1ns/100ps

module banco;

    parameter MEM_SIZE = 4;     //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6;    //Cantidad de bits
    parameter PTR_L = 5;         //Longitud de bits para el puntero

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			MAIN_FIFO_pause;	// From Disp of PCIe.v
wire			MAIN_FIFO_pause_synth;	// From Disp_sint of PCIe_synth.v
wire			active_out;		// From Disp of PCIe.v
wire			active_out_synth;	// From Disp_sint of PCIe_synth.v
wire			next_pop_D0;	// From Disp of PCIe.v
wire			next_pop_D0_synth;	// From Disp_sint of PCIe_synth.v
wire			next_pop_D1;	// From Disp of PCIe.v
wire			next_pop_D1_synth;	// From Disp_sint of PCIe_synth.v
wire			clk;			// From test of probador.v
wire [5:0]		data_in;		// From test of probador.v
wire [5:0]		data_out0;		// From Disp of PCIe.v
wire [5:0]		data_out0_synth;	// From Disp_sint of PCIe_synth.v
wire [5:0]		data_out1;		// From Disp of PCIe.v
wire [5:0]		data_out1_synth;	// From Disp_sint of PCIe_synth.v
wire			error_out;		// From Disp of PCIe.v
wire			error_out_synth;	// From Disp_sint of PCIe_synth.v
wire [4:0]		errors;			// From Disp of PCIe.v
wire [4:0]		errors_synth;		// From Disp_sint of PCIe_synth.v
wire			idle_out;		// From Disp of PCIe.v
wire			idle_out_synth;		// From Disp_sint of PCIe_synth.v
wire			init;			// From test of probador.v
wire			pop_D0;			// From test of probador.v
wire			pop_D1;			// From test of probador.v
wire			push_data_in;		// From test of probador.v
wire			reset;			// From test of probador.v
wire [PTR_L-1:0]	umbral_D_empty;		// From test of probador.v
wire [PTR_L-1:0]	umbral_D_full;		// From test of probador.v
wire [PTR_L-1:0]	umbral_M_empty;		// From test of probador.v
wire [PTR_L-1:0]	umbral_M_full;		// From test of probador.v
wire [PTR_L-1:0]	umbral_V_empty;		// From test of probador.v
wire [PTR_L-1:0]	umbral_V_full;		// From test of probador.v
// End of automatics

PCIe Disp(/*AUTOINST*/
	  // Outputs
	  .data_out0			(data_out0[5:0]),
	  .data_out1			(data_out1[5:0]),
	  .error_out			(error_out),
	  .active_out			(active_out),
	  .idle_out			(idle_out),
	  .errors			(errors[4:0]),
	  .MAIN_FIFO_pause		(MAIN_FIFO_pause),
	  .next_pop_D0		(next_pop_D0),
	  .next_pop_D1		(next_pop_D1),
	  // Inputs
	  .reset			(reset),
	  .clk				(clk),
	  .init				(init),
	  .umbral_M_full		(umbral_M_full[PTR_L-1:0]),
	  .umbral_M_empty		(umbral_M_empty[PTR_L-1:0]),
	  .umbral_V_full		(umbral_V_full[PTR_L-1:0]),
	  .umbral_V_empty		(umbral_V_empty[PTR_L-1:0]),
	  .umbral_D_full		(umbral_D_full[PTR_L-1:0]),
	  .umbral_D_empty		(umbral_D_empty[PTR_L-1:0]),
	  .data_in			(data_in[5:0]),
	  .push_data_in			(push_data_in),
	  .pop_D0			(pop_D0),
	  .pop_D1			(pop_D1));

PCIe_synth Disp_sint(/*AUTOINST*/
		     // Outputs
		     .MAIN_FIFO_pause_synth(MAIN_FIFO_pause_synth),
		     .active_out_synth	(active_out_synth),
		     .next_pop_D0_synth(next_pop_D0_synth),
		     .next_pop_D1_synth(next_pop_D1_synth),
		     .data_out0_synth	(data_out0_synth[5:0]),
		     .data_out1_synth	(data_out1_synth[5:0]),
		     .error_out_synth	(error_out_synth),
		     .errors_synth	(errors_synth[4:0]),
		     .idle_out_synth	(idle_out_synth),
		     // Inputs
		     .clk		(clk),
		     .data_in		(data_in[5:0]),
		     .init		(init),
		     .pop_D0		(pop_D0),
		     .pop_D1		(pop_D1),
		     .push_data_in	(push_data_in),
		     .reset		(reset),
		     .umbral_D_empty	(umbral_D_empty[4:0]),
		     .umbral_D_full	(umbral_D_full[4:0]),
		     .umbral_M_empty	(umbral_M_empty[4:0]),
		     .umbral_M_full	(umbral_M_full[4:0]),
		     .umbral_V_empty	(umbral_V_empty[4:0]),
		     .umbral_V_full	(umbral_V_full[4:0]));

probador test(/*AUTOINST*/
	      // Outputs
	      .reset			(reset),
	      .clk			(clk),
	      .init			(init),
	      .umbral_M_full		(umbral_M_full[PTR_L-1:0]),
	      .umbral_M_empty		(umbral_M_empty[PTR_L-1:0]),
	      .umbral_V_full		(umbral_V_full[PTR_L-1:0]),
	      .umbral_V_empty		(umbral_V_empty[PTR_L-1:0]),
	      .umbral_D_full		(umbral_D_full[PTR_L-1:0]),
	      .umbral_D_empty		(umbral_D_empty[PTR_L-1:0]),
	      .data_in			(data_in[5:0]),
	      .push_data_in		(push_data_in),
	      .pop_D0			(pop_D0),
	      .pop_D1			(pop_D1),
	      // Inputs
	      .data_out0		(data_out0[5:0]),
	      .data_out1		(data_out1[5:0]),
	      .error_out		(error_out),
	      .active_out		(active_out),
	      .idle_out			(idle_out),
	      .errors			(errors[4:0]),
	      .next_pop_D0		(next_pop_D0),
	      .next_pop_D1		(next_pop_D1),
	      .MAIN_FIFO_pause		(MAIN_FIFO_pause),
	      .data_out0_synth		(data_out0_synth[5:0]),
	      .data_out1_synth		(data_out1_synth[5:0]),
	      .error_out_synth		(error_out_synth),
	      .active_out_synth		(active_out_synth),
	      .idle_out_synth		(idle_out_synth),
	      .errors_synth		(errors_synth[4:0]),
	      .MAIN_FIFO_pause_synth	(MAIN_FIFO_pause_synth),
	      .next_pop_D0_synth	(next_pop_D0_synth),
	      .next_pop_D1_synth	(next_pop_D1_synth));

endmodule
