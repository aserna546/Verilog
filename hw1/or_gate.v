module or_gate (
  input a,
  input b,
  output out 
);
  wire s1;
  wire comb;
  pmos #(2) p_gate (s1, 1'b1, a);
  pmos #(2) p_gate2 (comb, s1, b);
  nmos #(1) n_gate (comb, 1'b0, b);
  nmos #(1) n_gate2 (comb, 1'b0, a);
  inverter not_gate (comb, out);

endmodule // 