`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE     
// VSCODE plug-in version: Verilog-Hdl-Format-3.3.20250120
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            ...
// All rights reserved     
// File name:              
// Last modified Date:     2025/01/30 10:59:07
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Shiva 
// Created date:           2025/01/30 10:59:07
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              MainDecoder.v
// PATH:                   
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module MainDecoder(
    input [5:0] Opcode,
    output reg MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite,
    output reg [1:0] ALUOp
);

    always @(*) begin
        case (Opcode)
            6'b000000: begin  // R-type Instruction
                RegWrite = 1;
                RegDst   = 1;
                ALUSrc   = 0;
                Branch   = 0;
                MemWrite = 0;
                MemtoReg = 0;
                ALUOp    = 2'b10;
            end

            6'b100011: begin  // LW (Load Word)
                RegWrite = 1;
                RegDst   = 0;
                ALUSrc   = 1;
                Branch   = 0;
                MemWrite = 0;
                MemtoReg = 1;
                ALUOp    = 2'b00;
            end

            6'b101011: begin  // SW (Store Word)
                RegWrite = 0;
                RegDst   = 1'bx;  
                ALUSrc   = 1;
                Branch   = 0;
                MemWrite = 1;
                MemtoReg = 1'bx;  
                ALUOp    = 2'b00;
            end

            6'b000100: begin  // BEQ (Branch if Equal)
                RegWrite = 0;
                RegDst   = 1'bx;  
                ALUSrc   = 0;
                Branch   = 1;
                MemWrite = 0;
                MemtoReg = 1'bx;  
                ALUOp    = 2'b01;
            end

            default: begin  
                RegWrite = 0;
                RegDst   = 0;
                ALUSrc   = 0;
                Branch   = 0;
                MemWrite = 0;
                MemtoReg = 0;
                ALUOp    = 2'b00;
            end
        endcase
    end
endmodule
