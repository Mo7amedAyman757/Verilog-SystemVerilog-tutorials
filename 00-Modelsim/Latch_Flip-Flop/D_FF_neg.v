module D_FF_neg(
     input D,
     input clk,
     output reg Q,
     output Q_n
);

assign Q_n = ~Q;

always @(negedge clk)
begin
 
  Q <= D;

end
endmodule

