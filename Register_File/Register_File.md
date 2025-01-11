# Register File Module

## Overview

This module implements a Register File, a fundamental building block in processor design. It allows for efficient storage and retrieval of data using multiple read and write ports. The module is parameterized to support flexibility in data width and depth, making it adaptable to various applications.

## Features

- **Dual Read Ports**: Supports reading from two registers simultaneously.
- **Single Write Port**: Allows writing data to one register at a time.

### Parameterization:
- **WIDTH**: Defines the width of each register (default is 32 bits).
- **DEPTH**: Defines the number of registers in the file (default is 32 registers).
- **Write Protection**: Prevents overwriting of register 0 (register 0 always holds 0 as per convention).

## Specifications

### Inputs
- **CLK** (input wire): The clock signal for synchronizing write operations.
- **A1, A2** (input wire): Addresses for read ports 1 and 2, respectively.
- **A3** (input wire): Address for the write port.
- **WD3** (input wire): Write data for the write port.
- **WE3** (input wire): Write enable signal. When high, enables writing data to the register addressed by A3.

### Outputs
- **RD1** (output reg): Data read from the register addressed by A1.
- **RD2** (output reg): Data read from the register addressed by A2.

## Internal Structure

### Memory Array:
The register file is implemented as a 2D array (memory), with DEPTH rows and WIDTH columns.

## Functional Description

### Write Operation:
Triggered on the rising edge of the clock (posedge CLK).
- If WE3 is high and A3 is not 0, the value of WD3 is written to the register addressed by A3.

```verilog
always @(posedge CLK) begin
    if (WE3) begin
        if (A3 !== 5'b0)
            memory[A3] <= WD3;
    end
end
```
### Write Operation:
Performed asynchronously (combinational logic).
- If A1 or A2 is 0, RD1 or RD2 returns 0 respectively.
- Otherwise, the value stored in the registers addressed by A1 and A2 is returned.

```verilog
always @(*) begin
    RD1 = (A1 == 0) ? 32'b0 : memory[A1];
    RD2 = (A2 == 0) ? 32'b0 : memory[A2];
end
```
