# Nand2Tetris Capstone — Make the Computer Draw a Box

**Student:** Prashant Kanwal  
**Roll No.:** 2501730468  
**Course:** Nand to Tetris – I (ETCCNT301)  
**Personal number:** K = 68

## Student-specific requirements

- `K = 68`
- `K mod 3 = 2`: the Python assembler prints a warning when a label is defined more than once. It keeps the first definition.
- `K mod 4 = 0`: box width = `16 × (0 + 1) = 16 pixels`.
- Box height = 20 screen rows.
- Starting row = 68.
- Starting screen address = `SCREEN + 32 × 68 = 16384 + 2176 = 18560`.

## Repository structure

```
Nand2Tetris-Repository/
├── Part_A_Computer/       # HDL chips including CPU.hdl, Memory.hdl, Computer.hdl
├── Part_B_Assembler/      # assembler.py and Add/Max/Rect/Pong test programs
├── Part_C_Box/            # Box.asm and generated Box.hack
├── Screenshots/           # Add your own fresh simulator screenshots here
├── Nand2Tetris_Report.docx
└── README.md
```

## Part A — Hardware

The HDL files are included in `Part_A_Computer/`. Open each chip in the Nand2Tetris Hardware Simulator and run the official test scripts and compare files. The supplied ZIP did not contain the `.tst` and `.cmp` test files, so fresh test evidence must be captured in the official simulator.

Required evidence: `CPU.tst`, `Memory.tst`, `ComputerAdd.tst`, `ComputerMax.tst`, and `ComputerRect.tst`.

## Part B — Python assembler

The assembler uses two passes:

1. First pass: remove comments/whitespace, record label ROM addresses, and collect instructions.
2. Second pass: translate A- and C-instructions into 16-bit machine code; allocate new variables from RAM address 16.

Run from the repository root:

```bash
python Part_B_Assembler/assembler.py Part_B_Assembler/Add.asm
python Part_B_Assembler/assembler.py Part_B_Assembler/Max.asm
python Part_B_Assembler/assembler.py Part_B_Assembler/Rect.asm
python Part_B_Assembler/assembler.py Part_B_Assembler/Pong.asm
python Part_B_Assembler/assembler.py Part_C_Box/Box.asm
```

The four supplied sample outputs were regenerated and matched the `.hack` files originally present in the ZIP (6, 16, 25 and 27,483 instructions respectively). The duplicate-label feature was separately checked: it prints a warning and keeps the first definition.

## Part C — Box program

`Part_C_Box/Box.asm` checks `KBD` continuously. If a key is pressed, it writes `-1` to the box's screen word (black); otherwise, it writes `0` (white/erased). It writes one 16-bit word per row for 20 rows, then advances 31 words to the same horizontal position in the next screen row.

Assemble with the student's own assembler, then load `Part_C_Box/Box.hack` in the CPU Emulator. Capture a screenshot with a key pressed and another after releasing the key.

## Screenshot checklist

Place fresh screenshots from your own simulator session in `Screenshots/`:

- `cputest.png`
- `memorytest.png`
- `computeradd.png`
- `computermax.png`
- `computerrect.png`
- `box_black.png`
- `box_white.png`

**Important:** screenshots from the source ZIP were not carried over because some visibly contained another student's name or Windows account path. Do not submit old screenshots as your own test evidence.

## Viva preparation

Be ready to explain: the two assembler passes, A-instruction vs C-instruction, labels vs variables, the role of `SCREEN` and `KBD`, why a screen row has 32 words, why the start address is 18560, and how changing the row counter or address increment changes the box.
