# MIPS
VHDL implementation of Single-Cycle 32-bits MIPS Processor

An implementation of a single cycle MIPS processor.
This project has been tested on a [Digilent Basys 2][digilent] [FPGA]

If you are a FICH student, then [read this][fich]

### Changelog

  - Linked to the repo with the [complete project][EmbeddedMips]

### Software

* [Xilinx ISE Project Navigator][Xilinx] - FPGA design solution to synthesis and simulation
* [MARS] - **M**IPS **A**ssembler and **R**untime **S**imulator

### Block Diagram
![Block diagram](https://github.com/cristian1604/mips/blob/master/img/mips.png)

**As a component:**

![Block diagram](https://github.com/cristian1604/mips/blob/master/img/mips_rtl.png)

References:

  - **readdata**: Data in (32 bits)
  - **clk**: Clock signal
  - **reset**: Reset signal
  - **address**: Address to write data (on a FIFO buffer, external memory, UART).
  - **writedata**: Data to write (32 bits)
  - **memwrite**: Logic signal to write the data from *writedata* port

How I can load my own firmware?
----
The firmware must be placed on the `Instruction_Memory.vhd` file. The format is: Four hexadecimal tuples to describe one assembly instruction.

So, the instruction

`addi $s1, $0, 6` is 

`x"20",x"11",x"00",x"06",`.

I strongly recommend to use [MARS] software to export your code in hexadecimal format.

Remember: The Instruction Memory is an array with 512 elements. Each instruction is composed by four hexadecimal tuples. So the maximum number of instructions allowed is: `512/4 = 128 instructions`. You can modify this value according to the size of the FPGA memory.

### Example

For example, if you want to implement an unit than can multiply `6x4`, you can write the code in assembler language, like this:
```asm
# Set operands. In this example, multiplies 6x4
# So, in fact, this algorithm sums 6 times 4
addi $s1, $0, 6
addi $s2, $0, 4
# Set counters
addi $s0, $0, 0
addi $s3, $0, 0
for:
beq $s0, $s1, continue
  add $s3, $s3, $s2
  addi $s0, $s0, 1
  j for
continue:
# The result is stored in $s3 memory position
```
Then export it in hexadecimal code and write in the required mode:

```hexadecimal
x"20",x"11",x"00",x"06",
x"20",x"12",x"00",x"04",
x"20",x"10",x"00",x"00",
x"20",x"13",x"00",x"00",
x"12",x"11",x"00",x"03",
x"02",x"72",x"98",x"20",
x"22",x"10",x"00",x"01",
x"08",x"00",x"00",x"04",
```

**NOTE!** If you use MARS software, watch out all the *jump* instructions. The software **always** export the line like
`x"08",x"10"` when the second tuple **MUST** be `x"00"`.
So, always replace in the text `x"08",x"10"` by `x"08",x"00"`.
Otherwise the jump on this MIPS implementation will don't work.

Another notice: The `Data Memory` module is not implemented here with the rest of the microarchitecture. This is because I prefer to implement it as another module outside the processor (as a memory block, FIFO buffer, UART or another component). This is the reason of `address`, `readdata`, `writedata` and `memwrite` ports.

* [See this repository to use this MIPS and connect it with your PC][EmbeddedMips] to solve arithmetic operations!


### Bibliography
  - *Digital Design and Computer Architecture* - David Money Harris & Sarah L. Harris (2007 Elsiever)
  - *Computer Organization and Design - David A. Patterson & John L. Hennessy* (2012 Morgan Kauffman)


About
----
Developed by Cristian Bottazzi  `cbottazzi @ ful.unl.edu.ar`

If you are a FICH student, then [read this][fich]

Computer Organization - Computer Engineering

Facultad de Ingeniería y Ciencias Hídricas - Universidad Nacional del Litoral


[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [digilent]: <https://reference.digilentinc.com/_media/basys2:basys2_rm.pdf>
   [fpga]: <https://en.wikipedia.org/wiki/Field-programmable_gate_array>
   [xilinx]: <https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html>
   [mars]: <http://courses.missouristate.edu/kenvollmar/mars/>
   [fich]: <http://github.com/cristian1604/mips/blob/master/img/FICH_note.md>
   [EmbeddedMips]: <https://github.com/cristian1604/EmbeddedMips>
