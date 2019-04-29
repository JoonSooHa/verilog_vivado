module counter(
    input clk,
    input rst,
    input clr,
    input en,
    output reg[31:0] cnt,
    output[7:0] q,
    output reg cnt_max
); 

    always @(posedge clk)
    begin
        if(rst | clr)
            cnt <= 32'h00000000;
        else if(en)
            cnt <= cnt + 1;
    end
    
    assign q = cnt[31:24];
    
    always @(*)
    begin
        if(cnt == 32'hffff_ffff)
            cnt_max <= 1'b1;
        else
            cnt_max <= 1'b0;
    end

endmodule
