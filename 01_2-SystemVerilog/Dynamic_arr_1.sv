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

        // Empty the dynamic array by deleting all items
        array.delete();
        $display("array.size = %d", array.size());
    end

endmodule