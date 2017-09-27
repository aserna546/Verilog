module inverter (
  input               in,
  output              out
);

  pmos #(1) p_gate (out, 1'b1, in);
  nmos #(2) n_gate (out, 1'b0, in);
  
endmodule
