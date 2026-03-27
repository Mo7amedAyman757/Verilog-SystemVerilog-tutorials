module up_down_counter
    #(parameter BITS = 4)(
      input clk,
      input reset_n,
      enable,
      input up,
      output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_next, Q_reg;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;  
        else    
            Q_reg <= Q_reg;       
    end
    
    // next state logic
    always @(up, Q_reg)
    begin
        Q_next = Q_reg;
        if(up)
            Q_next = Q_reg + 1;
        else 
            Q_next = Q_reg - 1;    
    end
    
    // output logic
   assign Q = Q_reg;
endmodule
