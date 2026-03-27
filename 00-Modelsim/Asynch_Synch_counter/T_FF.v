module T_FF(
      input T,
      input clk,
      input reset_n,
      output Q
    );
    
    reg Q_reg;
    wire Q_next;
    
    localparam C2Q_DELAY = 2;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 1'b0;
        else
           #C2Q_DELAY Q_reg <= Q_next;    
    end
    
    //next logic state
    assign Q_next = T ? ~Q_reg: Q_reg;
    
    // output logic
    assign Q = Q_reg;
    
endmodule
