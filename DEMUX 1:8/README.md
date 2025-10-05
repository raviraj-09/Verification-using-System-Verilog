# 🧠 1-to-8 Demultiplexer (DEMUX) in Verilog

## 📘 Overview
A **Demultiplexer (DEMUX)** is a combinational circuit that takes a single input and routes it to one of several outputs based on select lines.  
In this project, we implement a **1-to-8 Demultiplexer** using **Verilog HDL**, simulate it in **ModelSim/QuestaSim**, and verify its correctness using a testbench.

---

## ⚙️ Functionality
- **Input:** `I` (1-bit)
- **Select Lines:** `S` (3-bit → S2, S1, S0)
- **Outputs:** `Y` (8-bit → Y0 to Y7)

| Select Lines (S2 S1 S0) | Output Active |
|--------------------------|----------------|
| 000 | Y0 = I |
| 001 | Y1 = I |
| 010 | Y2 = I |
| 011 | Y3 = I |
| 100 | Y4 = I |
| 101 | Y5 = I |
| 106 | Y6 = I |
| 111 | Y7 = I |

Only one output line is active at a time depending on the select line combination.

---

## Output 

Time=0 | I=1 | S=000 | Y=00000001
Time=10 | I=1 | S=001 | Y=00000010
Time=20 | I=1 | S=010 | Y=00000100
Time=30 | I=1 | S=011 | Y=00001000
Time=40 | I=1 | S=100 | Y=00010000
Time=50 | I=1 | S=101 | Y=00100000
Time=60 | I=1 | S=110 | Y=01000000
Time=70 | I=1 | S=111 | Y=10000000

