module moore_011_detector(
    input clk,
    input reset_n,
    input x,
    output [1 : 0] Q,
    output y
    );
    
    reg [1 : 0] state_reg, state_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= 'b0;
        else 
            state_reg <= state_next;    
    end
    
    //next state
    always @(*)
    begin
        state_next[0] = ~x | (~state_reg[0] & state_reg[1]);
        state_next[1] =  x & ( state_reg[0] ^ state_reg[1]);
    end
    
    //output logic
    assign y = state_reg[0] & state_reg[1];
    assign Q = state_reg;
    
endmodule
