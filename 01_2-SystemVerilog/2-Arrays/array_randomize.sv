class packet; 

    rand bit [3:0] s_array[7]; // Declare a static array with "rand"

endclass

// Consider the example below where we declare a dynamic array as indicated by the empty square 
// brackets [] of type rand. A constraint is defined to limit the size of the dynamic array to be 
// somewhere in between 5 and 8. Another constraint is defined to assign each element in the array with the value of its index.

class pk;

    rand bit [3:0] d_array [];

    constraint c_array {
        d_array.size() inside {[6:7]};
    }

    constraint c_val{
        foreach (d_array[i]) 
            d_array[i] == i;
    }

    // Utility function to display dynamic array contents
    function void display();
    foreach (d_array[i])
      $display ("d_array[%0d] = 0x%0h", i, d_array[i]);
    endfunction

endclass

module test();

    packet pkt1; 

    pk pkt2;

    initial begin

        pkt1 = new();
        pkt1.randomize();
        $display("queue = %p", pkt1.s_array);

        pkt2 = new();
        pkt2.randomize();
        pkt2.display();

    end


endmodule