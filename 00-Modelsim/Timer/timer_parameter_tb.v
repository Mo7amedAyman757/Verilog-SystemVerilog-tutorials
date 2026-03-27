module timer_parameter_tb(

    );
    // 1- Declare local reg and wire identifiers
        localparam FINAL_VALUE = 49_999;
        localparam BITS = $clog2(FINAL_VALUE);
        reg clk, reset_n, enable;
        wire done;
        
    // 2- Instatiate the module under test
        timer_parameter #(.FINAL_VALUE(FINAL_VALUE)) B1(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .done(done)
        );    
    // 3- General stimuli using initial and always
   
        localparam T = 10;
        
        always
        begin
            clk =1'b0;
            #(T /2);
            clk =1'b1;
            #(T /2);
        end 
        
        initial 
        begin
            reset_n = 1'b0;
            enable = 1'b1;
            #2 reset_n = 1'b1;
            
            #500_0000_00 $stop;
        end       
endmodule
