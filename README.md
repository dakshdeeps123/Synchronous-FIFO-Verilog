# Synchronous FIFO Design & Verification using Verilog

## Project Overview
Designed and verified an 8-bit wide, 4-depth Synchronous FIFO using Verilog HDL.

## Design Specifications
- Data Width: 8 bits
- FIFO Depth: 4
- Clock: Synchronous
- Read and Write Pointers
- Full and Empty Status Flags
- Occupancy Counter

## Features
- Synchronous read and write operations
- Circular pointer management
- Full and empty condition detection
- Simultaneous read and write handling

## Verification
Created a Verilog testbench to verify FIFO functionality.

Test scenarios:
- Reset operation
- Writing data into FIFO
- Reading data from FIFO
- Full condition
- Empty condition
- Pointer wrap-around

## Tools Used
- Verilog HDL
- Synopsys VCS
- Verdi (Waveform Analysis)

## Repository Structure
- `fifo_rtl.v` – FIFO RTL design
- `fifo_tb.v` – Verification testbench
- `README.md` – Project documentation
