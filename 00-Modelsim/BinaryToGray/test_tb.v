module test_tb(

    );
    
    // 1- declare local reg and wire identifiers
    parameter n = 4;
    reg [n - 1 : 0] binary;
    wire [n - 1 : 0] gray;
    
    // 2- Instantiate the module under test
    BitoGr #(.n(4)) test(
      .binary(binary),
      .gray(gray)
    );
    
    // 3- specify stopwatch to stop simulation
    initial 
    begin
     #40 $finish;
    end 
    
    // 4- Generate stimuli using initial and always
    initial
    begin
     
     binary = 4'd3;#10
     binary = 4'd5;#10
     binary = 4'd4;#10
     binary = 4'd7;
    
    end
    
endmodule
