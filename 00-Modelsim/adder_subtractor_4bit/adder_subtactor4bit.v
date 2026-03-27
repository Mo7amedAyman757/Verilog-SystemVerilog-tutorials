module adder_subtractor_nbit #(parameter n = 4)(
        input [n-1 : 0] x , y,
        input n_signal, m_signal,
        output  [n-1 : 0] s,
        output cout, neg_sign, ov_sign
    );
    
    wire [n-1 : 0] xored_x, xored_y, xored_s;
    wire [n-1 : 0] s_x,s_xy;
    generate
     genvar k;
     for(k=0; k < n; k = k +1)
     begin
      
      assign xored_x[k] = x[k] ^ n_signal;
      assign xored_y[k] = y[k] ^ m_signal;
      assign xored_s[k] = s_xy[k] ^ neg_sign;
      
     end
    endgenerate
    
    adder_nbit #(.n(n)) twos_x(
          .x(xored_x),
          .y(4'b0),
          .cin(n_signal),
          .s(s_x)
    );
    
     adder_nbit #(.n(n)) twosy_x(
          .x(s_x),
          .y(xored_y),
          .cin(m_signal),
          .s(s_xy),
          .cout(cout)
    );
    
    negative_design neg(
      .m(m_signal),
      .cout(cout),
      .s3(s_xy[n-1]),
      .neg_sign(neg_sign)
    );
    
    overflow_design ov(
      .x(xored_x[n-1]),
      .y(xored_y[n-1]),
      .s(s_xy[n-1]),
      .ov_sign(ov_sign)
    );
    
     adder_nbit #(.n(n)) sum(
          .x(xored_s),
          .y(4'b0),
          .cin(neg_sign),
          .s(s)
    );
endmodule

