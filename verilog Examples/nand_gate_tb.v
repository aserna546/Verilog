module nand_gate_tb;

  reg a, b;
  wire c;
  nand_gate g (a, b, c);

  reg expected_c;

  initial begin
    a = 0;
    b = 0;

    #10

    a = 0;
    b = 0;
    expected_c = 1;
    #1
    $display("a: %d, b: %d, c: %d", a, b, c);
    if (expected_c !== c)
    begin
      $display("ERROR: Expected: %d, Got: %d", expected_c, c);
      $finish;
    end

    a = 0;
    b = 1;
    expected_c = 1;
    #1
    $display("a: %d, b: %d, c: %d", a, b, c);
    if (expected_c !== c)
    begin
      $display("ERROR: Expected: %d, Got: %d", expected_c, c);
      $finish;
    end

    a = 1;
    b = 0;
    expected_c = 1;
    #1
    $display("a: %d, b: %d, c: %d", a, b, c);
    if (expected_c !== c)
    begin
      $display("ERROR: Expected: %d, Got: %d", expected_c, c);
      $finish;
    end

    a = 1;
    b = 1;
    expected_c = 0;
    #1
    $display("a: %d, b: %d, c: %d", a, b, c);
    if (expected_c !== c)
    begin
      $display("ERROR: Expected: %d, Got: %d", expected_c, c);
      $finish;
    end

  end

endmodule
