//
// Adder
// Implements: out = a + b
//
// Hardik Sharma
// (hsharma@gatech.edu)

module adder #(
  parameter integer IN_WIDTH              = 4,
  parameter integer OUT_WIDTH             = IN_WIDTH + 1
) (
  input  wire        [ IN_WIDTH   -1 : 0 ] a,
  input  wire        [ IN_WIDTH   -1 : 0 ] b,
  output wire        [ OUT_WIDTH  -1 : 0 ] out
);

  // assign out = a + b;

  wire [IN_WIDTH-1:0] carry;
  assign out[OUT_WIDTH-1] = carry[IN_WIDTH-1];

  genvar i;
  generate
    for (i=0; i<IN_WIDTH; i=i+1)
    begin
      if (i == 0)
      begin
        half_adder ha (a[0], b[0], out[0], carry[0]);
      end
      else
      begin
        full_adder fa (a[i], b[i], carry[i-1], out[i], carry[i]);
      end
    end
  endgenerate

endmodule
