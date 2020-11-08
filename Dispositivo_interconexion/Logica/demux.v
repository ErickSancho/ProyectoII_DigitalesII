module demux (
    input [5:0] data_in,
    input valid_in,
    input selector,
    output reg [5:0] data_out_0,
    output reg [5:0] data_out_1,
    output reg push_0,
    output reg push_1);

    
    always @ (*) begin
            data_out_0 = 'b0;
            push_0 = 'b0;
            data_out_1 = 'b0;
            push_1 = 'b0;
                    
            if (selector == 0) begin 
                if (valid_in == 1) begin
                    data_out_0 = data_in;
                    push_0 = valid_in;
                end
            end

            else begin 
                if (valid_in == 1) begin
                    data_out_1 = data_in;
                    push_1  = valid_in;
                end
            end
    end 

endmodule
