module top_ex10(
    input       clk,
    input       clr,
    output[3:0] q   
);
    wire clk_out1;

    clk_wiz_0 u_clkgen
    (
        .clk_out1(clk_out1),     
        .clk_in1 (clk )
    );

    counter_ex5 u_counter_ex5(
        .clk(clk_out1),
        .clr(clr     ),
        .q  (q       )
    );
endmodule
