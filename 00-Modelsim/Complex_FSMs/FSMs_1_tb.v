module FSMs_1_tb(

    );
    // 1-declare local reg and wire identifiers
        reg clk, reset_n, x;
        wire y;
    
   // 2-Instatiate the module under test
      FSMs_1 uu1(
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .y(y)
      );      
      
   // 3-General stimuli, using always and initial
        localparam T = 10;
        always
        begin
            clk = 1'b0;
            #(T / 2);
            clk = 1'b1;
            #(T / 2);
        end  
        
        initial
    begin
        reset_n = 1'b0;
        x = 1'b0;
        @(negedge clk);
        reset_n = 1'b1;
        
            x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #2  x = 1'b0;
        #T  x = 1'b0;
        #T  x = 1'b1;
        #T  x = 1'b1;
        #T  x = 1'b0;        
        #T  $finish;
    end
endmodule
