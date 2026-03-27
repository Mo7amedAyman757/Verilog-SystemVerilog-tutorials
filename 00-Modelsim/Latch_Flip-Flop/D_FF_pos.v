module D_FF_pos(
     input D,
     input clk,
     output reg Q,
     output Q_n
);

assign Q_n = ~Q;

always @(posedge clk)
begin
 
  Q <= D;

end
endmodule

