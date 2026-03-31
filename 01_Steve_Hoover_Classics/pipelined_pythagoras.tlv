\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   |calc
      @1
         $aa[3:0] = *cyc_cnt[3:0];
         $bb[3:0] = 4'd5;
         
         $aa_sq[7:0] = $aa * $aa;
         $bb_sq[7:0] = $bb * $bb;
      @2
         $cc_sq[8:0] = $aa_sq + $bb_sq;
         
   *passed = *cyc_cnt > 40;
\SV
   endmodule
