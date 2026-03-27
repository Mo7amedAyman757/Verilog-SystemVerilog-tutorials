
module LFSR_tb(

    );
    
    // 1-Declare local reg and wire identifiers
        localparam N = 3;
        reg clk, reset_n;
        wire [1 : N] Q;
   
   // 2-Instatiate the module under test
        LFSR #(.N(N)) M1(
            .clk(clk),
            .reset_n(reset_n),
            .Q(Q)
        );     
    
    // 3- General stimuli using always and initials
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
            #2 reset_n = 1'b1;
            
            repeat(2) @(negedge clk);
            wait(Q == 1);
           
            #20 $stop;
        end
        

endmodule