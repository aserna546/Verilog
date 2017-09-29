module bit1_multiplier (
  input a,
  input b,
  output c
);
  and (c, a, b);
endmodule // 1bit_multiplier