module multiplier #(
  parameter integer IN_WIDTH  = 4,
  parameter integer OUT_WIDTH = IN_WIDTH + IN_WIDTH
) (
  input [IN_WIDTH -1 : 0] a,
  input [IN_WIDTH -1 : 0] b,
  output [OUT_WIDTH -1 : 0] out
);
  wire [IN_WIDTH - 1 : 0] multW, multW1, multW2, multW3;
  //wire [IN_WIDTH * IN_WIDTH - 1 : 0] multW;
  wire [IN_WIDTH : 0] addW, addW1, addW2;
  assign out[1] = addW[0];
  assign out[2] = addW1[0];
  assign out[OUT_WIDTH - 1 : 3] = addW2[IN_WIDTH : 0];
  assign multW[3] = 1'b0;
  //wire [IN_WIDTH * IN_WIDTH - 2 : 0] adderW; 
  genvar j;
  // j is counter for number of b bits to individually multiply an A bit
  generate
  for (j=0; j < IN_WIDTH; j=j+1) begin
    if (j == 0) begin
    // First stage of multiplying the first bit 
    // A0 multiply n-bit 
      bit1_multiplier and1 (a[0], b[0], out[0]);
      bit1_multiplier and2 (a[1], b[0], multW1[0]);
      bit1_multiplier and3 (a[2], b[0], multW2[0]);
      bit1_multiplier and4 (a[3], b[0], multW3[0]);
    end
    else begin
      bit1_multiplier and1 (a[0], b[j], multW[j-1]);
      bit1_multiplier and2 (a[1], b[j], multW1[j]);
      bit1_multiplier and3 (a[2], b[j], multW2[j]);
      bit1_multiplier and4 (a[3], b[j], multW3[j]);
    end
  end
  endgenerate
  adder #(IN_WIDTH) add_instant (multW[3:0], multW1[3:0], addW[4:0]);
  adder #(IN_WIDTH) add_instant1 (addW[4:1], multW2[3:0], addW1[4:0]);
  adder #(IN_WIDTH) add_instant2 (addW1[4:1], multW3[3:0], addW2[4:0]);
  
*/
endmodule // 4bit_multiplier