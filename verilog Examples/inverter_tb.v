module inverter_tb;

  reg in;
  wire out;

  initial begin
    in = 0;
    #10

    $display("Starting test at time %-2d", $time);

    in = 1;
    $display("*************************************************");
    $display("time: %-2d, Input  = %d", $time, in);
    $display("time: %-2d, Output = %d", $time, out);
    $display("*************************************************");

    #1
    $display("*************************************************");
    $display("time: %-2d, Input  = %d", $time, in);
    $display("time: %-2d, Output = %d", $time, out);
    $display("*************************************************");

    #1
    $display("*************************************************");
    $display("time: %-2d, Input  = %d", $time, in);
    $display("time: %-2d, Output = %d", $time, out);
    $display("*************************************************");

    #1
    in = 0;
    $display("*************************************************");
    $display("time: %-2d, Input  = %d", $time, in);
    $display("time: %-2d, Output = %d", $time, out);
    $display("*************************************************");

    #1
    $display("*************************************************");
    $display("time: %-2d, Input  = %d", $time, in);
    $display("time: %-2d, Output = %d", $time, out);
    $display("*************************************************");

    #1
    $display("*************************************************");
    $display("time: %-2d, Input  = %d", $time, in);
    $display("time: %-2d, Output = %d", $time, out);
    $display("*************************************************");
  end

  inverter inv (in, out);

endmodule
