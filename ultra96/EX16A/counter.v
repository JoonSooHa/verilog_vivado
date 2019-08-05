module counter(
    input clk,
    input rst,
    input clr,
    input en,
    output reg q,
    output reg cnt_max
); 

    always @(posedge clk)
    begin
        if(rst | clr)
            q <= 27'd0;
        else if(en)
        begin
            if(q == 27'd99_999_999)
                q <= 27'd0;
            else
                q <= q + 1;
        end
    end
    
    always @(*)
    begin
        if(q == 27'd99_999_999)
            cnt_max <= 1'b1;
        else
            cnt_max <= 1'b0;
    end
endmodule
