module test();

    bit [7:0] m_data1; // Single Dimensional Packed Arrays
    bit [3:0] [7:0] m_data2; // Multidimensional Packed Arrays: 2D packed array that occupies 32-bits or 4 bytes
    bit [2:0] [3:0] [7:0] m_data3; // 3D packed array now.
    initial begin

        m_data1 = 8'hA2;
        m_data2 = 32'hface_cafe;
        m_data3[0] = 32'hface_cafe;
        m_data3[1] = 32'h1234_5678;
        m_data3[2] = 32'hc0de_fade;

        for(int i = 0; i < $size(m_data1), i = i + 1) begin
            $display("m_data[%0d] = %b",i, m_data1[i]);
        end

        for (int i = 0; i < $size(m_data2); i++) begin
        $display ("m_data[%0d] = 0x%0h", i, m_data2[i], m_data2[i]);
		end

        foreach(m_data3[i]) begin
            $display("m_data[%0d] = 0x%x",i,m_data3[i]);
            foreach(m_data[i][j]) begin
                $display("m_data[%0d][%0d] = 0x%x",i,j,m_data3[i][j]);       
            end
        end

    end

endmodule