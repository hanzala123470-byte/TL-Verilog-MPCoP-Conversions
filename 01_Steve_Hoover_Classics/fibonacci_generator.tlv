\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   // Generates the Fibonacci sequence: 1, 1, 2, 3, 5, 8...
   
   $fib[15:0] = $reset ? 16'b1 : (>>1$fib + >>2$fib);
   
   *passed = *cyc_cnt > 40;
\SV
   endmodule
