\m4_TLV_version 1d: tl-x.org
\SV
   // Macro to instantiate the Makerchip simulation environment
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   // Steve's classic 1-liner counter using the '>>1' (previous state) operator
   // If reset is 1, output 0. Otherwise, take the previous value and add 1.
   $cnt[7:0] = $reset ? 8'b0 : >>1$cnt + 8'b1;
   
   
   *passed = *cyc_cnt > 40;
\SV
   endmodule
