module xor (
  input a,
  input b,
  output out
);
  wire notA;
  wire notB;
  wire orA;
  wire orB;
  // not a and not b
  inverter not_gate (a, notA);
  inverter not_gate2 (b, notB);

  // ~A and B
  and_gate and1 (notA, b, orA);
  // ~B and A
  and_gate and2 (notB, a, orB);
  
  // (~A and B) or (~B and A)
  or_gate or1 (orA, orB, out); 
endmodule // 