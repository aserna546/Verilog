module adder_tb;

  localparam integer IN_WIDTH = 4;
  localparam integer OUT_WIDTH = IN_WIDTH + 1;

  reg  [ IN_WIDTH     -1 : 0 ] a;
  reg  [ IN_WIDTH     -1 : 0 ] b;
  wire [ OUT_WIDTH    -1 : 0 ] out;
  reg  [ OUT_WIDTH    -1 : 0 ] exp_out;

  integer i, j;

  initial begin
    a = 0;
    b = 0;
    for (i=0; i<(1<<IN_WIDTH); i=i+1)
    begin
      for (j=0; j<(1<<IN_WIDTH); j=j+1)
      begin
        a = i;
        b = j;
        exp_out = a + b;
        #1
        $display("a: %d, b: %d, out: %h", a, b, out);
        if (exp_out !== out) begin
          $display("ERROR: Expected output: %d, Actual output: %d", exp_out, out);
          $finish;
        end
      end
    end
  end

  adder #(IN_WIDTH) add_inst (a, b, out);

endmodule
