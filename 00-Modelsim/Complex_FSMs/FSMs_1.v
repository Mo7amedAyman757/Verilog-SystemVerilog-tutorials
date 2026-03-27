module FSMs_1(
    input clk,
    input reset_n,
    input x,
    output y
    );
    
    // states
    localparam s0 = 0,
               s1 = 1,
               s2 = 2,
               s3 = 3,
               s4 = 4,
               s5 = 5;
    
    reg [2 : 0] state_reg, state_next;
    
    //state register
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            state_reg <= s0;
        else
            state_reg <= state_next;    
    end           
    
    // next state logic
    always @(*)
    begin
        case(state_reg)
            s0: if(x)
                    state_next = s4;
                 else
                    state_next = s1;
            s1: if(x)
                    state_next = s2;
                else 
                    state_next = s1;
            s2: if(x)
                    state_next = s4;
                else
                    state_next = s3;
            s3: if(x)
                    state_next = s2;
                else
                    state_next = s5;
            s4: if(x)
                    state_next = s4;
                else
                    state_next = s3;
            s5: if(x)
                    state_next = s2;
                else
                    state_next = s1;
            default: state_next = state_reg;                                                                      
        endcase
    end
    
    //output logic
    assign y = ((state_reg == s5) & x) | ((state_reg == s2) & ~x);
endmodule

