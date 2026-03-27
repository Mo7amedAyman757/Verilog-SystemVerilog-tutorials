module Circuit_Des(
         input a,b,c,
         input clk,
         output f,g
    );
    
    reg f_next, f_reg, g_next, g_reg;
    
    always @(posedge clk)
    begin
  
     f_reg <= f_next;
  
     g_reg <= g_next;
    
    end
   
   always @(a,b,c,g_reg)
   begin
   
    f_next = a & ~g_reg;
    g_next = b | c;
   
   end
   
   assign f = f_reg;
   assign g = g_reg;
    
endmodule

