//                              					-*- Mode: Verilog -*-
// Fichier : permutation_with_xor.sv
// Auteur : Elafani Maïssa
// Description : création module
// Date de création :  

`timescale 1ns/1ps

/*
permutation : - composant capable d'appliquer les 3 permutations à un État donné S
			  - Selection de l'entrée : soit signal exerne soit Etat S en sortie
			  - Le signal en sortie est sauvegardé par une DFF
			  - Ce modèle intègre le composant xor_up

:input  clock_i  : signal de l'horologe système
:input  resetb_i : signal de reset
:input  select_i : signal de contôle entrée 
:input  permutation_i : Etat S en entrée du composant
:input  round_i : ronde sur 4 bits
:input  enable_i : signal de contrôle pour la DFF
:input  xor_key_i : clé de données
:input  xor_data_i : données associeés
:input  etat_i : mode de fonctionnnement du xor
:output permutation_o : État S en sortie
*/
module permutation_xor_up import ascon_pack::*;
(
	input  logic        clock_i, 
	input  logic        resetb_i, 
	input  logic        select_i,
	input  type_state   permutation_i,
	input  logic[3:0]   round_i,
	input  logic        enable_i,
	input  logic[127:0] xor_key_i,
	input  logic[63:0]  xor_data_i,
	input  logic[1:0]   etat_i,
	output type_state   permutation_o
);

// Variables d'état internes
type_state sortie_mux;
type_state sortie_pc;
type_state sortie_ps; 
type_state sortie_pl;
type_state sortie_xor_up;

// Multiplexeur
assign sortie_mux = (select_i) ? permutation_i : permutation_o;

//xor du début
xor_up xor_up_u
(
	.xor_key_i(xor_key_i),
	.xor_data_i(xor_data_i),
	.xor_i(sortie_mux),
	.etat_i(etat_i),
	.xor_o(sortie_xor_up)
);

//PC
constant_addition constant_addition_u
(
	.constant_add_i(sortie_xor_up),
	.round_i(round_i),
	.constant_add_o(sortie_pc)
);

//PS
substitution_layer substitution_layer_u
(
	.substitution_i(sortie_pc),
	.substitution_o(sortie_ps)
);

//PL
diffusion diffusion_u
(
	.diffusion_i(sortie_ps),
	.diffusion_o(sortie_pl)
);

// Bascule D
// si enable==0 bascule D éteinte
always @(posedge clock_i, negedge resetb_i) 
begin

	if (resetb_i == 1'b0 && enable_i==1) 
		begin
			permutation_o <= {64'h0, 64'h0, 64'h0, 64'h0, 64'h0};
		end

	else if (resetb_i == 1'b1 && enable_i==1)
		begin
			permutation_o <= sortie_pl;
		end

end

endmodule : permutation_xor_up		



