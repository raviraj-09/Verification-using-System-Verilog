# 8-to-1 Multiplexer (MUX) - SystemVerilog

This repository contains the **SystemVerilog implementation and verification** of an 8-to-1 multiplexer (MUX). It demonstrates both **digital design** and **verification** techniques for combinational circuits.

---

## Overview

An **8-to-1 MUX** selects **one of eight input lines** (`I0` to `I7`) based on a 3-bit select input (`S2, S1, S0`) and outputs it to `Y`.

- **Inputs:** 8 data lines (`I0` to `I7`), 3 select lines (`S2, S1, S0`)  
- **Output:** 1 line (`Y`)  

**Truth Table:**

| Select (S2 S1 S0) | Output Y |
|------------------|----------|
| 000              | I0       |
| 001              | I1       |
| 010              | I2       |
| 011              | I3       |
| 100              | I4       |
| 101              | I5       |
| 110              | I6       |
| 111              | I7       |


## Author

**Ravi Raj**  
VLSI Design Verification Trainee  

[LinkedIn Profile](https://www.linkedin.com/in/ravi-raj-023a75253/)


