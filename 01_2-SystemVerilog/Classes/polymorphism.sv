class Packet;
    int addr;
    
    function new(int addr);
        this.addr = addr;
    endfunction

    function $display();
        $display("[Base] addr = 0x%0h",addr);  
    endfunction

endclass

// A subclass called 'ExtPacket' is derived from the base class 'Packet' using
// 'extends' keyword which makes 'EthPacket' a child of the parent class 'Packet'
// The child class inherits all variables and methods from the parent class

class ExtPacket extends Packet;
    int data; // This is a new variable only available in child class

    function new(int addr,data);
        super.new(addr); // Calls 'new' method of parent class
        this.data = data;
    endfunction

    function $display();
        $display("[Child] addr=0x%0h data=0x%0h", addr, data);  
    endfunction

endclass

module tb ();

    Packet    bc; // bc stands for BaseClass
    ExtPacket sc; // sc stands for SubClass

    initial begin
        sc = new (32'hfeed_feed, 32'h1234_5678);
		bc = sc; // Assigning child class object to parent class handle
        bc.display (); // the parent class display() function will be executed.
        sc.display (); // the child class display() function will be executed.
    end
    
    initial begin
        sc = new (32'hfeed_feed, 32'h1234_5678);
		bc = sc; // Assigning child class object to parent class handle

        // even though bc points to the child class instance, when display() function is called from bc
        // it still invoked the display() function within the base class.
        $display("data = 0x%0h" bc.data); // This will cause an error because 'data' is not a member of the parent class 'Packet'
    end

    initial begin
        bc = new (32'hface_cafe);

        // Assign base class object to sub-class handle
        // It is illegal to directly assign a variable of a superclass type to a variable of one of its subclass types
        // hence you'll get a compilation error.
		sc = bc;

		bc.display ();
    end

    initial begin
        bc = new (32'hface_cafe);

        // Dynamic cast base class object to sub-class type
        // $cast can be used to assign a superclass handle to a variable of a subclass type 
        // provided the superclass handle refers to an object that is assignment compatible with the subclass variable.
		$cast (sc, bc);

		bc.display ();
    end

    initial begin
        ExtPacket sc2;
        bc = new (32'hface_cafe);
        sc = new (32'hfeed_feed, 32'h1234_5678);
        bc = sc;

        // Dynamic cast sub class object in base class handle to sub-class type
        $cast (sc2, bc);

        sc2.display ();
        $display ("data=0x%0h", sc2.data);
    end

endmodule