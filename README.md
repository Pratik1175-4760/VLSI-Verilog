# Digital Design Projects Repository

![Digital Design](https://img.shields.io/badge/Field-Digital_Design-blue) 
![Verilog](https://img.shields.io/badge/Language-Verilog-orange) 
![VHDL](https://img.shields.io/badge/Language-VHDL-purple)
![Xilinx Vivado](https://img.shields.io/badge/Simulated_in-Vivado-FF0000?logo=xilinx)

This repository contains a collection of Verilog and VHDL implementations for various digital design projects, all simulated using Xilinx Vivado. These projects cover fundamental digital circuits, arithmetic units, memory elements, and finite state machines.

## Projects List

1️⃣ **Basic Arithmetic Circuits**
- [Half Adder](/Half%20Adder) : 1-bit half adder implementation
- [Full Adder 1-bit](/Full%20Adder%201-bit) : 1-bit full adder using half adders
- [Full Adder 4-bit](/Full%20Adder%204-bit) : 4-bit full adder implementation

2️⃣ **Counters and Registers**
- [3-bit Up/Down Counter](/3%20bit%20Up%20down%20Counter) : 3-bit counter with up/down functionality
- [Random Counter](/Random%20Counter) : Counter with random sequence generation
- [PIPO (Parallel-In Parallel-Out)](/PIPO) : Parallel load register
- [Universal Shift Register](/Universal%20Shift%20register) : Configurable shift register

3️⃣ **Memory Elements**
- [D Flip Flop with Asynchronous Reset](/D%20Flip%20Flop%20with%20Asynchronous%20Reset) : Basic DFF with async reset
- [Synchronous D Flip Flop](/Synchronous%20D%20Flip%20Flop) : DFF with synchronous operation
- [Single Port RAM](/Single%20port%20RAM) : Basic RAM implementation
- [Dual Port RAM](/Dual%20Port%20RAM) : RAM with two access ports
- [Synchronous FIFO](/Synchronous%20FIFO) : First-In-First-Out memory buffer

4️⃣ **Arithmetic Logic Units**
- [ALU for 4-bit unsigned numbers](/Alu%20for%204%20bit%20unsigned%20numbers) : 4-bit ALU for unsigned operations
- [ALU for 4-bit signed numbers](/ALU%20of%204%20signed%20bit) : 4-bit ALU supporting signed operations

5️⃣ **State Machines**
- [Non-Overlapping Mealy (1101)](/Non-Overlapping%20Melay%20(1101)) : Mealy machine for 1101 sequence (non-overlapping)
- [Non-Overlapping Moore (1101)](/Non-Overlapping%20Moore%20(1101)) : Moore machine for 1101 sequence (non-overlapping)
- [Overlapping Mealy (1101)](/Overlapping%20Melay%20(1101)) : Mealy machine for 1101 sequence (overlapping)
- [Overlapping Moore (1101)](/Overlapping%20Moore%20(1101)) : Moore machine for 1101 sequence (overlapping)

6️⃣ **Miscellaneous Circuits**
- [4-bit LFSR](/4%20bit%20LFSR) : Linear Feedback Shift Register for pseudo-random numbers
- [Binary to Gray](/Binary%20to%20Gray) : Binary to Gray code converter
- [Clock Divider](/Clock%20Divider) : Frequency divider circuit
- [Count No. of ones](/Count%20No.%20of%20ones) : Circuit to count number of 1s in input
- [Logic gates](/Logic%20gates) : Basic logic gate implementations
- [Mux using case statement](/Mux%20using%20case%20statement) : Multiplexer implemented with case statement

## Usage

Each project is contained in its directory with the necessary source files. To use any of these designs:

1️⃣ Navigate to the project directory  
2️⃣ Compile the Verilog/VHDL files using your preferred toolchain (Xilinx, Quartus, ModelSim, etc.)  
3️⃣ Simulate or synthesize as needed  

## Customization

The **Custom Design** directory is provided for your implementations. You can use this as a template for new projects.

## License

This repository is provided for educational purposes. Feel free to use and modify the code as needed for your learning and projects.

---

<div align="center">
  <sub>Created with ❤︎ for digital design enthusiasts</sub>
</div>
