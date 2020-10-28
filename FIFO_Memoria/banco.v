`timescale 1ns / 10ps

module banco;

parameter MEM_SIZE = 4;     //Tamano de memoria (Cantidad de entradas)
parameter WORD_SIZE = 6;    //Cantidad de bits
parameter PTR_L = 3;         //Longitud de bits para el puntero


/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			almost_empty;		// From FIFO_cond of fifo.v
wire			almost_empty_synth;	// From FIFO_estr of fifo_synth.v
wire			almost_full;		// From FIFO_cond of fifo.v
wire			almost_full_synth;	// From FIFO_estr of fifo_synth.v
wire			clk;			// From probador of probador.v
wire [PTR_L-1:0]	empty_threshold;	// From probador of probador.v
wire			error;			// From FIFO_cond of fifo.v
wire			error_synth;		// From FIFO_estr of fifo_synth.v
wire [WORD_SIZE-1:0]	fifo_data_in;		// From probador of probador.v
wire [WORD_SIZE-1:0]	fifo_data_out;		// From FIFO_cond of fifo.v
wire [5:0]		fifo_data_out_synth;	// From FIFO_estr of fifo_synth.v
wire			fifo_empty;		// From FIFO_cond of fifo.v
wire			fifo_empty_synth;	// From FIFO_estr of fifo_synth.v
wire			fifo_full;		// From FIFO_cond of fifo.v
wire			fifo_full_synth;	// From FIFO_estr of fifo_synth.v
wire			fifo_rd;		// From probador of probador.v
wire			fifo_wr;		// From probador of probador.v
wire [PTR_L-1:0]	full_threshold;		// From probador of probador.v
wire			reset_L;		// From probador of probador.v
// End of automatics

fifo FIFO_cond(/*AUTOINST*/
	       // Outputs
	       .fifo_data_out		(fifo_data_out[WORD_SIZE-1:0]),
	       .error			(error),
	       .almost_empty		(almost_empty),
	       .almost_full		(almost_full),
	       .fifo_full		(fifo_full),
	       .fifo_empty		(fifo_empty),
	       // Inputs
	       .fifo_wr			(fifo_wr),
	       .fifo_rd			(fifo_rd),
	       .fifo_data_in		(fifo_data_in[WORD_SIZE-1:0]),
	       .full_threshold		(full_threshold[PTR_L-1:0]),
	       .empty_threshold		(empty_threshold[PTR_L-1:0]),
	       .clk			(clk),
	       .reset_L			(reset_L));

fifo_synth FIFO_estr(/*AUTOINST*/
		     // Outputs
		     .almost_empty_synth(almost_empty_synth),
		     .almost_full_synth	(almost_full_synth),
		     .error_synth	(error_synth),
		     .fifo_data_out_synth(fifo_data_out_synth[5:0]),
		     .fifo_empty_synth	(fifo_empty_synth),
		     .fifo_full_synth	(fifo_full_synth),
		     // Inputs
		     .clk		(clk),
		     .empty_threshold	(empty_threshold[2:0]),
		     .fifo_data_in	(fifo_data_in[5:0]),
		     .fifo_rd		(fifo_rd),
		     .fifo_wr		(fifo_wr),
		     .full_threshold	(full_threshold[2:0]),
		     .reset_L		(reset_L));

probador probador(/*AUTOINST*/
		  // Outputs
		  .fifo_data_in		(fifo_data_in[WORD_SIZE-1:0]),
		  .fifo_rd		(fifo_rd),
		  .fifo_wr		(fifo_wr),
		  .empty_threshold	(empty_threshold[PTR_L-1:0]),
		  .full_threshold	(full_threshold[PTR_L-1:0]),
		  .clk			(clk),
		  .reset_L		(reset_L),
		  // Inputs
		  .fifo_data_out	(fifo_data_out[WORD_SIZE-1:0]),
		  .fifo_data_out_synth	(fifo_data_out_synth[WORD_SIZE-1:0]),
		  .almost_empty		(almost_empty),
		  .almost_full		(almost_full),
		  .fifo_full		(fifo_full),
		  .fifo_empty		(fifo_empty),
		  .error		(error),
		  .almost_empty_synth	(almost_empty_synth),
		  .almost_full_synth	(almost_full_synth),
		  .fifo_full_synth	(fifo_full_synth),
		  .fifo_empty_synth	(fifo_empty_synth),
		  .error_synth		(error_synth));
    
endmodule
