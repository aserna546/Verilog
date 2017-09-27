module nand_gate_tb_loop;

  reg a, b;
  wire c;
  nand_gate g (a, b, c);

  reg expected_c;

  integer i, j;

  initial begin
    a = 0;
    b = 0;

    #10

    for(i = 0; i <= 1; i = i + 1)
    begin
    	for (j = 0; j <= 1; j = j + 1)
    	begin
    		a = i;
    		b = j;
    		expected_c = i ~& j;
    		#1;
    		$display("a: %d, b: %d, c: %d", a, b, c);
    		if (expected_c !== c)
    		begin
    			$display("ERROR: Expected: %d, Got: %d", expected_c, c);
    		end
    	end
    end
  end

endmodule
