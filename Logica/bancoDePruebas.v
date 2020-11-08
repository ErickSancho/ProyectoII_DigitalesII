`timescale 	1ns / 100ps

`include "demux.v"
`include "mux.v"
`include "Empty_and_pause.v"
`include "Pop_Main_and_Valid.v"
`include "demux_Sint.v"
`include "mux_Sint.v"
`include "Empty_and_pause_Sint.v"
`include "Pop_Main_and_Valid_Sint.v"
`include "cmos_cells.v"
`include "probador.v"

module BancoPruebas;

    wire valid_pop_out, push_0, push_1, valid_vc0, valid_vc1, pop_vc0, pop_vc1, vc0_empty, vc1_empty, pause_d0, pause_d1, pop_Main, empy_main_FIFO, pause_vc0, pause_vc1, push_0_Sint, push_1_Sint, valid_pop_out_Sint, valid_vc0_Sint, valid_vc1_Sint, pop_vc0_Sint, pop_vc1_Sint;
    wire [5:0] data_in0, data_in1, data_out_demux0, data_out_demux1, data_out_mux, data_out_demux0_Sint, data_out_demux1_Sint, data_out_mux_Sint;

    	demux demux_( /*AUTOINST*/
		     // Outputs
		     .data_out_0	(data_out_demux0[5:0]),
		     .data_out_1	(data_out_demux1[5:0]),
		     .push_0		(push_0),
		     .push_1		(push_1),
		     // Inputs
		     .data_in		(data_in0[5:0]),
		     .valid_in		(valid_pop_out),
		     .selector		(data_in0[5]));

	mux mux_( /*AUTOINST*/
		 // Outputs
		 .data_out		(data_out_mux[5:0]),
		 // Inputs
		 .data_in_0		(data_in0[5:0]),
		 .valid_in0		(valid_vc0),
		 .data_in_1		(data_in1[5:0]),
		 .valid_in1		(valid_vc1));

	Empty_and_pause EP_( /*AUTOINST*/
			    // Outputs
			    .valid_vc0		(valid_vc0),
			    .valid_vc1		(valid_vc1),
			    .pop_vc0		(pop_vc0),
			    .pop_vc1		(pop_vc1),
			    // Inputs
			    .clk		(clk),
			    .reset_L		(reset_L),
			    .vc0_empty		(vc0_empty),
			    .vc1_empty		(vc1_empty),
			    .pause_d0		(pause_d0),
			    .pause_d1		(pause_d1));
	
	
	Pop_Main_and_Valid PV_( /*AUTOINST*/
			       // Outputs
			       .pop_Main	(pop_Main),
			       .valid_pop_out	(valid_pop_out),
			       // Inputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .empy_main_FIFO	(empy_main_FIFO),
			       .pause_vc0	(pause_vc0),
			       .pause_vc1	(pause_vc1));
		
    	demux_Sint sint1_( /*AUTOINST*/
		     // Outputs
		     .data_out_0	(data_out_demux0_Sint[5:0]),
		     .data_out_1	(data_out_demux1_Sint[5:0]),
		     .push_0		(push_0_Sint),
		     .push_1		(push_1_Sint),
		     // Inputs
		     .data_in		(data_in0[5:0]),
		     .valid_in		(valid_pop_out_Sint),
		     .selector		(data_in0[5]));

	mux_Sint sint2_( /*AUTOINST*/
		 // Outputs
		 .data_out		(data_out_mux_Sint[5:0]),
		 // Inputs
		 .data_in_0		(data_in0[5:0]),
		 .valid_in0		(valid_vc0_Sint),
		 .data_in_1		(data_in1[5:0]),
		 .valid_in1		(valid_vc1_Sint));

	Empty_and_pause_Sint sint3_( /*AUTOINST*/
			    // Outputs
			    .valid_vc0		(valid_vc0_Sint),
			    .valid_vc1		(valid_vc1_Sint),
			    .pop_vc0		(pop_vc0_Sint),
			    .pop_vc1		(pop_vc1_Sint),
			    // Inputs
			    .clk		(clk),
			    .reset_L		(reset_L),
			    .vc0_empty		(vc0_empty),
			    .vc1_empty		(vc1_empty),
			    .pause_d0		(pause_d0),
			    .pause_d1		(pause_d1));
	
	
	Pop_Main_and_Valid_Sint sint4_( /*AUTOINST*/
			       // Outputs
			       .pop_Main	(pop_Main_Sint),
			       .valid_pop_out	(valid_pop_out_Sint),
			       // Inputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .empy_main_FIFO	(empy_main_FIFO),
			       .pause_vc0	(pause_vc0),
			       .pause_vc1	(pause_vc1));


    	probador probador_ (/*AUTOINST*/
			    // Outputs
			    .vc0_empty		(vc0_empty),
			    .vc1_empty		(vc1_empty),
			    .pause_d0		(pause_d0),
			    .pause_d1		(pause_d1),
			    .empy_main_FIFO	(empy_main_FIFO),
			    .pause_vc0		(pause_vc0),
			    .pause_vc1		(pause_vc1),
			    .reset_L		(reset_L),
			    .clk		(clk),
			    .data_in0		(data_in0[5:0]),
			    .data_in1		(data_in1[5:0]),
			    // Inputs
			    .data_out_demux0	(data_out_demux0[5:0]),
			    .data_out_demux1	(data_out_demux1[5:0]),
			    .push_0		(push_0),
			    .push_1		(push_1),
			    .data_out_mux	(data_out_mux[5:0]),
			    .valid_vc0		(valid_vc0),
			    .valid_vc1		(valid_vc1),
			    .pop_vc0		(pop_vc0),
			    .pop_vc1		(pop_vc1),
			    .pop_Main		(pop_Main),
			    .valid_pop_out	(valid_pop_out),
			    .data_out_demux0_Sint	(data_out_demux0_Sint[5:0]),
			    .data_out_demux1_Sint	(data_out_demux1_Sint[5:0]),
			    .push_0_Sint		(push_0_Sint),
			    .push_1_Sint		(push_1_Sint),
			    .data_out_mux_Sint		(data_out_mux_Sint[5:0]),
			    .valid_vc0_Sint		(valid_vc0_Sint),
			    .valid_vc1_Sint		(valid_vc1_Sint),
			    .pop_vc0_Sint		(pop_vc0_Sint),
			    .pop_vc1_Sint		(pop_vc1_Sint),
			    .pop_Main_Sint		(pop_Main_Sint),
			    .valid_pop_out_Sint	(valid_pop_out_Sint));

endmodule
