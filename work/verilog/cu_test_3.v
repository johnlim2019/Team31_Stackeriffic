/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module cu_test_3 (
    input clk,
    input rst,
    input button,
    input [7:0] selector,
    input updateSpeed,
    input [2:0] speedSel,
    output reg [2:0] readSpead,
    output reg [15:0] out,
    output reg [15:0] state_number,
    output reg [7:0] outledhigh,
    output reg [7:0] outledlow
  );
  
  
  
  wire [3-1:0] M_beta_readSpeed;
  wire [16-1:0] M_beta_reg0_speed_frame_count;
  wire [16-1:0] M_beta_reg9_and_computation;
  wire [16-1:0] M_beta_reg11_current_line_index;
  wire [16-1:0] M_beta_r1_out;
  wire [16-1:0] M_beta_r2_out;
  wire [16-1:0] M_beta_r3_out;
  wire [16-1:0] M_beta_r4_out;
  wire [16-1:0] M_beta_r5_out;
  wire [16-1:0] M_beta_r6_out;
  wire [16-1:0] M_beta_r7_out;
  wire [16-1:0] M_beta_r8_out;
  wire [16-1:0] M_beta_statedebug;
  wire [16-1:0] M_beta_wdsel_output;
  wire [4-1:0] M_beta_write_addr;
  wire [6-1:0] M_beta_alufn;
  wire [3-1:0] M_beta_asel;
  wire [3-1:0] M_beta_bsel;
  wire [2-1:0] M_beta_wdselin;
  wire [1-1:0] M_beta_we;
  wire [4-1:0] M_beta_regfile_read_address_a;
  wire [4-1:0] M_beta_regfile_read_address_b;
  wire [16-1:0] M_beta_read_a_data;
  wire [16-1:0] M_beta_read_b_data;
  reg [1-1:0] M_beta_button;
  reg [3-1:0] M_beta_speedSel;
  reg [1-1:0] M_beta_updateSpeed;
  game_beta_9 beta (
    .clk(clk),
    .rst(rst),
    .button(M_beta_button),
    .speedSel(M_beta_speedSel),
    .updateSpeed(M_beta_updateSpeed),
    .readSpeed(M_beta_readSpeed),
    .reg0_speed_frame_count(M_beta_reg0_speed_frame_count),
    .reg9_and_computation(M_beta_reg9_and_computation),
    .reg11_current_line_index(M_beta_reg11_current_line_index),
    .r1_out(M_beta_r1_out),
    .r2_out(M_beta_r2_out),
    .r3_out(M_beta_r3_out),
    .r4_out(M_beta_r4_out),
    .r5_out(M_beta_r5_out),
    .r6_out(M_beta_r6_out),
    .r7_out(M_beta_r7_out),
    .r8_out(M_beta_r8_out),
    .statedebug(M_beta_statedebug),
    .wdsel_output(M_beta_wdsel_output),
    .write_addr(M_beta_write_addr),
    .alufn(M_beta_alufn),
    .asel(M_beta_asel),
    .bsel(M_beta_bsel),
    .wdselin(M_beta_wdselin),
    .we(M_beta_we),
    .regfile_read_address_a(M_beta_regfile_read_address_a),
    .regfile_read_address_b(M_beta_regfile_read_address_b),
    .read_a_data(M_beta_read_a_data),
    .read_b_data(M_beta_read_b_data)
  );
  wire [8-1:0] M_matrix_writer_outled;
  wire [8-1:0] M_matrix_writer_outgnd;
  wire [1-1:0] M_matrix_writer_clkout;
  reg [64-1:0] M_matrix_writer_row;
  matrix_writer_10 matrix_writer (
    .clk(clk),
    .rst(rst),
    .row(M_matrix_writer_row),
    .outled(M_matrix_writer_outled),
    .outgnd(M_matrix_writer_outgnd),
    .clkout(M_matrix_writer_clkout)
  );
  
  always @* begin
    M_beta_button = button;
    out = 16'hf001;
    state_number = M_beta_statedebug;
    M_matrix_writer_row[0+7-:8] = M_beta_r1_out[0+7-:8];
    M_matrix_writer_row[8+7-:8] = M_beta_r2_out[0+7-:8];
    M_matrix_writer_row[16+7-:8] = M_beta_r3_out[0+7-:8];
    M_matrix_writer_row[24+7-:8] = M_beta_r4_out[0+7-:8];
    M_matrix_writer_row[32+7-:8] = M_beta_r5_out[0+7-:8];
    M_matrix_writer_row[40+7-:8] = M_beta_r6_out[0+7-:8];
    M_matrix_writer_row[48+7-:8] = M_beta_r7_out[0+7-:8];
    M_matrix_writer_row[56+7-:8] = M_beta_r8_out[0+7-:8];
    outledhigh = M_matrix_writer_outled;
    outledlow = M_matrix_writer_outgnd;
    M_beta_updateSpeed = updateSpeed;
    M_beta_speedSel = speedSel;
    readSpead = M_beta_readSpeed;
    
    case (selector)
      8'h00: begin
        out = M_beta_wdsel_output;
      end
      8'h01: begin
        out = M_beta_reg11_current_line_index;
      end
      8'h02: begin
        out = M_beta_statedebug;
      end
      8'h03: begin
        out = M_beta_write_addr;
      end
      8'h04: begin
        out = M_beta_regfile_read_address_a;
      end
      8'h05: begin
        out = M_beta_regfile_read_address_b;
      end
      8'h06: begin
        out = M_beta_wdselin;
      end
      8'h07: begin
        out = M_beta_we;
      end
      8'h08: begin
        out = M_beta_asel;
      end
      8'h09: begin
        out = M_beta_bsel;
      end
      8'h0a: begin
        out = M_beta_reg9_and_computation;
      end
      8'h0b: begin
        out = M_beta_reg0_speed_frame_count;
      end
      8'h0c: begin
        out = M_beta_read_a_data;
      end
      8'h0d: begin
        out = M_beta_read_b_data;
      end
      8'h0e: begin
        out = M_beta_alufn;
      end
      default: begin
        out = 16'hf001;
      end
    endcase
  end
endmodule
