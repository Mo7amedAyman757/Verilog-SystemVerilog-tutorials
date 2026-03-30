module dynamic_arr_tb();

    // A dynamic array 
    int array [];

    initial begin
        // Create a size for the dynamic array -> size here is 5
		// so that it can hold 5 values
        array = new[5];
        
        array = '{31,67,4,20,99};

        // Dynamic array method --> size
        $display("array.size = %d", array.size());

        foreach (array[i])
            $display("array[%d] = %d", i, array[i]);

        // This creates one more slot in the array, while keeping old contents
        array = new[array.size() + 1] (array);

        $display("array.size = %d", array.size());

        array[array.size() - 1] = 87;
        
        foreach (array[i])
            $display("array[%d] = %d", i, array[i]);
    end

endmodule