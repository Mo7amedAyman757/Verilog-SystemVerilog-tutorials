class header;
    int id;

    function new(int id);
        this.id = id;
    endfunction

    function showid();
        $display("id=%0d", id);
    endfunction

endclass

class packet;
    int addr;
    int data; 
    header h;

    function new(int addr, int data, int id);
        h = new(id);
        this.addr = addr;
        this.data = data;
    endfunction

    function void copy(packet hs);
        this.addr = hs.addr;
        this.data = hs.data;
        this.h.id = hs.h.id; // Create a new header object with the same id as hs.h to achieve deep copy of the header object
    endfunction


    function display(string name);
        $display("[%s] addr = 0x%0h data = 0x%0h id = %0d",name, addr, data, h.id);
    endfunction

endclass

module test();

    packet p1, p2, p3, p4;

    // This method is known as a shallow copy, because all of the variables are copied across integers, strings, instance handles, etc
    //  but nested objects are not copied entirely. Only their handles will be assigned to the new object and hence both the packets will point to the same nested object instance. 

    initial begin
        // Create a new pkt object called p1
        p1 = new(32'hface_cafe, 32'h1234_5678, 26);
        p1.display("p1");  

        // Shallow copy p1 into p2; p2 is a new object with contents in p1
        p2 = new p1;
        p2.display("p2");

        // Now let's change the addr and id in p1
        p1.addr = 32'habcd_ef12;
		p1.data = 32'h5a5a_5a5a;
		p1.h.id = 17;
		p1.display("p1"); 

        // Print p2 and see that hdr.id points to the hdr in p1, while
		// addr and data remain unchanged.
		p2.display("p2");
    end
    
    initial begin
        p3 = new(32'hface_cafe, 32'h1234_5678, 32'h1a);
        p3.display("p3");

        p4 = new(1,2,3);
        p4.copy(p3);
        p4.display("p4");

        // Now let's change the addr and id in p1
        p3.addr = 32'habcd_ef12;
		p3.data = 32'h5a5a_5a5a;
		p3.h.id = 32'h11;
		p3.display("p3"); 

        // Now let's print p2 - you'll see the changes made to hdr id 
		// but not addr
		p4.display ("p4");
    end


endmodule