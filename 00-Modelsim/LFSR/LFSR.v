
module LFSR
    #(parameter N = 3)(
        input clk,
        input reset_n,
        output [1 : N] Q
    );
    
    reg [1 : N] Q_reg, Q_next;
    wire X;
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b1; //LFSR shouldn't start with 0 
        else
            Q_reg <= Q_next;    
    end
    
    always @(X,Q_reg)
    begin
        Q_next = {X, Q_reg[1:N - 1]};
    end
    
    assign X = Q[2] ^ Q[3];
    
    assign Q = Q_reg;
    
endmodule