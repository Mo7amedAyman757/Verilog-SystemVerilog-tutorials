class packet;

    bit [31:0] addr;

    function news();
        addr = 32'hFADE_CAFE;
    endfunction

endclass

class Subpacket extends packet;

    bit [3:0] id;
    bit [2:0] mode = 3;

    function new(int val = 2);
        super.news();
        id = val;
    endfunction

endclass

module tb();

    initial begin
        packet pkt1;
        Subpacket pkt2,pkt3;

        pkt1 = new();
        // Display the class variable - Because constructor was called during
        // instantiation, this variable is expected to have 32'hfade_cafe;
        $display ("addr=0x%0h", pkt1.addr);

        pkt2 = new();
        // Instantiate the child class and display member variable values
        $display ("addr=0x%0h id=%0d mode=%0d", pkt2.addr, pkt2.id, pkt2.mode);

        // Pass a value as argument to the new function in this case and print
        pkt3 = new(4);
        $display ("addr=0x%0h id=%0d mode=%0d", pkt3.addr, pkt3.id, pkt3.mode);
    end

endmodule