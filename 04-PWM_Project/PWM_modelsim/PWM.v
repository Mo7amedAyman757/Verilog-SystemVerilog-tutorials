module PWM
    #(parameter R = 8, TIMER_BITS = 16)(
        input clk,
        input reset_n,
        input [R : 0] duty, // Control the Duty Cylce
        input [TIMER_BITS-1 : 0] FINAL_VALUE, // Control the switching frequency
        output PWM_out
    );
    
    wire tick;
    
    // up-counter
    reg [R-1 : 0] Q_reg , Q_next;
    
    reg D_reg, D_next;
     
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
        begin
            Q_reg <= 'b0;
            D_reg <= 'b0;
        end    
        else if(tick)
        begin
            Q_reg <= Q_next;    
            D_reg <= D_next;
        end    
        else
        begin
            Q_reg <= Q_reg;    
            D_reg <= D_reg;
        end
    end
    
    //next state
    always @(*)
    begin
        Q_next = Q_reg + 1;
        D_next = Q_reg < duty;
    end
    
    // output logic
    assign PWM_out = D_reg; 
     
    // prescaler
    Timer #(.TIMER_BITS(TIMER_BITS)) T1(
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .FINAL_VALUE(FINAL_VALUE),
        .done(tick)
    );
    
endmodule
