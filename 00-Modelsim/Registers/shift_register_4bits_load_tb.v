module shift_register_4bits_load_tb(

    );
     // 1- Declare local reg and wire identifiers
        localparam N = 4;
        reg clk;
        reg SI;
        reg [N-1:0] I;
        reg reset_n;
        reg load;
        wire SO;      
        wire [N - 1 : 0] Q;
        
    // 2- Instatiate the module under test   
    shift_register_4bits_load #(.N(N)) RS(
        .clk(clk),
        .reset_n(reset_n),
        .SI(SI),
        .I(I),
        .load(load),
        .SO(SO),
        .Q(Q)
    ); 
    
    // 3- General stimuli, using always and initial
    initial 
    begin
        #300 $stop;
    end
    
    localparam T = 20; //clock period
    
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial 
    begin
    
     // Initialize signals
        reset_n = 0;
        load    = 0;
        SI      = 0;
        I       = 0;
        
        // Apply reset
        #5 reset_n = 1;  
        
        // Load parallel data into register
        @(posedge clk);
        load = 1'b1;
        I    = 4'b1010;
        
        @(posedge clk);
        load = 1'b0;   // disable load, start shifting
        
        // Shift serially with SI = 1
        SI = 1;
        I = 4'b0101;
        repeat(4) @(posedge clk);
        
        // Change serial input to 0
        load = 1'b1;
        repeat(4) @(posedge clk);
        
      
     
    end  
endmodule

