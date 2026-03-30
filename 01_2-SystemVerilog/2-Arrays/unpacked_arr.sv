module test();

    byte stack1 [7:0]; // depth = 8, 1 byte wide variable
    byte stack2 [2][4]; // 2 rows, 4 cols

    // Packed + Unpacked Array
    bit [3:0][7:0] 	stack [2][4]; 		// 2 rows, 4 cols each column is 32-bit contiguous
    initial begin

        // Assign random values to each slot of the stack
		foreach (stack1[i]) begin
			stack1[i] = $random;
			$display ("Assign 0x%0h to index %0d", stack1[i], i);
		end
        // Print contents of the stack
		$display ("stack = %p", stack1);

        // Assign random values to each slot of the stack
		foreach (stack2[i])
          foreach (stack2[i][j]) begin
            stack2[i][j] = $random;
            $display ("stack[%0d][%0d] = 0x%0h", i, j, stack2[i][j]);
			end

		// Print contents of the stack
		$display ("stack = %p", stack2);

    end

endmodule