module associative_tb();

    // 24-bit word width, 20-bit address space (2^20 words)
    bit [23:0] mem [bit[19:0]];

    initial begin
        // Reset vector at address 0
        mem[20'h00000] = 24'hA50400;

        // Program starts at 0x400
        mem[20'h00400] = 24'h123456;
        mem[20'h00401] = 24'h789ABC;

        // ISR at maximum address = 2^20 - 1
        mem[20'hFFFFF] = 24'h0F1E2D;

        // Print elements and size
        foreach(mem[addr]) begin
            $display("Address = 0x%05h, Data = 0x%06h",addr,mem[addr]);
        end

        $display("Number of elements = %0d",mem.num());
    end

endmodule