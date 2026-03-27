// Array Reduction Methods

module reduction_arr_tb();

    int array [4]= '{1,2,3,4};

    initial begin
        $display("sum of array = %0d", array.sum());
        $display("product of array = %0d", array.product());
        $display("oring of array = 0x%0h", array.or());
        $display("anding of array = 0x%0h", array.and());
        $display("xoring of array = 0x%0h", array.xor());
    end

endmodule