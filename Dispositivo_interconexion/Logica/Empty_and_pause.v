module Empty_and_pause (
    input clk,
    input reset_L,
    input vc0_empty,
    input vc1_empty,
    input pause_d0,
    input pause_d1,
    output reg valid_vc0,
    output reg valid_vc1,
    output reg pop_vc0,
    output reg pop_vc1);
    
        
    always @ (*) begin
    	pop_vc0 = 0;
    	pop_vc1 = 0;
	if (!(pause_d0 || pause_d1)) 
		if (!vc0_empty) begin
			pop_vc0 = 1;
		end
		if (!vc1_empty) begin
			pop_vc1 = 1;
		end
    end

    always @ (posedge clk) begin
    	if (reset_L == 0) begin
    		valid_vc0 <= 0;
    		valid_vc1 <= 0;
    	end
    	else begin
    		valid_vc0 <= pop_vc0;
    		valid_vc1 <= pop_vc1;
    	end
    end 

endmodule
