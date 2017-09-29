module multiplier #(
  parameter integer IN_WIDTH  = 4,
  parameter integer OUT_WIDTH = IN_WIDTH + IN_WIDTH
) (
  input [IN_WIDTH -1 : 0] a,
  input [IN_WIDTH -1 : 0] b,
  output [OUT_WIDTH -1 : 0] out
);
  //wire [IN_WIDTH - 1 : 0] multW, multW1, multW2, multW3;
  wire [IN_WIDTH * IN_WIDTH - 1 : 0] multW;
  //wire [IN_WIDTH - 1 : 0] addW, addW1, addW2;
  wire [IN_WIDTH * IN_WIDTH - 2 : 0] adderW; 
  genvar n, i, j, index;
  // n is counter for # of wires of multiplications outputs.
  // i is counter for number of stages based on number of A bits
  // j is counter for number of b bits to individually multiply an A bit
  generate
    for (i=0; i < IN_WIDTH; i=i+1) begin
      if (i == 0) begin
        for (j=0; j < IN_WIDTH; j=j+1) begin
          n = j + 1;
          if (j == 0) begin
            // First stage of multiplying the first bit 
            // A0 multiply n-bit 
            bit1_multiplier and1 (a[0], b[0], out[0]);
            index = 1; // this the index that will be used to put bits into the output
          end
          else begin
            bit1_multiplier and1 (a[0], b[j], multW[j-1]);
            if (j == IN_WIDTH - 1) begin
              multW[j] = 1'b0;
            end
          end
        end 
      end 
      else begin
        // multiplying the individual bits with b0-b3
        for (j=0 ; j < IN_WIDTH; j=j+1) begin
          bit1_multiplier and1 (a[i], b[j], multW[n]);
          n = n + 1;
        end
        // adding the partial products of the multiplaction.
        adder #(IN_WIDTH) add_instant (multW[IN_WIDTH-1:0], multW[n:IN_WIDTH], adderW[IN_WIDTH:0]);

      end
      bit1_multiplier and1 ();
    end
  endgenerate
  

endmodule // 4bit_multiplier