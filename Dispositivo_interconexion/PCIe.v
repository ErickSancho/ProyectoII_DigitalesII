module PCIe
#(
    parameter MEM_SIZE = 4,     //Tamano de memoria (Cantidad de entradas)
    parameter MEM_SIZE_VCs = 16,     //Tamano de memoria (Cantidad de entradas)
    parameter WORD_SIZE = 6,    //Cantidad de bits
    parameter PTR_L = 5         //Longitud de bits para el puntero
)
(
    input reset,
    input clk,
    input init,
    input [PTR_L-1:0] umbral_M_full,
    input [PTR_L-1:0] umbral_M_empty,
    input [PTR_L-1:0] umbral_V_full,
    input [PTR_L-1:0] umbral_V_empty,
    input [PTR_L-1:0] umbral_D_full,
    input [PTR_L-1:0] umbral_D_empty,
    input [5:0] data_in,
    input push_data_in,
    input pop_D0,
    input pop_D1,
    output [5:0] data_out0,
    output [5:0] data_out1,
    output error_out,
    output active_out,
    output idle_out,
    output [4:0] errors,
    output MAIN_FIFO_pause,
	output almost_empty_d0,
	output almost_empty_d1);

/*AUT*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [4:0]		Umbral_D_alto_interno;	// From MAQ of maquina.v
wire [4:0]		Umbral_D_bajo_interno;	// From MAQ of maquina.v
wire [4:0]		Umbral_MF_alto_interno;	// From MAQ of maquina.v
wire [4:0]		Umbral_MF_bajo_interno;	// From MAQ of maquina.v
wire [4:0]		Umbral_VC_alto_interno;	// From MAQ of maquina.v
wire [4:0]		Umbral_VC_bajo_interno;	// From MAQ of maquina.v
wire			almost_empty;		// From FIFOMAin of fifo.v, ...
wire			almost_full;		// From FIFOMAin of fifo.v, ...
wire [5:0]		data_out;		// From MUX of mux.v
wire [5:0]		data_out_0;		// From demux_main_Vcs of demux.v, ...
wire [5:0]		data_out_1;		// From demux_main_Vcs of demux.v, ...
wire			error;			// From FIFOMAin of fifo.v, ...
wire [4:0]		errors_out;		// From MAQ of maquina.v
wire [WORD_SIZE-1:0]	fifo_data_out;		// From FIFOMAin of fifo.v, ...
wire			fifo_empty;		// From FIFOMAin of fifo.v, ...
wire			fifo_full;		// From FIFOMAin of fifo.v, ...
wire			pop_Main;		// From logica_main_Pop_Push of Pop_Main_and_Valid.v
wire			push_0;			// From demux_main_Vcs of demux.v, ...
wire			push_1;			// From demux_main_Vcs of demux.v, ...
wire			valid_pop_out;		// From logica_main_Pop_Push of Pop_Main_and_Valid.v
// End of automatics

// Cables extra
wire [4:0] FIFO_empties;
wire [4:0] FIFO_errors;
wire [5:0] data_in_0, data_in_1;
wire [5:0] data_out_dest_0;
wire [5:0] data_out_dest_1;
wire pause_d0, pause_d1;

wire vc0_empty, vc1_empty;

maquina MAQ(/**/
	    // Outputs
	    .Umbral_MF_alto_interno	(Umbral_MF_alto_interno[4:0]),
	    .Umbral_MF_bajo_interno	(Umbral_MF_bajo_interno[4:0]),
	    .Umbral_VC_alto_interno	(Umbral_VC_alto_interno[4:0]),
	    .Umbral_VC_bajo_interno	(Umbral_VC_bajo_interno[4:0]),
	    .Umbral_D_alto_interno	(Umbral_D_alto_interno[4:0]),
	    .Umbral_D_bajo_interno	(Umbral_D_bajo_interno[4:0]),
	    .error_out			(error_out),
	    .errors_out			(errors_out[4:0]),
	    .active_out			(active_out),
	    .idle_out			(idle_out),
	    // Inputs
	    .clk			(clk),
	    .reset			(reset),
	    .init			(init),
	    .Umbral_MF_alto		(umbral_M_full[4:0]),
	    .Umbral_MF_bajo		(umbral_M_empty[4:0]),
	    .Umbral_VC_alto		(umbral_V_full[4:0]),
	    .Umbral_VC_bajo		(umbral_V_empty[4:0]),
	    .Umbral_D_alto		(umbral_D_full[4:0]),
	    .Umbral_D_bajo		(umbral_D_empty[4:0]),
	    .FIFO_empties		(FIFO_empties[4:0]),
	    .FIFO_errors		(FIFO_errors[4:0])); 

fifo #(.MEM_SIZE (MEM_SIZE)
        ) FIFOMAin(/**/   // Listo
	      // Outputs
	      .fifo_data_out		(fifo_data_out[WORD_SIZE-1:0]),
	      .error			(FIFO_errors[4]),
	    //   .almost_empty		(empy_main_FIFO),
	      .almost_full		(MAIN_FIFO_pause),
	    //   .fifo_full		(fifo_full),   //No se toca por el momento
	      .fifo_empty		(FIFO_empties[4]),  //No se toca por el momento
	      // Inputs
	      .fifo_wr			(push_data_in),
	      .fifo_rd			(pop_Main),
	      .fifo_data_in		(data_in[WORD_SIZE-1:0]),
	      .full_threshold		(Umbral_MF_alto_interno[PTR_L-1:0]),
	      .empty_threshold		(Umbral_MF_bajo_interno[PTR_L-1:0]),
	      .clk			(clk),
	      .reset_L			(reset));

Pop_Main_and_Valid logica_main_Pop_Push(/**/
					// Outputs
					.pop_Main	(pop_Main),
					.valid_pop_out	(valid_pop_out),
					// Inputs
					.clk		(clk),
					.reset_L	(reset),
					.empy_main_FIFO	(FIFO_empties[4]),
					.pause_vc0	(pause_vc0),
					.pause_vc1	(pause_vc1));

demux demux_main_Vcs(/**/
		     // Outputs
		     .data_out_0	(data_out_0[5:0]),
		     .data_out_1	(data_out_1[5:0]),
		     .push_0		(push_0),
		     .push_1		(push_1),
		     // Inputs
		     .data_in		(fifo_data_out[5:0]),
		     .valid_in		(valid_pop_out),
		     .selector		(fifo_data_out[5]));

fifo #(.MEM_SIZE (MEM_SIZE_VCs)
        )FIFO_VC0
        (/**/
	      // Outputs
	      .fifo_data_out		(data_in_0[5:0]),
	      .error			(FIFO_errors[3]),
	      .almost_empty		(vc0_empty),
	      .almost_full		(pause_vc0),
	    //   .fifo_full		(fifo_full),
	      .fifo_empty		(FIFO_empties[3]),
	      // Inputs
	      .fifo_wr			(push_0),
	      .fifo_rd			(pop_vc0),
	      .fifo_data_in		(data_out_0[5:0]),
	      .full_threshold		(Umbral_VC_alto_interno[PTR_L-1:0]),
	      .empty_threshold		(Umbral_VC_bajo_interno[PTR_L-1:0]),
	      .clk			(clk),
	      .reset_L			(reset));

fifo  #(.MEM_SIZE (MEM_SIZE_VCs)
        )FIFO_VC1
        (/**/
	      // Outputs
	      .fifo_data_out		(data_in_1[5:0]),
	      .error			(FIFO_errors[2]),
	      .almost_empty		(vc1_empty),
	      .almost_full		(pause_vc1),
	    //   .fifo_full		(fifo_full),
	      .fifo_empty		(FIFO_empties[2]),
	      // Inputs
	      .fifo_wr			(push_1),
	      .fifo_rd			(pop_vc1),
	      .fifo_data_in		(data_out_1[5:0]),
	      .full_threshold		(Umbral_VC_alto_interno[PTR_L-1:0]),
	      .empty_threshold		(Umbral_VC_bajo_interno[PTR_L-1:0]),
	      .clk			(clk),
	      .reset_L			(reset));

Empty_and_pause Logica_empty_pause(/**/
				   // Outputs
				   .valid_vc0		(valid_vc0),
				   .valid_vc1		(valid_vc1),
				   .pop_vc0		(pop_vc0),
				   .pop_vc1		(pop_vc1),
				   // Inputs
				   .clk			(clk),
				   .reset_L		(reset),
				   .vc0_empty		(FIFO_empties[3]),
				   .vc1_empty		(FIFO_empties[2]),
				   .pause_d0		(pause_d0),
				   .pause_d1		(pause_d1));

mux MUX(/**/
	// Outputs
	.data_out			(data_out[5:0]),
	// Inputs
	.data_in_0			(data_in_0[5:0]),
	.valid_in0			(valid_vc0),
	.data_in_1			(data_in_1[5:0]),
	.valid_in1			(valid_vc1));

// Logica para el valid del Demux Dest
wire valid_DEST;
assign valid_DEST = valid_vc0 || valid_vc1;

demux demux_DEST(/**/
		 // Outputs
		 .data_out_0		(data_out_dest_0[5:0]),
		 .data_out_1		(data_out_dest_1[5:0]),
		 .push_0		(push_0_dest),
		 .push_1		(push_1_dest),
		 // Inputs
		 .data_in		(data_out[5:0]),
		 .valid_in		(valid_DEST),
		 .selector		(data_out[4]));

// reg flag0;
// reg flag1;

fifo FIFO_D0(/**/
	     // Outputs
	     .fifo_data_out		(data_out0[WORD_SIZE-1:0]),
	     .error			(FIFO_errors[1]),
	     .almost_empty		(almost_empty_d0),
	     .almost_full		(pause_d0),
	    //  .fifo_full			(fifo_full),
	     .fifo_empty		(FIFO_empties[1]),
	     // Inputs
	     .fifo_wr			(push_0_dest),
	     .fifo_rd			(pop_D0), ////////
	     .fifo_data_in		(data_out_dest_0[5:0]),
	     .full_threshold		(Umbral_D_alto_interno[PTR_L-1:0]),
	     .empty_threshold		(Umbral_D_bajo_interno[PTR_L-1:0]),
	     .clk			(clk),
	     .reset_L			(reset));



fifo FIFO_D1(/**/
	     // Outputs
	     .fifo_data_out		(data_out1[WORD_SIZE-1:0]),
	     .error			(FIFO_errors[0]),
	     .almost_empty		(almost_empty_d1),
	     .almost_full		(pause_d1),
	    //  .fifo_full			(fifo_full),
	     .fifo_empty		(FIFO_empties[0]),
	     // Inputs
	     .fifo_wr			(push_1_dest),
	     .fifo_rd			(pop_D1), ////////
	     .fifo_data_in		(data_out_dest_1[5:0]),
	     .full_threshold		(Umbral_D_alto_interno[PTR_L-1:0]),
	     .empty_threshold		(Umbral_D_bajo_interno[PTR_L-1:0]),
	     .clk			(clk),
	     .reset_L			(reset));



// always @(posedge clk) begin
//     flag0 <= push_0_dest;
//     flag1 <= push_1_dest;
// end

endmodule
