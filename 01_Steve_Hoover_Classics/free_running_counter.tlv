\m4_TLV_version 1d: tl-x.org
\SV
   
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   // If reset is 1, output 0. Otherwise, take the previous value and add 1.
   $cnt[7:0] = $reset ? 8'b0 : >>1$cnt + 8'b1;
   
   
   *passed = *cyc_cnt > 40;
\SV
   endmodule
