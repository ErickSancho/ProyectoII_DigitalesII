module probador( 
	input [5:0]		data_out_demux0,
	input [5:0]		data_out_demux1,
	input 			push_0,
	input 			push_1,
	input [5:0]		data_out_mux,
	input 			valid_vc0,
	input 			valid_vc1,
	input 			pop_vc0,
	input 			pop_vc1,
	input 			pop_Main,
	input 			valid_pop_out,
	input [5:0]		data_out_demux0_Sint,
	input [5:0]		data_out_demux1_Sint,
	input 			push_0_Sint,
	input 			push_1_Sint,
	input [5:0]		data_out_mux_Sint,
	input 			valid_vc0_Sint,
	input 			valid_vc1_Sint,
	input 			pop_vc0_Sint,
	input 			pop_vc1_Sint,
	input 			pop_Main_Sint,
	input 			valid_pop_out_Sint,
	output reg 		vc0_empty,
	output reg 		vc1_empty,
	output reg 		pause_d0,
	output reg 		pause_d1,
	output reg 		empy_main_FIFO,
	output reg 		pause_vc0,
	output reg 		pause_vc1,
	output reg 		reset_L,
	output reg 		clk,
	output reg [5:0] 	data_in0,
	output reg [5:0] 	data_in1);


	initial begin
		$dumpfile("parte2.vcd");	
		$dumpvars;			
		$display ("\t\t\tclk,\tclk_PS,\t\treset_L,\tvalid_in_PS,\tdata_in_PS,\tdata_out_PS,\tdata_out_PS_Sint");
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t\t%h\t\t%b\t\t%b", clk, reset_L);
		{data_in0} = 6'b101010;
		{data_in1} = 6'b010101;

		repeat (6) begin		
        		
        		@(posedge clk);	
			
			{data_in0} <= {data_in0} + 2;
			{data_in1} <= {data_in1} + 2;
         
		end
		@(posedge clk);	
			{data_in0} <= 6'b101010;
			{data_in1} <= 6'b010101;
		repeat (6) begin
		
        		@(posedge clk);	
			
			{data_in0} <= {data_in0} + 6'b110101;
			{data_in1} <= {data_in1} + 6'b111010;
         
		end
		@(posedge clk);	
		{data_in0} <= 6'b0;
		{data_in1} <= 6'b0;		
        	$finish;		
		
	end
	
	
	// Reloj
	initial	clk 	<= 1;		
	always		#32 clk <= ~clk;
			
	//Reset
	initial begin	
	reset_L <= 0;
	#64 @(posedge clk);
	reset_L <= 1;
	end
	
	//vc0_empty
	initial begin	
	vc0_empty <= 0;
	#192 @(posedge clk);
	vc0_empty <= 1;
	end

	//vc1_empty
	initial begin	
	vc1_empty <= 0;
	#224 @(posedge clk);
	vc1_empty <= 1;
	end
	
	//pause_d0
	initial begin	
	pause_d0 <= 0;
	#192 @(posedge clk);
	pause_d0 <= 1;
	end

	//pause_d1
	initial begin	
	pause_d1 <= 0;
	#224 @(posedge clk);
	pause_d1 <= 1;
	end

	//pause_vc0
	initial begin	
	pause_vc0 <= 0;
	#192 @(posedge clk);
	pause_vc0 <= ~pause_vc0;
	#192 @(posedge clk);
	pause_vc0 <= ~pause_vc0;
	end

	//pause_vc1
	initial begin	
	pause_vc1 <= 0;
	#224 @(posedge clk);
	pause_vc1 <= ~pause_vc1;
	#224 @(posedge clk);
	pause_vc1 <= ~pause_vc1;
	end

	//empy_main_FIFO
	initial begin	
	empy_main_FIFO <= 0;
	#128 @(posedge clk);
	empy_main_FIFO <= ~empy_main_FIFO;
	#128 @(posedge clk);
	empy_main_FIFO <= ~empy_main_FIFO;
	end


endmodule
