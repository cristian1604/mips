# MIPS
VHDL implementation of Single-Cycle 32-bits MIPS Processor

An implementation of a single cycle MIPS processor.

This project has been tested on a [Digilent Basys 2][digilent] [FPGA]

### Changelog

  - Uploaded port map
  - Use and example in the README.md

### Software

* [Xilinx] - FPGA design solution to synthesis and simulation
* [MARS] - **M**IPS **A**ssembler and **R**untime **S**imulator

### Block Diagram
![Block diagram](https://github.com/cristian1604/mips/blob/master/img/mips.png)


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

I strongly reccomend use [MARS] software to export your code in hexadecimal format.

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

**WARNING!** If you use MARS software, watch out all the *jump* instructions. The software **always** export the line like
`x"08",x"10"` when the second tuple **MUST** be `x"00"`. Like this: `x"08",x"00"`.
So, always replace in the text `x"08",x"10"` by `x"08",x"00"`.
Otherwise the jump on the MIPS implementation will don't work.


### Bibliography
  - *Digital Design and Computer Architecture* - David Money Harris & Sarah L. Harris (2007 Elsiever)
  - *Computer Organization and Design - David A. Patterson & John L. Hennessy* (2012 Morgan Kauffman)

About
----
Developed by Cristian Bottazzi  `cbottazzi @ ful.unl.edu.ar`

Computer Organization - Computer Engineering

Facultad de Ingeniería y Ciencias Hídricas - Universidad Nacional del Litoral


[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [digilent]: <https://reference.digilentinc.com/_media/basys2:basys2_rm.pdf>
   [fpga]: <https://en.wikipedia.org/wiki/Field-programmable_gate_array>
   [xilinx]: <https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html>
   [mars]: <http://courses.missouristate.edu/kenvollmar/mars/>
