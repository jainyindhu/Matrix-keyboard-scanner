4×4 Matrix Keyboard Scanner

📌 Project Description

This project implements a 4×4 Matrix Keyboard Scanner using Verilog HDL.

A matrix keyboard consists of 4 rows and 4 columns, providing 16 keys. Instead of requiring one input pin for every key, the keys are arranged in a matrix. The scanner activates one row at a time and checks the column signals to determine which key is pressed.

🎯 Objectives

- Design a 4×4 matrix keyboard scanner using Verilog HDL.
- Scan the keyboard rows sequentially.
- Detect the pressed key from the row and column combination.
- Generate a "key_valid" signal when a key is detected.
- Verify the design using a Verilog testbench.

🧩 Matrix Configuration

Row| Column| Key
R0| C0| 0
R0| C1| 1
R0| C2| 2
R0| C3| 3
R1| C0| 4
R1| C1| 5
R1| C2| 6
R1| C3| 7
R2| C0| 8
R2| C1| 9
R2| C2| A
R2| C3| B
R3| C0| C
R3| C1| D
R3| C2| E
R3| C3| F

🔌 Inputs and Outputs

Inputs

- "clk" – System clock
- "reset" – Active-high reset
- "col[3:0]" – Column input signals from the keyboard

Outputs

- "row[3:0]" – Row selection signals
- "key_code[3:0]" – Detected key value
- "key_valid" – Indicates that a key has been detected

⚙️ Working Principle

1. The scanner activates one row at a time.
2. The column inputs are monitored.
3. If a column becomes active, the scanner identifies the pressed key.
4. The row and column combination is converted into a 4-bit key code.
5. "key_valid" becomes HIGH when a key is detected.
6. The scanner then continues scanning the next row.

🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- VS Code
- GitHub

📂 Project Files

matrix-keyboard-scanner/
│
├── README.md
├── matrix_keyboard_scanner.v
├── matrix_keyboard_scanner_tb.v
└── simulation/
    └── simulation_output.txt

▶️ Simulation

Compile the design and testbench using:

iverilog -o matrix_scanner_sim matrix_keyboard_scanner.v matrix_keyboard_scanner_tb.v

Run the simulation:

vvp matrix_scanner_sim

Generate waveform:

vvp -n matrix_scanner_sim

If VCD dumping is enabled, open the waveform using:

gtkwave matrix_scanner.vcd

✅ Expected Result

The testbench presses different keys by activating the corresponding column during the appropriate row scan.

Example:

Key detected: 5
Key detected: A
Key detected: F

The waveform should show the row signals changing sequentially and "key_valid" becoming HIGH when a key is detected.

🚀 Applications

- Computer keyboards
- Calculator keypads
- Embedded systems
- Digital door locks
- ATM keypads
- Microcontroller-based input systems
- FPGA-based user interfaces

👩‍💻 Author

JAINY INDHU

Electronics and Communication Engineering