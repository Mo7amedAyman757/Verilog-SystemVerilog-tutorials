module loops2();

    bit clk;

    always #10 clk = ~clk;
    initial begin
        bit [3:0] counter;

        $display ("Counter = %0d", counter);      // Counter = 0
        for (counter = 2; counter < 14; counter = counter + 2) begin
            @(posedge clk);
            $display ("Counter = %0d", counter);      // Counter increments
        end
        $display ("Counter = %0d", counter);      // Counter = 14
        $finish;
    end

    initial begin
        bit [3:0] counter;

        $display ("Counter = %0d", counter);      // Counter = 0
            do begin
                @ (posedge clk);
                counter ++;
            $display ("Counter = %0d", counter);      // Counter increments
            end while (counter < 5);
        $display ("Counter = %0d", counter);      // Counter = 14
        $finish;
   end

   bit [7:0] array [8];   // Create a fixed size array

   initial begin

      // Assign a value to each location in the array
      foreach (array [index]) begin
         array[index] = index;
      end

      // Iterate through each location and print the value of current location
      foreach (array [index]) begin
         $display ("array[%0d] = 0x%0d", index, array[index]);
      end
   end


endmodule