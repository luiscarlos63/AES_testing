`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2023 11:17:41 AM
// Design Name: 
// Module Name: fifo_buff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module synchronous_fifo #(parameter DEPTH=8, DATA_WIDTH=8, THRESHOLD = 0) (
   clk, 
   rst_n,
   w_en,
   r_en,
   data_in,
   data_out,
   full_out, 
   empty,
   threshold_reached
);

  input wire clk; 
  input wire rst_n;
  input wire w_en;
  input wire r_en;
  input wire [DATA_WIDTH-1:0] data_in;
  output reg [DATA_WIDTH-1:0] data_out;
  output wire full_out;
  output wire empty;
  output wire threshold_reached;



    wire full;
  reg [$clog2(DEPTH)-1:0] w_ptr, r_ptr;
  reg [DATA_WIDTH-1:0] fifo[DEPTH-1:0];
  
  // Set Default values on reset.
  always@(posedge clk) begin
    if(!rst_n) begin
      w_ptr <= 0; r_ptr <= 0;
      data_out <= 0;
    end
  
  // To write data to FIFO
    if(w_en & !full)begin
      fifo[w_ptr] <= data_in;
      w_ptr <= w_ptr + 1;
    end
  
  // To read data from FIFO
    if(r_en & !empty) begin
      data_out <= fifo[r_ptr];
      r_ptr <= r_ptr + 1;
    end
  end
  
  assign full               = ((w_ptr+1'b1) == r_ptr);
  assign full_out           = ((w_ptr+1'b1) == r_ptr);
  assign empty              = (w_ptr == r_ptr);
  assign threshold_reached  = ((w_ptr + (DEPTH - r_ptr)) % DEPTH) <= (THRESHOLD - 1);

endmodule
