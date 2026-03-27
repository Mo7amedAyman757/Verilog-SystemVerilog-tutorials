module test_tb;
    
    // 1- Declare local reg and wire identifiers
       reg clk, a,b,c;
       wire f,g;
       
   // 2- Instatiate the module under test
   Circuit_Des test(
     .clk(clk),
     .a(a),
     .b(b),
     .c(c),
     .f(f),
     .g(g)
   );    
   
   // 3- general stimuli, using always and initial
   localparam T = 40;
   always
   begin
   
     clk = 1'b0;
     #(T /2);
     clk = 1'b1;
     #(T /2);

   end
   
   initial 
   begin
     
     a = 1'b0;
     b = 1'b1;
     c = 1'b0;
     
    @(posedge clk);
     
     a = 1'b0;
     b = 1'b0;
     c = 1'b0;
     
    @(posedge clk);
     
     a = 1'b1;
     b = 1'b1;
     c = 1'b1;
   
    @(posedge clk);
     
     a = 1'b1;
     b = 1'b0;
     c = 1'b0;
     
     
    repeat(2)@(posedge clk) $stop;
   end
endmodule