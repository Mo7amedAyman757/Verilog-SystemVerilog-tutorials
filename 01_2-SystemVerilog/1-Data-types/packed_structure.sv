module tb();

// A packed structure is a mechanism for subdividing a vector into fields that can be accessed as members
//  and are packed together in memory without gaps. The first member in the structure is the most significant
//  and subsequent members follow in decreasing order of significance.
    typedef struct packed {
        bit [3:0] mode;
        bit [2:0] cfg;
        bit       en;    
    } st_ctrl;

    initial begin
        st_ctrl ctrl_reg;

        // Initialize packed structure variable
        ctrl_reg = '{4'ha,3'h5,1};
        $display ("ctrl_reg = %p", ctrl_reg);

        // Change packed structure member to something else
        ctrl_reg.mode = 4'hb;
        $display ("ctrl_reg = %p", ctrl_reg);

        // Assign a packed value to the structure variable
        ctrl_reg = 8'hff;
        $display ("ctrl_reg = %p", ctrl_reg);
    end

endmodule