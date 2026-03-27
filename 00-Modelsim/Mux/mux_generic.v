module Mux_generic
    #(parameter n = 16)(
        input [n-1 : 0] x,
        input [$clog2(n) - 1 : 0] s,
        output reg y
    );
    
    integer k;
    
    always @(x, s)
    begin
      y = 1'bx;    //default unkown
      for(k = 0; k < n; k = k + 1)
        if(s == k)
           y = x[k];
    end
    
endmodule
