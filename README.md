# SystemVerilog Digital Design and Verification

This repository contains synthesizable RTL modules and verification environments developed as part of academic coursework in SystemVerilog.  
The implemented modules represent foundational datapath and control building blocks used in larger digital systems and processor microarchitectures.

---

## RTL Modules

### Language Fundamentals
- Array usage
- Loops, Tasks, and Functions
- Data type exploration (wire)

### Arithmetic Datapath Components
- Half Adder
- Full Adder
- Ripple Carry Adder (RCA)
- RCA-based Add/Subtract Unit

### Sequential Logic
- D Flip-Flop (Asynchronous Reset)
- Shift Registers (SISO, PIPO)

### FSM Designs (Control Logic)
- Mealy FSM
- Moore FSM
- Sequence Detector

All RTL modules are written using synthesizable SystemVerilog constructs.

---

## Verification

### Constraint-Based Randomized Testbench
- External packet constraints
- Inside packet constraints
- Inverted packet constraints

### Interface-Based Testbench
- Adder verification
- PIPO Shift Register verification

### Random Packet Generator
- Mailbox-based communication

---

## Tools Used
- SystemVerilog
- Vivado (Simulation)

---

## Learning Outcomes
- Writing synthesizable RTL
- FSM design and state encoding
- Blocking vs Non-blocking assignments
- Reset handling (synchronous vs asynchronous)
- Interface-based verification
- Constrained random stimulus generation
