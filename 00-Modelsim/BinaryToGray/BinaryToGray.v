module BitoGr #(parameter n = 4)(
      input [n - 1 : 0] binary,
      output [n - 1 : 0] gray
    );
    
    assign gray[n - 1] = binary[n - 1];
    
    generate
     genvar k;
     for(k = n - 2; k >= 0; k =k - 1)
     begin
      assign gray[k] = binary[k] ^ binary[k + 1];
     end
    endgenerate
    
endmodule
