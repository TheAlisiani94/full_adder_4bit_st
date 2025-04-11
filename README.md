# 4-Bit Full Adder with Structural Design

This project implements a 4-bit full adder using a structural design in Verilog. The design is composed of four 1-bit full adders (`full_adder_bh`) connected in a ripple-carry configuration. A testbench is provided to verify the functionality of the 4-bit full adder.

## Project Overview

The 4-bit full adder takes two 4-bit inputs (`a` and `b`), a carry-in (`cin`), and produces a 4-bit sum (`s`) and a carry-out (`cout`). The design is implemented structurally by instantiating four behavioral full adders (`full_adder_bh`).

### Files in the Project

- **`full_adder_bh.sv`**: Defines the behavioral 1-bit full adder module (`full_adder_bh`). It implements the logic for a single-bit full adder using the equations:
  - `sum = a ^ b ^ cin`
  - `cout = (a & b) | (b & cin) | (a & cin)`
  
- **`design.sv`**: Contains the 4-bit full adder module (`full_adder_4bit_st`). This module instantiates four `full_adder_bh` modules to create a ripple-carry adder.

- **`testbench.sv`**: The testbench (`full_adder_4bit_st_tb`) for the 4-bit full adder. It uses a `repeat(16)` loop to test 16 different input combinations, systematically varying `a`, `b`, and `cin`. The testbench monitors and displays the inputs and outputs for each test case.

- **`README.md`**: This file, providing an overview and instructions for the project.

## Design Details
### `full_adder_bh` Module
- **Inputs:** `a`, `b`, `cin` (1-bit each)
- **Outputs:** `sum`, `cout` (1-bit each)
- **Functionality:** Computes the sum and carry-out for a single-bit addition.

### `full_adder_4bit_st` Module
- **Inputs:**
  - `a`, `b`: 4-bit inputs (`[3:0]`)
  - `cin`: 1-bit carry-in
- **Outputs:**
  - `s`: 4-bit sum (`[3:0]`)
  - `cout`: 1-bit carry-out
- **Structure:** Four `full_adder_bh` modules are instantiated, with the carry-out of each stage connected to the carry-in of the next, forming a ripple-carry adder.

### Testbench
- The testbench (`full_adder_4bit_st_tb`) tests the 4-bit full adder with 16 test cases.
- It uses a `repeat(16)` loop to increment the inputs `{cin, b, a}` as a 9-bit vector, covering a variety of input combinations.
- The `$monitor` statement displays the inputs (`a`, `b`, `cin`) and outputs (`s`, `cout`) in both binary and decimal formats for each test case.
