module loops1();

    // forever, repeat, while, for, do while, foreach
    initial begin
        bit clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #50 $finish;
    end
    
    initial begin
        repeat(5) begin
            $display("Hello World!");    
        end
    end

    initial begin
        bit [3:0] counter;
        while (counter < 10) begin
            @(posedge clk);
                counter++;
                $display ("Counter = %0d", counter);   
        end
    end

endmodule