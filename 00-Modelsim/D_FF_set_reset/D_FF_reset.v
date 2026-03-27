module D_FF_reset (
    input D,
    input clk,
    input reset_n, // Asynchronous
    input clear_n,  // synchronous
    output Q
);

reg Q_reg, Q_next;

always @(negedge clk, negedge reset_n)
begin

  if(!reset_n)
    Q_reg <= 1'b0;
  else
    Q_reg <= Q_next;  
end

always @(*)
begin
  Q_next = Q_reg;
  if(!clear_n)
     Q_next = 1'b0;
  else
     Q_next = D;   
end

assign Q = Q_reg;

endmodule
