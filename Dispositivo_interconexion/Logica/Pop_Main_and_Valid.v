module Pop_Main_and_Valid (
    input clk,
    input reset_L,
    input empy_main_FIFO,
    input pause_vc0,
    input pause_vc1,
    output reg pop_Main,
    output reg valid_pop_out);

    
    always @ (*) begin
    	pop_Main = 0;
	if (!(pause_vc0 || pause_vc1) && !empy_main_FIFO) 
		pop_Main = 1; 
    end
    
    always @ (posedge clk) begin
    	if (reset_L == 0)
    		valid_pop_out <= 0;
    	else
    		valid_pop_out <= pop_Main;
    end 

endmodule
