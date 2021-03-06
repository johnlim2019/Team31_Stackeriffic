/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    input reset,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input playerin,
    input [23:0] io_dip,
    output reg [7:0] outgnd,
    output reg [7:0] outled
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [15:0] M_gamestate_d, M_gamestate_q = 1'h0;
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_2 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [3-1:0] M_cu_test_readSpead;
  wire [16-1:0] M_cu_test_out;
  wire [16-1:0] M_cu_test_state_number;
  wire [8-1:0] M_cu_test_outledhigh;
  wire [8-1:0] M_cu_test_outledlow;
  reg [1-1:0] M_cu_test_button;
  reg [8-1:0] M_cu_test_selector;
  reg [1-1:0] M_cu_test_updateSpeed;
  reg [3-1:0] M_cu_test_speedSel;
  cu_test_3 cu_test (
    .clk(clk),
    .rst(rst),
    .button(M_cu_test_button),
    .selector(M_cu_test_selector),
    .updateSpeed(M_cu_test_updateSpeed),
    .speedSel(M_cu_test_speedSel),
    .readSpead(M_cu_test_readSpead),
    .out(M_cu_test_out),
    .state_number(M_cu_test_state_number),
    .outledhigh(M_cu_test_outledhigh),
    .outledlow(M_cu_test_outledlow)
  );
  wire [1-1:0] M_buttondetect_out;
  reg [1-1:0] M_buttondetect_in;
  edge_detector_4 buttondetect (
    .clk(clk),
    .in(M_buttondetect_in),
    .out(M_buttondetect_out)
  );
  wire [1-1:0] M_debugdetect_out;
  reg [1-1:0] M_debugdetect_in;
  edge_detector_4 debugdetect (
    .clk(clk),
    .in(M_debugdetect_in),
    .out(M_debugdetect_out)
  );
  wire [1-1:0] M_btn_cond_out;
  reg [1-1:0] M_btn_cond_in;
  button_conditioner_5 btn_cond (
    .clk(clk),
    .in(M_btn_cond_in),
    .out(M_btn_cond_out)
  );
  wire [1-1:0] M_debug_cond_out;
  reg [1-1:0] M_debug_cond_in;
  button_conditioner_5 debug_cond (
    .clk(clk),
    .in(M_debug_cond_in),
    .out(M_debug_cond_out)
  );
  
  always @* begin
    M_gamestate_d = M_gamestate_q;
    
    M_reset_cond_in = reset;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    outgnd = M_cu_test_outledlow;
    outled = M_cu_test_outledhigh;
    M_debug_cond_in = io_button[1+0-:1];
    M_cu_test_speedSel = io_dip[16+0+7-:8];
    M_debugdetect_in = M_debug_cond_out;
    M_cu_test_updateSpeed = M_debugdetect_out;
    io_led[16+7+0-:1] = M_debugdetect_out;
    io_led[16+0+4-:5] = M_cu_test_readSpead;
    M_btn_cond_in = playerin;
    M_buttondetect_in = M_btn_cond_out;
    M_cu_test_button = M_buttondetect_out;
    M_gamestate_d = M_cu_test_out;
    M_cu_test_selector = io_dip[0+7-:8];
    io_led[8+0+7-:8] = M_cu_test_state_number[0+7-:8];
    M_seg_values = {M_gamestate_q[12+3-:4], M_gamestate_q[8+3-:4], M_gamestate_q[4+3-:4], M_gamestate_q[0+3-:4]};
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_gamestate_q <= 1'h0;
    end else begin
      M_gamestate_q <= M_gamestate_d;
    end
  end
  
endmodule
