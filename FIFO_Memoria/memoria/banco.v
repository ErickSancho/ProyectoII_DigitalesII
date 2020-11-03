`timescale 1ns / 10ps

module banco;

parameter MEM_SIZE = 4;     //Tamano de memoria (Cantidad de entradas)
parameter WORD_SIZE = 6;    //Cantidad de bits
parameter PTR_L = 3;         //Longitud de bits para el puntero

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			clk;			// From probador of probador.v
wire [WORD_SIZE-1:0]	data_in_MM;		// From probador of probador.v
wire [WORD_SIZE-1:0]	data_out_MM;		// From memoria_cond of memory.v
wire [5:0]		data_out_MM_synth;	// From memoria_synth of memory_synth.v
wire			pop;			// From probador of probador.v
wire			push;			// From probador of probador.v
wire [PTR_L-1:0]	rd_ptr;			// From probador of probador.v
wire			reset_L;		// From probador of probador.v
wire [PTR_L-1:0]	wr_ptr;			// From probador of probador.v
// End of automatics

memory memoria_cond(/*AUTOINST*/
		    // Outputs
		    .data_out_MM	(data_out_MM[WORD_SIZE-1:0]),
		    // Inputs
		    .rd_ptr		(rd_ptr[PTR_L-1:0]),
		    .wr_ptr		(wr_ptr[PTR_L-1:0]),
		    .data_in_MM		(data_in_MM[WORD_SIZE-1:0]),
		    .push		(push),
		    .pop		(pop),
		    .reset_L		(reset_L),
		    .clk		(clk));

memory_synth memoria_synth(/*AUTOINST*/
			   // Outputs
			   .data_out_MM_synth	(data_out_MM_synth[5:0]),
			   // Inputs
			   .clk			(clk),
			   .data_in_MM		(data_in_MM[5:0]),
			   .pop			(pop),
			   .push		(push),
			   .rd_ptr		(rd_ptr[2:0]),
			   .reset_L		(reset_L),
			   .wr_ptr		(wr_ptr[2:0]));

probador probador(/*AUTOINST*/
		  // Outputs
		  .rd_ptr		(rd_ptr[PTR_L-1:0]),
		  .wr_ptr		(wr_ptr[PTR_L-1:0]),
		  .data_in_MM		(data_in_MM[WORD_SIZE-1:0]),
		  .push			(push),
		  .pop			(pop),
		  .reset_L		(reset_L),
		  .clk			(clk),
		  // Inputs
		  .data_out_MM		(data_out_MM[WORD_SIZE-1:0]),
		  .data_out_MM_synth	(data_out_MM_synth[WORD_SIZE-1:0]));
    
endmodule
