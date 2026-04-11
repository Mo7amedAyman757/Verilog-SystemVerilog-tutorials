class ABC;
  rand bit [2:0] mode;
  rand bit [3:0] len;

  // Implication operator ->
  constraint c_mode { mode == 2 -> len > 10;
                      mode == 3 -> len < 5;
                      mode == 4 -> len == 8; }

    // Implication operator if-else
    // constraint c_mode{
    //     if (mode == 2) len > 10;
    //     else if (mode == 3) len < 5;
    //     else if (mode == 4) len == 8;
    // }

endclass

module tb;
  initial begin
    ABC abc = new;
    for(int i = 0; i < 10; i++) begin
      abc.randomize();
      $display ("mode=%0d len=%0d", abc.mode, abc.len);
    end
  end
endmodule