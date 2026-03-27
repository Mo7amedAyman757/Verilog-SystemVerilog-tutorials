module up_down_counter_tb(

    );
     // 1- Declare local wire and reg identifiers
   localparam BITS = 4; 
   reg clk, reset_n,up, enable;
   wire [3 : 0] Q;
 
 // 2- Instatiate the module block under test
 up_down_counter #(.BITS(BITS)) UC(
     .clk(clk),
     .up(up),
     .enable(enable),
     .reset_n(reset_n),
     .Q(Q)
 );
 
 // 3- General stimuli, using always and intital
     
    initial
    begin
    
     #200 $stop;
    
    end
 
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
    up = 1'b1;
    enable = 1'b0;
    
    @(posedge clk) enable = 1'b1;
    
    wait(Q == 15);
    up = 1'b0;
    
    end
    
endmodule