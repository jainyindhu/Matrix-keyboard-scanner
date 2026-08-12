`timescale 1ns/1ps

module matrix_keyboard_scanner_tb;

    reg clk;
    reg reset;
    reg [3:0] col;

    wire [3:0] row;
    wire [3:0] key_code;
    wire key_valid;

    // Instantiate DUT
    matrix_keyboard_scanner uut (
        .clk(clk),
        .reset(reset),
        .col(col),
        .row(row),
        .key_code(key_code),
        .key_valid(key_valid)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // VCD waveform
        $dumpfile("matrix_scanner.vcd");
        $dumpvars(0, matrix_keyboard_scanner_tb);

        clk   = 0;
        reset = 1;
        col   = 4'b1111;

        #20;
        reset = 0;

        // -----------------------------
        // Press key 5
        // Row 1, Column 1
        // -----------------------------
        #15;
        col = 4'b1101;

        #10;
        col = 4'b1111;

        // -----------------------------
        // Press key A
        // Row 2, Column 2
        // -----------------------------
        #20;
        col = 4'b1011;

        #10;
        col = 4'b1111;

        // -----------------------------
        // Press key F
        // Row 3, Column 3
        // -----------------------------
        #20;
        col = 4'b0111;

        #10;
        col = 4'b1111;

        #30;

        $finish;
    end

    // Display detected key
    always @(posedge clk) begin
        if (key_valid)
            $display("Time=%0t | Row=%b | Column=%b | Key Code=%h",
                     $time, row, col, key_code);
    end

endmodule

Expected Console Output

The exact timestamps can vary depending on simulator scheduling, but the output should contain detected key codes such as:

Time=... | Row=1101 | Column=1101 | Key Code=5
Time=... | Row=1011 | Column=1011 | Key Code=A
Time=... | Row=0111 | Column=0111 | Key Code=F

The important result is that the scanner correctly detects:

5
A
F