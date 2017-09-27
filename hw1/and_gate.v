module and_gate (
  input a,
  input b,
  output out
);
  wire s1; // wire connecting nmos in series
  wire p1; // output of nmos and pmos
  pmos #(2) p_gate (p1, 1'b1, a);
  pmos #(2) p_gate2 (p1, 1'b1, b);
  nmos #(1) n_gate (s1, 1'b0, b);
  nmos #(1) n_gate2 (p1, s1, a);
  inverter not_gate (p1, out);
endmodule // 