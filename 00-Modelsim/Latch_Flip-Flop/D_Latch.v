
module D_Latch (
     input D,
     input clk,
     output reg Q,
     output Q_n
);

assign Q_n  = ~Q;

always @(D,clk)
begin
   if(clk)
    Q <= D;
   else
    Q = Q; 

end
endmodule