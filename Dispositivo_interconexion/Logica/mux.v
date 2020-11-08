module mux (
    input [5:0] data_in_0,
    input valid_in0,
    input [5:0] data_in_1,
    input valid_in1,
    output reg [5:0] data_out);


    always @(*) begin
    	data_out = 0;
        if (valid_in0 == 1) begin
            data_out = data_in_0;
        end
        else begin
		if (valid_in1 == 1) begin
		    data_out = data_in_1;
		end
	end
    end

endmodule
