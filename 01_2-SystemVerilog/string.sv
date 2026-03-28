module tb;
  string firstname = "Joey";
  string lastname  = "Tribbiani";

    initial begin
        // String Equality : Check if firstname equals or not equals lastname
        if (firstname == lastname)
            $display ("firstname=%s is EQUAL to lastname=%s", firstname, lastname);

        if (firstname != lastname)
            $display ("firstname=%s is NOT EQUAL to lastname=%s", firstname, lastname);

        // String comparison : Check if length of firstname < length of lastname
        if (firstname < lastname)
            $display ("firstname=%s is LESS THAN lastname=%s", firstname, lastname);

        // String comparison : Check if length of firstname > length of lastname
        if (firstname > lastname)
            $display ("firstname=%s is GREATER THAN lastname=%s", firstname, lastname);  

        // String concatenation : Join first and last names into a single string
        $display ("Full Name = %s", {firstname, " ", lastname});  

        // String Replication
        $display ("%s", {3{firstname}});
        
    end

endmodule