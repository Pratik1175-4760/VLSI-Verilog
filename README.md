# Digital Design Projects Repository

![Digital Design](https://img.shields.io/badge/Field-Digital_Design-blue) 
![Verilog](https://img.shields.io/badge/Language-Verilog-orange) 
![VHDL](https://img.shields.io/badge/Language-VHDL-purple)

This repository contains a collection of Verilog/VHDL implementations for various digital design projects. These projects cover fundamental digital circuits, arithmetic units, memory elements, and finite state machines.

## Projects List

### Basic Arithmetic Circuits
- **Half Adder**: 1-bit half adder implementation
- **Full Adder 1-bit**: 1-bit full adder using half adders
- **Full Adder 4-bit**: 4-bit full adder implementation

### Counters and Registers
- **3-bit Up/Down Counter**: 3-bit counter with up/down functionality
- **Random Counter**: Counter with random sequence generation
- **PIPO (Parallel-In Parallel-Out)**: Parallel load register
- **Universal Shift Register**: Configurable shift register

### Memory Elements
- **D Flip Flop with Asynchronous Reset**: Basic DFF with async reset
- **Synchronous D Flip Flop**: DFF with synchronous operation
- **Single Port RAM**: Basic RAM implementation
- **Dual Port RAM**: RAM with two access ports
- **Synchronous FIFO**: First-In-First-Out memory buffer

### Arithmetic Logic Units
- **ALU for 4-bit unsigned numbers**: 4-bit ALU for unsigned operations
- **ALU for 4-bit signed numbers**: 4-bit ALU supporting signed operations

### State Machines
- **Non-Overlapping Mealy (1101)**: Mealy machine for 1101 sequence (non-overlapping)
- **Non-Overlapping Moore (1101)**: Moore machine for 1101 sequence (non-overlapping)
- **Overlapping Mealy (1101)**: Mealy machine for 1101 sequence (overlapping)
- **Overlapping Moore (1101)**: Moore machine for 1101 sequence (overlapping)

### Miscellaneous Circuits
- **4-bit LFSR**: Linear Feedback Shift Register for pseudo-random numbers
- **Binary to Gray**: Binary to Gray code converter
- **Clock Divider**: Frequency divider circuit
- **Count No. of ones**: Circuit to count number of 1s in input
- **Logic Gates**: Basic logic gate implementations
- **Mux using case statement**: Multiplexer implemented with case statement

## Usage

Each project is contained in its own directory with the necessary source files. To use any of these designs:

1. Navigate to the project directory
2. Compile the Verilog/VHDL files using your preferred toolchain (Xilinx, Quartus, ModelSim, etc.)
3. Simulate or synthesize as needed

## Customization

The **Custom Design** directory is provided for your own implementations. You can use this as a template for new projects.

## License

This repository is provided for educational purposes. Feel free to use and modify the code as needed for your learning and projects.

---

<div align="center">
  <sub>Created with ❤︎ for digital design enthusiasts</sub>
</div>
