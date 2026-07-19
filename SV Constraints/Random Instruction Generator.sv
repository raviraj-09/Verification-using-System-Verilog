/*
#Problem 3: Random Instruction Generator

You are designing a random instruction generator for a simple processor.

Each instruction has:
opcode ? enum {ADD, SUB, LOAD, STORE, JUMP}
src1 ? 5-bit register index (0?31)
src2 ? 5-bit register index (0?31)
dest ? 5-bit register index (0?31)
imm ? 12-bit immediate

Constraints:
If opcode == LOAD ? dest != 0 (cannot write to register 0).
If opcode == STORE ? dest == 0 (since store doesn?t write back).
If opcode == JUMP ? imm must be multiple of 4 (address alignment).
src1, src2, and dest should not all be the same register.
Author: Ravi Raj
*/

typedef enum {ADD, SUB, LOAD, STORE, JUMP} opcode_t;

class Instruction;
  rand opcode_t opcode;
  rand bit [4:0] src1, src2, dest;
  rand bit [11:0] imm;

  // Constraints
  constraint c_load_store {
    if (opcode == LOAD)  dest != 0;
    if (opcode == STORE) dest == 0;
  }

  constraint c_jump {
    if (opcode == JUMP) imm % 4 == 0;
  }

  constraint c_regs {
    !(src1 == src2 && src2 == dest); // not all same
  }
endclass


module randominstructiongen_tb;
  Instruction instr = new();
  initial begin
    repeat(10) begin
      if (!instr.randomize())
        $display("Randomization failed!");
      else
        $display("OPCODE=%s SRC1=%0d SRC2=%0d DEST=%0d IMM=%0d",
                  instr.opcode.name(), instr.src1, instr.src2,
                  instr.dest, instr.imm);
    end
  end
endmodule







