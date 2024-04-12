//                              					-*- Mode: Verilog -*-
// Fichier : substitusion_layer_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench substitusion_layer
// Date de création : 

`timescale 1ns/1ps

/*
substitution_layer_tb : testbench du composant substitution_layer
*/
import ascon_pack::*;
module substitution_layer_tb ();

type_state substitution_i_s; 
type_state substitution_o_s;

// Génération composant 
substitution_layer DUT 
(
	.substitution_i(substitution_i_s),
	.substitution_o(substitution_o_s)
);

initial
begin
	substitution_i_s[0] = 64'h80400c0600000000;
	substitution_i_s[1] = 64'h0001020304050607;
	substitution_i_s[2] = 64'h08090a0b0c0d0eff;
	substitution_i_s[3] = 64'h0011223344556677;
	substitution_i_s[4] = 64'h8899aabbccddeeff;
end

endmodule : substitution_layer_tb
