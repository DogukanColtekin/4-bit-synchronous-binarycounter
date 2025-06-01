# 4-Bit Synchronous Binary Counter on FPGA

This project implements a **4-bit synchronous binary up-counter** using VHDL-93 on the Xilinx Spartan-6 FPGA (XC6LX16-CS324) mounted on the Nexys3 board. The design uses structural VHDL style with FDCE D flip-flop components from the Xilinx library and is displayed using LEDs.

## Project Details

- **VHDL Standard**: VHDL-93
- **Target FPGA**: Xilinx Spartan-6 (XC6LX16-CS324) on the Nexys3 board
- **Clock Frequency**: 2 Hz (generated via clock divider from the 100 MHz onboard clock)

## Overview

- **4-bit synchronous binary up-counter** using VHDL-93, with **structural and dataflow architecture**.
- Implementing the design on the Nexys3 FPGA board.
- ISim can be used for simulating this design and verifying correct functionality.
- Counter outputs are displayed on 5 individual LEDs (LD0 to LD4).

## Features

**Synchronous Counting** — 4-bit binary up-counter with synchronous reset and enable.  
**Clock Divider** — Reduces the onboard 100 MHz clock to a 2 Hz clock signal.  
**Structural VHDL** — Utilizes FDCE D flip-flop components from the Xilinx library.  
**Testbench** — Includes ISim testbench file to verify functionality.  
**LED Display** — Outputs displayed on LD0, LD1, LD2, LD3 (Q[0] to Q[3]) and LD4 (CO).


## Usage

1. **Synthesis**: Use Xilinx ISE to synthesize the design and assign pins using `lab4count4.ucf`.
2. **Implementation**: Generate the bitstream and upload it to the Nexys3 FPGA board.
3. **Testing**: Observe the counter outputs on LEDs LD0 to LD4 on the FPGA board.


## Notes

- Due to long simulation times for the full 2 Hz frequency divider, consider simulating at smaller divisions for faster results.


