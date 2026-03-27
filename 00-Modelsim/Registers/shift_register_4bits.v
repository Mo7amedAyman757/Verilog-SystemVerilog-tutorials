module shift_register_4bits
    #(parameter N = 4)(
      input clk,
      input IN,
      output OUT,
      output [N - 1: 0] Q // if we care about content
    );
    
    reg [N - 1: 0] Q_reg, Q_next;
    always @(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // next state logic
    always @(IN,Q_reg)
    begin
        Q_next = {IN,Q_reg[N - 1 : 1]};  // shift right
        //Q_next = {Q_reg[N -2 : 0],IN}; // shift left
    end
    
    // output logic
    assign OUT = Q_reg[0];
    assign Q = Q_reg;
endmodule

