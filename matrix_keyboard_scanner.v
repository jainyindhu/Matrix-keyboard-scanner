`timescale 1ns/1ps

module matrix_keyboard_scanner (
    input  wire       clk,
    input  wire       reset,
    input  wire [3:0] col,
    output reg  [3:0] row,
    output reg  [3:0] key_code,
    output reg        key_valid
);

    reg [1:0] row_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            row_count <= 2'b00;
            row       <= 4'b1110;
            key_code  <= 4'b0000;
            key_valid <= 1'b0;
        end
        else begin

            // Default: no key detected
            key_valid <= 1'b0;

            // Activate one row at a time
            case (row_count)
                2'b00: row <= 4'b1110;
                2'b01: row <= 4'b1101;
                2'b10: row <= 4'b1011;
                2'b11: row <= 4'b0111;
            endcase

            // Detect pressed key
            if (col != 4'b1111) begin
                key_valid <= 1'b1;

                case ({row_count, col})

                    // Row 0
                    6'b00_1110: key_code <= 4'h0;
                    6'b00_1101: key_code <= 4'h1;
                    6'b00_1011: key_code <= 4'h2;
                    6'b00_0111: key_code <= 4'h3;

                    // Row 1
                    6'b01_1110: key_code <= 4'h4;
                    6'b01_1101: key_code <= 4'h5;
                    6'b01_1011: key_code <= 4'h6;
                    6'b01_0111: key_code <= 4'h7;

                    // Row 2
                    6'b10_1110: key_code <= 4'h8;
                    6'b10_1101: key_code <= 4'h9;
                    6'b10_1011: key_code <= 4'hA;
                    6'b10_0111: key_code <= 4'hB;

                    // Row 3
                    6'b11_1110: key_code <= 4'hC;
                    6'b11_1101: key_code <= 4'hD;
                    6'b11_1011: key_code <= 4'hE;
                    6'b11_0111: key_code <= 4'hF;

                    default: key_code <= 4'h0;

                endcase
            end

            // Move to next row
            row_count <= row_count + 1'b1;

        end
    end

endmodule

Note: The columns are assumed to be active-low. A pressed key connects the currently active row to a column, causing that column to become "0".