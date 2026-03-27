module Up_counter
    #(parameter BITS = 4)(
      input clk,
      input reset_n,
      output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;    
    end
    
    // next state logic
    always @(Q_reg)
    begin
        Q_next = Q_reg + 1;
    end
    
    // output logic
    assign Q = Q_reg;
    
endmodule
