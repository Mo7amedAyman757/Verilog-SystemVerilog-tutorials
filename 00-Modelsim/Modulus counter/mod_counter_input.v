module mod_counter_input
    #(parameter BITS = 4)(
        input clk,
        input reset_n,
        input enable,
        input [BITS - 1: 0] Final_Val,
        output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
    wire done;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;        
    end
    
    assign done = Q_reg == Final_Val;
    
    always @(*)
    begin
        Q_next = done ? 4'b0: Q_reg + 1;
    end
    
    assign Q = Q_reg;
endmodule
