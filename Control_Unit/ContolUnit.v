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
// Last modified Date:     2025/01/30 10:07:53
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Shiva
// Created date:           2025/01/30 10:07:53
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              Control_Unit.v
// PATH:                  
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module ControlUnit(
    input  [5:0] Opcode, Funct,
    output MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite,
    output [2:0] ALUControl
);
    wire [1:0] ALUOp;  

    // Instantiate Main Decoder
    MainDecoder main_decoder (
        .Opcode(Opcode),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );

    // Instantiate ALU Decoder
    ALU_Decoder alu_decoder (
        .Funct(Funct),
        .ALUOp(ALUOp),
        .ALUControl(ALUControl)
    );

endmodule
