module counter(
    input clk,
    input rst,
    input clr,
    input en,
    output reg[26:0] cnt,
    output[7:0] q,
    output reg cnt_max
); 

    always @(posedge clk)
    begin
        if(rst | clr)
            cnt <= 27'd0;
        else if(en)
        begin
            if(cnt == 27'd99_999_999)
                cnt <= 27'd0;
            else
                cnt <= cnt + 1;
        end
    end
    
    assign q = cnt[26:19];
    
    always @(*)
    begin
        if(cnt == 27'd99_999_999)
            cnt_max <= 1'b1;
        else
            cnt_max <= 1'b0;
    end

endmodule
