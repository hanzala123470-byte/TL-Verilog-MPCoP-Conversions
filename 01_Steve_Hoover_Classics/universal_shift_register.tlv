\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   $ctrl[1:0] = *cyc_cnt[2:1];
   $load_val[3:0] = *cyc_cnt[7:4];
   $serial_in = *cyc_cnt[3];
   
   $sr[3:0] = $reset ? 4'b0000 :
              ($ctrl == 2'b11) ? $load_val :
              ($ctrl == 2'b01) ? {>>1$sr[2:0], $serial_in} :
              ($ctrl == 2'b10) ? {$serial_in, >>1$sr[3:1]} :
                                 >>1$sr;
                                 
   *passed = *cyc_cnt > 40;
\SV
   endmodule
