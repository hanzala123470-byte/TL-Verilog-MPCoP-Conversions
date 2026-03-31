\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;

   |dot_product
      @1
         $x1[7:0] = *cyc_cnt[7:0];
         $y1[7:0] = 8'd2;
         $x2[7:0] = *cyc_cnt[7:0] + 8'd1;
         $y2[7:0] = 8'd3;

         $p1[15:0] = $x1 * $y1;
         $p2[15:0] = $x2 * $y2;
      @2
         $dot_out[16:0] = $p1 + $p2;

   *passed = *cyc_cnt > 40;
\SV
   endmodule
