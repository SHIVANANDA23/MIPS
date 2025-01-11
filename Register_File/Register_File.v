module Register_File #(
    parameter WIDTH = 32,
    parameter DEPTH = 32
)(
    input wire CLK,
    input wire [$clog2(DEPTH)-1:0] A1, A2, A3,
    input wire [WIDTH-1:0] WD3,
    input wire WE3,
    output reg [WIDTH-1:0] RD1,
    output reg [WIDTH-1:0] RD2
);

    reg [WIDTH-1:0] memory [0:DEPTH-1];

    always @(posedge CLK) begin
         if (WE3) begin
          if(A3!==5'b0)
            memory[A3] <= WD3;
        end
    end
    always @(*) begin
        RD1 = (A1 == 0) ? 32'b0 : memory[A1]; 
        RD2 = (A2 == 0) ? 32'b0 : memory[A2];     
    end  

endmodule



/*
module Register_File #(
    parameter WIDTH = 32,
    parameter DEPTH = 32
)(
    input  logic CLK,
    input  logic [$clog2(DEPTH)-1:0] A1,
    input  logic [$clog2(DEPTH)-1:0] A2,
    input  logic [$clog2(DEPTH)-1:0] A3,
    input  logic [WIDTH-1:0] WD3,
    input  logic WE3,
    output logic [WIDTH-1:0] RD1,
    output logic [WIDTH-1:0] RD2
);

    logic [WIDTH-1:0] memory [0:DEPTH-1];

    always_ff @(posedge CLK) begin
        if (WE3) begin
          if(A3!==5'b0)
            memory[A3] <= WD3;
        end
    end

//    always_comb begin
//        RD1 = memory[A1];
//        RD2 = memory[A2];
//    end
//
always_comb begin
        RD1 = (A1 == 0) ? 32'b0 : memory[A1]; 
        RD2 = (A2 == 0) ? 32'b0 : memory[A2];     
    end
endmodule
*/
