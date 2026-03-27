    `timescale 1ns / 1ps
    //////////////////////////////////////////////////////////////////////////////////
    // Company: 
    // Engineer: 
    // 
    // Create Date: 10/24/2025 09:16:23 PM
    // Design Name: 
    // Module Name: cpu
    // Project Name: 
    // Target Devices: 
    // Tool Versions: 
    // Description: 
    // 
    // Dependencies: 
    // 
    // Revision:
    // Revision 0.01 - File Created
    // Additional Comments:
    // 
    //////////////////////////////////////////////////////////////////////////////////
    
    
  module cpu (
    input CLK,
    output reg [15:0] IR, TR, DR, AC,
    output reg [12:0] PC, AR,
    output reg [3:0] State,
    output reg E,
    output reg S
);

    reg [15:0] MEM [0:255];

    // Opcode definitions
    parameter
        AND = 4'b0000,
        ADD = 4'b0001,
        LDA = 4'b0010,
        STA = 4'b0011,
        CLA = 16'h7800,
        CLE = 16'h7400,
        CMA = 16'h7200,
        CME = 16'h7100,
        CIR = 16'h7080,
        CIL = 16'h7040,
        HLT = 16'h7020;

    initial begin
        State <= 0;
        IR <= 0;
        TR <= 0;
        DR <= 0;
        AC <= 0;
        AR <= 0;
        PC <= 22;
        E  <= 0;
        S  <= 1;
        $readmemh("program.hex", MEM);
    end

    always @(posedge CLK) begin
        case (State)
            4'b0000: begin // T0
                AR <= PC;
                State <= 4'b0001;
            end

            4'b0001: begin // T1
                IR <= MEM[AR];
                PC <= PC + 1;
                State <= 4'b0010;
            end

            4'b0010: begin // T2
                AR <= IR[11:0];
                State <= 4'b0011;
            end

            4'b0011: begin // T3
                case (IR[15:12])
                    AND, ADD, LDA: DR <= MEM[AR];
                    STA: TR <= AC;
                endcase
                State <= 4'b0100;
            end

            4'b0100: begin // T4
                case (IR[15:12])
                    AND: begin
                        AC <= AC & DR;
                        State <= 0;
                    end
                    ADD: begin
                        {E, AC} <= AC + DR;
                        State <= 0;
                    end
                    LDA: begin
                        AC <= DR;
                        State <= 0;
                    end
                    STA: begin
                        MEM[AR] <= TR;
                        State <= 0;
                    end
                endcase

                // Register-reference instructions
                case (IR)
                    CLA: AC <= 0;
                    CLE: E <= 0;
                    CMA: AC <= ~AC;
                    CME: E <= ~E;
                    CIR: begin
                        AC <= (AC >> 1);
                        AC[15] <= E;
                        E <= AC[0];
                    end
                    CIL: begin
                        AC <= (AC << 1);
                        AC[0] <= E;
                        E <= AC[15];
                    end
                    HLT: S <= 0;
                endcase
            end
        endcase
    end
endmodule

