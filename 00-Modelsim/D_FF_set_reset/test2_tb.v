module test2_tb(

    );
    // 1- Declare local reg and wire identifiers
     reg clk , D, reset_n , set_n;
     wire Q;
     
   // 2- Instatiate the module under test
     D_FF_set_reset test(
        .clk(clk),
        .D(D),
        .set_n(set_n),
        .reset_n(reset_n),
        .Q(Q)
     );
     
   // 3- General stimuli, using always and initial
     localparam T = 20; // clock period
     
     always
     begin
     
      clk = 1'b0;
      #(T / 2);
      
      clk = 1'b1;
      #(T / 2);
     
     end
     
     initial 
     begin
     
     D = 1'b1;
     reset_n = 1'b1;
     set_n = 1'b1;
     
     #10 D = 1'b0;
     #2  D = 1'b1;
     #3  D = 1'b0;
     #2  D = 1'b1;
   
     
     #5 reset_n = 1'b0;
     #3 reset_n = 1'b1;
     
     #30 D = 1'b0;
     
     #24 set_n = 1'b0;
     
     #4 set_n =1'b1;
     
     #51 set_n =1'b0;
     
     #5 set_n = 1'b1;
     
     repeat(2)@(negedge clk);
     D = 1'b1;
     
     #40 $stop;
     
     
     end
     
endmodule