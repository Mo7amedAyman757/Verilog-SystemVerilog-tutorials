module tb();

    // A queue is distinguished by it's specification of the size using $ operator.

    // bounded queue
    int bounded_queue [$:10]; // depth = 10

    // unbounded queue
    int unbounded_queue[$]; // Unlimited entries

    string name_list[$]; // A queue of string elements

    bit [3:0] data[$]; // A queue of 4-bit elements

    logic [7:0]  elements [$:127];     // A bounded queue of 8-bits with maximum size of 128 slots

    int q1 [$] = {1, 2, 3, 4, 5}; // A queue initialized with 5 integer elements
    int q2[$]; // An empty queue of integers
    int tmp; // A temporary variable for storing popped elements

    tmp = q1[0]; // Accessing the first element of the queue (1) indexing starts at 0

    tmp = q1[$]; // Accessing the last element of the queue (5) using the $ operator

    q2 = q1; // Copying the contents of q1 to q2    

    q1 = {}; // Clearing all elements from q1, making it an empty queue

    q2[2] = 10; // Modifying the third element of q2 to 10

    q2.insert(3, 20); // Inserting the value 20 at index 3 in q2, shifting subsequent elements to the right

    q2 = {q2, 30}; // Appending the value 30 to the end of q2       

    q2 = {40, q2}; // Prepending the value 40 to the beginning of q2

    q2 = q2{1:$}; // Slicing the queue to create a new queue containing elements from index 1 to the end of q2

    q2 = q2{$:2}; // Slicing the queue to create a new queue containing elements from the beginning of q2 to index 2

    q2 = q2{0:$-1}; // Slicing the queue to create a new queue containing all elements except the last one

    q2 = q2{1:$-1}; // Slicing the queue to create a new queue containing all elements except the first and last ones

endmodule