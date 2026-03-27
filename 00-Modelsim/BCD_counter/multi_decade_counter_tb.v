
module multi_decade_counter_tb(

    );
     // 1- Declare local reg and wire identifiers
        
        reg clk, reset_n, enable;
        wire done;
        wire [3 : 0] ones, tens, hundreds;
        
    // 2- Instatiate the module under test
        multi_decade_counter B1(
            .clk(clk),
            .reset_n(reset_n),
            .enable(enable),
            .done(done),
            .ones(ones),
            .tens(tens),
            .hundreds(hundreds)
        );    
    // 3- General stimuli using initial and always
       
        localparam T = 4;
        
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
            #2
            reset_n = 1'b1;
            #2
            enable = 1'b1;
           
           repeat(115) @(negedge clk);
           #20 $stop;
        end       
endmodule