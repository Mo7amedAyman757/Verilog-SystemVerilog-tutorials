module full_adder(
      input x,y,cin,
      output s, cout
    );
    
    wire c1,s1,c2;
    
    half_adder F0(
      .x(x),
      .y(y),
      .c(c1),
      .s(s1)
    );
    
     half_adder F1(
      .x(cin),
      .y(s1),
      .c(c2),
      .s(s)
    );
    
    assign cout = c1 | c2;
    
endmodule

