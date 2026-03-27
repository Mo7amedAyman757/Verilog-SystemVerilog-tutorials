module compare_storage_element(
          input D,
          input clk,
          output  Q_a, Q_b, Q_c
    );
    
    D_Latch L0(
        .D(D),
        .clk(clk),
        .Q(Q_a)
    );
    
    D_FF_pos FF0(
        .D(D),
        .clk(clk),
        .Q(Q_b)
    );
    
    D_FF_neg FF1(
        .D(D),
        .clk(clk),
        .Q(Q_c)
    );
endmodule

