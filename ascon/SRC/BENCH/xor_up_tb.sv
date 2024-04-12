//                              					-*- Mode: Verilog -*-
// Fichier : xor_up_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench xor_up
// Date de création : 

`timescale 1ns/1ps

/*
xor_up_tb : testbench du composant xor_up
*/
import ascon_pack::*;
module xor_up_tb ();

logic[127:0] xor_key_i_s;
logic[63:0]  xor_data_i_s;
type_state   xor_i_s; 
type_state   xor_o_s;
logic[1:0]   etat_s;

// Génération composant
xor_up DUT  
(
	.xor_i(xor_i_s),
	.xor_o(xor_o_s),
	.etat_i(etat_s),
	.xor_key_i(xor_key_i_s),
	.xor_data_i(xor_data_i_s)
);
 
initial
begin 
	// Clé
	xor_key_i_s = {128'h000102030405060708090A0B0C0D0E0F};	
	// Données
	xor_data_i_s = {64'h3230323380000000};
	// État initial S
	xor_i_s[0] = 64'h1b1354db77e0dbb4;
	xor_i_s[1] = 64'h6f140401cfa0873c;
	xor_i_s[2] = 64'hd7e8abaf45f2885a;
	xor_i_s[3] = 64'hc0c5777fa661625e;
	xor_i_s[4] = 64'hfc4374d28210928c;
	// Mode xor_up
	etat_s = 1;
	#10;
	
end

endmodule : xor_up_tb
