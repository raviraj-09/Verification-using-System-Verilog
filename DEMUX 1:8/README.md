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


![Screenshot 2025-10-05 184854](https://github.com/user-attachments/assets/117b1da9-def3-4d86-b46e-0a0eb51405ed)

![Screenshot 2025-10-05 185038](https://github.com/user-attachments/assets/50c0e21e-3cb8-4bf0-abd4-5b5c74c47158)

