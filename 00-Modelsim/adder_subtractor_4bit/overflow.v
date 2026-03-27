
module overflow_design(
        input x, y, s,
        output ov_sign
    );
    
    assign ov_sign = (~x & ~y & s) | (x & y & ~s);
endmodule