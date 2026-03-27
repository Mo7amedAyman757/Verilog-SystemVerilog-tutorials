
module grTObi #(parameter n =4)(
       input [n-1 : 0] gray,
       output [n-1 : 0] binary
    );
    
    assign binary[n-1] = gray[n-1];
    
    generate
     genvar k;
     for(k = n - 2; k >= 0; k = k - 1)
     begin
      
       assign binary[k] = gray[k] ^ binary[k + 1];
     
     end
    endgenerate 
     
 
endmodule