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
// Last modified Date:     2025/01/30 10:40:19
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             Shiva 
// Created date:           2025/01/30 10:40:19
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              ALU_Decoder.v
// PATH:                   
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module ALU_Decoder(
    input [5:0] Funct,
    input [1:0] ALUOp,
    output reg [2:0] ALUControl
);

    always @(*) begin
        casez (ALUOp)
            2'b00: ALUControl = 3'b010; // Add (LW/SW)
            2'b01: ALUControl = 3'b110; // Subtract (BEQ)
            2'b1?: begin  // R-Type Instructions
                case (Funct)
                    6'b100000: ALUControl = 3'b010; // Add
                    6'b100010: ALUControl = 3'b110; // Subtract
                    6'b100100: ALUControl = 3'b000; // And
                    6'b100101: ALUControl = 3'b001; // Or
                    6'b101010: ALUControl = 3'b111; // Set Less Than (SLT)
                    default:   ALUControl = 3'b011; // Default to Zero
                endcase
            end
            default: ALUControl = 3'b011; // Default operation Zero.
        endcase
    end

endmodule
