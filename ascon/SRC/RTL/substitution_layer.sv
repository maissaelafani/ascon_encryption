//                              					-*- Mode: Verilog -*-
// Fichier : substitusion_layer.sv
// Auteur : Elafani Maïssa
// Description : création module
// Date de création :  

`timescale 1ns/1ps 

/*
substitution_layer : Subsitute l'ensemble de l'état S en prenant à chaque fois
					 un vecteur [x0(i),x1(i),x2(i),x2(i),x4(i)] , 0 <= i <= 64

:input substitution_i : État S de 5 registres de 64 bits
:output sbox_o : État S en sortie
*/

module substitution_layer import ascon_pack::*;
(
	input  type_state substitution_i,
	output type_state substitution_o
);

genvar i;

generate 
// Création de 64 sbox concurrentes pour substituer l'ensemble des colonnes de l'État S en un coup
	for (i=0; i<64; i=i+1) 
		begin : gen_sbox
		// Création du composant sbox
			sbox sbox_u
			(
				.sbox_i({substitution_i[0][i], 
						 substitution_i[1][i], 
						 substitution_i[2][i], 
						 substitution_i[3][i], 
						 substitution_i[4][i]}),

				.sbox_o({substitution_o[0][i], 
					     substitution_o[1][i], 
					     substitution_o[2][i], 
					     substitution_o[3][i], 
					     substitution_o[4][i]})
			);
		end : gen_sbox

endgenerate

endmodule : substitution_layer
