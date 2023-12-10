# efabless_vlsi_verilog

`irun -access +r -gui parity.v parity_stim.v parity_driver.v`

# Parity Checker (8-bit)

## Overview

This repository contains the Verilog implementation of an 8-bit parity checker designed to be synthesized on the EFabless Caravel OpenLane flow. The circuit is intended for use with the Global Foundries gf180mcuD Process Development Kit as part of the coursework for CSE 30342 - Digital Integrated Circuits at the University of Notre Dame.

## Contributors

| Name            | Email              |
| --------------- | ------------------ |
| Aidan Oblepias  | aoblepia@nd.edu    |
| Allison Gentry  | agentry2@nd.edu    |
| Garrett Young   | gyoung7@nd.edu     |
| Leo Herman      | lherman@nd.edu     |

## Course Information

- Course: CSE 30342 - Digital Integrated Circuits
- University: University of Notre Dame

## Circuit Description

The parity checker circuit takes an 8-bit binary input (`data_in`) and checks for even and odd bit parity. The calculation is triggered by a rising edge on the `start` pin. The circuit operates using the clock signal (`clk`). The results are indicated through the following output pins:

- `busy`: Goes high when calculations are being performed and drops low when results are ready.
- `even_parity`: Set if `data_in` contains even bit parity.
- `odd_parity`: Set if `data_in` contains odd bit parity.

## Inputs and Outputs

### Inputs

- `clk`: Clock signal
- `start`: Start pin (calculation begins when set high)
- `data_in`: 8 bits of binary input

### Outputs

- `busy`: High when calculations are being performed. Drops low when results are ready.
- `even_parity`: Set if `data_in` contains even bit parity.
- `odd_parity`: Set if `data_in` contains odd bit parity.

## Synthesis Details

The Verilog code is designed to be synthesized on the EFabless Caravel OpenLane flow using the Global Foundries gf180mcuD Process Development Kit. Please refer to the specific documentation for the synthesis process.

## Project Setup and Implementation

To set up the EFabless environment and run through the project, including mapping the Verilog to `user_proj_example.v` and mapping the `user_proj_example` module to the `user_project_wrapper`, follow the steps outlined in the following notebooks:

1. [Setting up the EFabless Environment](https://github.com/mmorri22/cse30342/blob/main/Resources/Final%20Project%20-%20Setup.ipynb)

2. [Running through the Project - Implementation](https://github.com/mmorri22/cse30342/blob/main/Resources/Final%20Project%20-%20Implementation.ipynb)

These notebooks cover the entire process, including pushing the project to the EFabless GitHub repository and performing MPW and Tapeout Checks.

Feel free to reach out to the contributors for any inquiries or further information.
