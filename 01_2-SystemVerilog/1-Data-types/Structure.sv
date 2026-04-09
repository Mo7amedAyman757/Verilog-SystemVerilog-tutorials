module tb();

// Structures -> a collection of variables of different data types
    struct{
      string fruit;
  	  int count;
  	  byte expiry;
    }st_fruit;

    initial begin
        // st_fruit is a structure variable, so let's initialize it
        st_fruit = '{"apple", 4, 15};
        $display("st_fruit = %p", st_fruit);

        // Change fruit to pineapple, and expiry to 7
        st_fruit.fruit = "pineapple";
        st_fruit.expiry = 7;
        $display("st_fruit = %p", st_fruit);
    end
        

    initial begin
        // Only one variable was created in the example above, but if there's a need to create multiple structure 
        // variables with the same constituents, it'll be better to create a user defined data type of the structure by typedef. 
        // Then st_fruit will become a data-type which can then be used to create variables of that type.
        typedef struct {
            string fruit;
            int count;
            byte expiry;
        }st_fruit;

        st_fruit fruit1 = '{"apple", 4, 15};
        st_fruit fruit2;
        // Display the structure variable
        $display ("fruit1 = %p fruit2 = %p", fruit1, fruit2);

        // Assign one structure variable to another and print
        // Note that contents of this variable is copied into the other
        fruit2 = fruit1;
        $display ("fruit1 = %p fruit2 = %p", fruit1, fruit2);

        // Change fruit1 to see if fruit2 is affected
        fruit1.fruit = "orange";
        $display ("fruit1 = %p fruit2 = %p", fruit1, fruit2);
    end

endmodule