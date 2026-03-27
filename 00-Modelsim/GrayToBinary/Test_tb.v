module test_tb(

    );
    
      // 1- declare local reg and wire identifiers
    parameter n = 4;
    reg [n - 1 : 0] gray;
    wire [n - 1 : 0] binary;
    
    // 2- Instantiate the module under test
    grTObi #(.n(4)) test(
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
     
     gray = 4'd3;#10
     gray = 4'd5;#10
     gray = 4'd4;#10
     gray = 4'd7;
    
    end
    
endmodule
