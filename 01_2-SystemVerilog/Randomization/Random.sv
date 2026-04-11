class Packet;
	rand bit [2:0] data;
    rand bit [7:0] addr;
endclass

module tb;
	initial begin
		Packet pkt = new ();
        pkt.addr.rand_mode(0); // Disable randomization for addr
		for (int i = 0 ; i < 10; i++) begin
			pkt.randomize ();
			$display ("itr=%0d data=0x%0h addr=0x%0h", i, pkt.data, pkt.addr);
		end
	end
endmodule