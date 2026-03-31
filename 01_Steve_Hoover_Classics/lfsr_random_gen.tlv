\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   $lfsr[3:0] = $reset ? 4'b0001 :
                {>>1$lfsr[2:0], >>1$lfsr[3] ^ >>1$lfsr[2]};
                
   *passed = *cyc_cnt > 40;
\SV
   endmodule
