# Digital Electronics Lab: VHDL & Verilog Implementations

![Hardware Description Language](https://img.shields.io/badge/HDL-VHDL%20%7C%20Verilog-blue)
![Platform](https://img.shields.io/badge/Tools-Vivado%20%7C%20Quartus%20%7C%20ModelSim-orange)
![License](https://img.shields.io/badge/License-MIT-green)

Welcome to the **Digitel-Lab-VHDL-Verilog** repository. This repository serves as a comprehensive digital design portfolio, containing structural, dataflow, and behavioral implementations of fundamental to advanced digital circuits using both **VHDL** and **Verilog HDL**. 

The code in this repository is designed for functional simulation, timing analysis, and hardware synthesis on modern FPGA platforms (e.g., AMD Xilinx, Intel Altera).

---

## 📂 Repository Structure

The project directory is structured cleanly into modules, separating design files, testbenches, and documentation:

```text
Digitel-Lab-VHDL-Verilog/
├── .gitignore
├── README.md
│
├── 01_Combinational_Logic/
│   ├── basic_gates/              # AND, OR, XOR, NOT, NAND, NOR
│   │   ├── src/                  # Design files (.v, .vhd)
│   │   └── tb/                   # Testbenches
│   ├── multiplexers_decoders/    # MUX 2:1, 4:1, Decoders 2:4, 3:8
│   ├── adders_subtractors/       # Half/Full Adder, Ripple Carry Adder
│   └── alu/                      # N-bit Arithmetic Logic Unit
│
├── 02_Sequential_Logic/
│   ├── latches_flip_flops/       # D-FF, JK-FF, T-FF (Sync/Async Reset)
│   ├── registers_shifters/       # PIPO, PISO, SIPO shift registers
│   └── counters/                 # Binary, BCD, Up/Down, Gray code counters
│
├── 03_Finite_State_Machines/
│   ├── mealy_machines/           # Mealy sequence detectors
│   └── moore_machines/           # Moore traffic light / sequence controllers
│
└── 04_Complex_Systems/
    └── digital_clock/            # Complete system clock with display driver
