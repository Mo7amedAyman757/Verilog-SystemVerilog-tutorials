module Circuit_Des(
     input a,b,c,
     input clk,
     output f,g
);

reg F_next, F_reg, g_next, g_reg;

always @(posedge clk)
begin 

    F_reg <= F_next;
    g_reg <= g_next;

end

always @(*)
begin

   F_next = a & ~g_reg;
   g_next = b | c;

end

assign f = F_reg;
assign g = g_reg;

endmodule
