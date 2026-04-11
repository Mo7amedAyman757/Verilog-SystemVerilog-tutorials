module tb ();
    
task send_read();
    $display("Sending READ");
endtask

task send_write();
    $display("Sending WRITE");
endtask

initial begin
    // Here WRITE happens 4x more often.
    randcase
        4 : send_write();
        1 : send_read();
    endcase
end

endmodule