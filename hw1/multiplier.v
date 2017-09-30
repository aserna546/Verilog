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
  assign out[2] = add1[0];
  assign out[OUT_WIDTH - 1 : 3] = addW2[IN_WIDTH : 0];
  //wire [IN_WIDTH * IN_WIDTH - 2 : 0] adderW; 
  genvar j;
  // j is counter for number of b bits to individually multiply an A bit
  generate
  multW[IN_WIDTH - 1] = 1'b0;
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
      bit1_multiplier and2 (a[1], b[j], multW2[j]);
      bit1_multiplier and3 (a[2], b[j], multW3[j]);
      bit1_multiplier and4 (a[3], b[j], multW4[j]);
    end
  end
  adder #(IN_WIDTH) add_instant (multW, multW1, addW) ;
  adder #(IN_WIDTH) add_instant (addW, multW2, addW1) ;
  adder #(IN_WIDTH) add_instant (addW1, multW3, addW2) ;

  /*
    for (i=0; i < IN_WIDTH; i=i+1) begin
      if (i == 0) begin
        for (j=0; j < IN_WIDTH; j=j+1) begin
          n = j;
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
          n = n + 1;
          bit1_multiplier and1 (a[i], b[j], multW[n]);
        end
        // adding the partial products of the multiplaction.
        if (i == 1) begin
          adder #(IN_WIDTH) add_instant (multW[IN_WIDTH-1:0], multW[n:IN_WIDTH], adderW[IN_WIDTH:0]);
          out[i] = adderW[i - 1];
          if (i == IN_WIDTH - 1) begin // for 2 bit multiply
            out[OUT_WIDTH - 1 : i + 1] = adderW[IN_WIDTH:1];
          end
        end 
        else begin
          adder #(IN_WIDTH) add_instant (adderW[index + IN_WIDTH - 1 : index], multW[n : n - IN_WIDTH + 1], adderW[index + OUT_WIDTH : index + IN_WIDTH]);
          if (i == IN_WIDTH - 1) begin
            index = index + IN_WIDTH;
            out[OUT_WIDTH - 1 : i] = adderW[index - 2 : index];
          end
          else begin
            index = index + IN_WIDTH + 1;
            out[i] = adderW[index - 1];
          
        end
      end
      bit1_multiplier and1 ();
    end
  endgenerate
  
*/
endmodule // 4bit_multiplier