
module negative_design(
       input m , cout , s3,
       output neg_sign
    );
    
    assign neg_sign = (s3 | m) & (~cout);
    
endmodule