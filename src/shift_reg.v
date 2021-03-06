module shift_reg(clk,din,dout);
 
    input clk,din;
    output dout;
    wire [14:0] inter;
	
    genvar i;	
    generate 
    for(i=0;i<16;i=i+1) begin : genfor
        if(i==0)                flipflop u0 (clk,din,inter[i]);
        if(i>0 && i<15)     flipflop ux (clk,inter[i-1],inter[i]);
        if(i==15)              flipflop u15 (clk,inter[i-1],dout);
    end
    endgenerate
 
endmodule
