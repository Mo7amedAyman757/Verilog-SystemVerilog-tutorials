module my_module();

parameter WIDTH = 8;

// 4-state(0,1,x,z) --> unsigned(reg,wire,logic)
reg [WIDTH-1:0] my_reg; // 8-bit register

// double datatype equivalent to C-language
real pi = 3.14;
real freq = 1e6; // store exponential number

// 2-state(0,1) --> signed (byte(8-bit), shorting(16-bit), int(32-bit), longint(32-bit))
byte my_var_b = 127;                  // range --> -2^7 : 2^7 - 1

shortint my_var_s = 1227; // range --> -2^15 : 2^15 - 1

int my_var_i = 12127;     // range --> -2^31 : 2^31 - 1

longint my_var_l = 111227; // range --> -2^63 : 2^63 - 1

string my_message = "hello world"; 

initial begin
    my_reg ={WIDTH{1'b1}};
    $display("my_reg = %0b", my_reg); 
    $display("pi = %0.3f", pi); 
    $display("freq = %0d", freq); 
    $display("my_message is %s",my_message);
    foreach(my_message[i]) begin
        $display("my_message[%0d] : %s", i, my_message[i]);
    end
    $display("my_var_b = %0d", my_var_b);
    $display("my_var_s = %0d", my_var_s);
    $display("my_var_i = %0d", my_var_i);
    $display("my_var_l = %0d", my_var_l);
end

endmodule