module nand_gate (
  input   a,
  input   b,
  output  c
);

  // nand (output, input0, input1);
  nand (c, a, b);

endmodule
