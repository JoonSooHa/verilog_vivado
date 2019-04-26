module mult_async(
    input clka,
    input clkb,

    input[3:0] i_a, i_b
    output[7:0] o_result
);

    reg[3:0] a_buf_by_clka;
    reg[3:0] synchronizer;

    reg[3:0] a_buf, b_buf;
    reg[7:0] result_buf;

    always @(posedge clka)
    begin
        a_buf_by_clka <= i_a;
    end

    // sychronizer register
    always @(posedge clkb)
    begin
        synchronizer <= a_buf_by_clka;
    end

    always @(posedge clkb)
    begin
       a_buf <= synchronizer;
       b_buf <= i_b;

       result_buf <= a_buf * b_buf;
    end
    
    assign o_result = result_buf;
endmodule
