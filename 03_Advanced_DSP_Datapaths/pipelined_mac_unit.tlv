\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;

   |mac
      @1
         $a[7:0] = *cyc_cnt[7:0];
         $b[7:0] = 8'd3;
         
         $mult[15:0] = $a * $b;
      @2
         $accum[15:0] = $reset ? 16'b0 : >>1$accum + $mult;

   *passed = *cyc_cnt > 40;
\SV
   endmodule
