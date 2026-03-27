// Array Locator Methods

module locator_arr_tb();

    int array [9]= '{4, 7, 2, 5, 7, 1, 6, 3, 1};

    initial begin
        // Mandatory 'with' clause
        $display("find(x) : %p",array.find(x) with (x > 3));
        $display("find(x) : %p",array.find_index(x) with (x < 3));
        $display("find(x) : %p",array.find_first(x) with (x < 3));
        $display("find(x) : %p",array.find_first_index(x) with (x < 3));
        $display("find(x) : %p",array.find_last(x) with (x < 3));
        $display("find(x) : %p",array.find_last_index(x) with (x < 3));

        // Optional 'with' clause
        $display("min : %p",array.min());
        $display("max : %p",array.max());
        $display("unique : %p",array.unique());
        $display("unique : %p",array.unique(x) with(x<3));
        $display("unique_index : %p",array.unique_index());
    end

endmodule