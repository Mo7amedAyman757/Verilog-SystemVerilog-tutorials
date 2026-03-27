module univ_shift_reg
    #(parameter N = 4)(
       input clk,
       input reset_n,
       input MSB_n,LSB_n,
       input [N - 1: 0] I,
       input [1 : 0] S,
       output [N - 1: 0] Q
    );
    
    reg [N - 1 : 0] Q_reg, Q_next;
    
    // process state
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;     
    end
    
    // next state logic
    always @(*)
    begin
        Q_next = Q_reg;
        case(S)
            2'b00: Q_next = Q_reg;
            2'b01: Q_next = {MSB_n,Q_reg[N-1:1]};
            2'b10: Q_next = {Q_reg[N-2:0],LSB_n};
            2'b11: Q_next = I;
            default: Q_next = Q_reg;
        endcase
    end
    
    // output logic
    assign Q = Q_reg;
    
endmodule
