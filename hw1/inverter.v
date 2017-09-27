module inverter (
  input               in,
  output              out
);

  pmos #(2) p_gate (out, 1'b1, in);
  nmos #(1) n_gate (out, 1'b0, in);
  
endmodule
