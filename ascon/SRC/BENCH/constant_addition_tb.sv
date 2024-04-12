//                              					-*- Mode: Verilog -*-
// Fichier : constant_addition_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench de constant_adddition
// Date de création :  

`timescale 1ns/1ps

/*
constant_addition_tb : testbench du module constant addition
*/
module constant_addition_tb ();
import ascon_pack::*;

type_state constant_add_i_s; 
logic[3:0] round_s;
type_state constant_add_o_s;

// Généeation du composant constant_addition
constant_addition DUT
(
	.constant_add_i(constant_add_i_s),
	.round_i(round_s),
	.constant_add_o(constant_add_o_s)
);

initial
	begin	
		round_s = 0;
		// État S initial
		constant_add_i_s[0] = 64'h80400c0600000000;
		constant_add_i_s[1] = 64'h0001020304050607;
		constant_add_i_s[2] = 64'h08090a0b0c0d0e0f;
		constant_add_i_s[3] = 64'h0011223344556677;
		constant_add_i_s[4] = 64'h8899aabbccddeeff;
		#50;
	end

endmodule : constant_addition_tb
