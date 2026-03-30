// Code your testbench here
// or browse Examples
module test();
  int asc[4] = '{1,2,3,4};
  int dsc[3] = '{3{8'h33}};
  
  // packed array 
  // 4 contiguous locations each is 8 bits
  bit [3:0] [7:0] up_array = 32'hcafa_dada;
  
  // unpacked array
  // creates an unpacked array of 3 elements, where each element is a packed array of 24 bits   // organized as:

  //[1:0] – two “words” (each a 12‑bit group)

  //[2:0] – three “sub‑words” inside each word (each a 4‑bit group)

  //[3:0] – four bits inside each sub‑word
  
  bit [1:0] [2:0] [3:0] barray [3] =  '{
    '{ '{4'b0001, 4'b0010, 4'b0011}, '{4'b0100, 4'b0101, 4'b0110} },  // element 0
    '{ '{4'b0111, 4'b1000, 4'b1001}, '{4'b1010, 4'b1011, 4'b1100} },  // element 1
    '{ '{4'b1101, 4'b1110, 4'b1111}, '{4'b0000, 4'b0001, 4'b0010} }   // element 2
   	};
  
  initial begin

    foreach(asc[i])
      $display("asc[%d] = %d", i, asc[i]);
    
    foreach(dsc[j]) 
      $display("dsc[%d] = %d", j, dsc[j]);
    
    $displayh(up_array,,up_array[3],,up_array[3][7]);
    
    // assign full packed array at index 0
    $displayh(barray[0]);       //'{ 4'b0001, 4'b0010, 4'b0011 };          
    
    // assign first packed word of element 1
    $displayh(barray[1][0]);    //'{ 4'b1010, 4'b1011, 4'b1100 }; 
    
    // assign a single 4‑bit sub‑word
    $displayh(barray[2][1][2]); //4'b1111;       
    
    // assign a single 1‑bit
    $displayh(barray[2][1][2][1]); //4'b0; 
  end
  
endmodule
