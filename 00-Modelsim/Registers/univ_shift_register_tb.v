module univ_shift_register_tb(

    );
    
    // 1- Declare local reg and wire identifiers
        localparam N = 4;
        reg clk, reset_n, MSB_n, LSB_n;
        reg [1 : 0] S;
        reg [N -1 : 0] I;      
        wire [N - 1 : 0] Q;
        
    // 2- Instatiate the module under test   
    univ_shift_reg #(.N(N)) RS(
        .clk(clk),
        .reset_n(reset_n),
        .MSB_n(MSB_n),
        .LSB_n(LSB_n),
        .S(S),
        .I(I),
        .Q(Q)
    ); 
    
    // 3- General stimuli, using always and initial
    initial 
    begin
        #140 $stop;
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
    
    // initial values
    reset_n = 1'b0;
    MSB_n = 1'b0;
    LSB_n = 1'b0;
    I = 4'b0000;
    
    #2 reset_n = 1'b1;  
    
    @(posedge clk);
    S = 2'b01;
    MSB_n = 1;
    
    @(posedge clk);
    S = 2'b10;
    LSB_n = 1;
    
    @(posedge clk);
    S = 2'b11;
    I = 4'b0110;
    
    @(posedge clk);
    S = 2'b00;
    end
    
endmodule
