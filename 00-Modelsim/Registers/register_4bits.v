module register_4bits
    #(parameter N = 4)(
        input clk,
        input [N - 1 : 0] I,
        output [N - 1 : 0] Q
    );
    
    reg [N - 1 : 0] Q_next, Q_reg;
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // next state logic
    always @(I)
    begin
        Q_next = I;
    end
    
    // output logic
    assign Q = Q_reg;
    
    
endmodule

