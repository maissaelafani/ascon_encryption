//                              					-*- Mode: Verilog -*-
// Fichier : constant_addition.sv
// Auteur : Elafani Maïssa
// Description : création module
// Date de création :  

`timescale 1ns/1ps

/*
constant_addition : ajoute une constante ronde au registre x2 en fonction de ronde_i

:input constant_add_i : État S sur 5 registres de 64 bits 
:input round_i : ronde i sur 4 bits, 0 <= ronde <= 11 
:output constant_add_o : État S en sortie 
*/
module constant_addition 
import ascon_pack::*;
(
	input  type_state  constant_add_i,
	input  logic[3:0]  round_i,
	output type_state  constant_add_o
);

	assign constant_add_o[0]       =  constant_add_i[0];
	assign constant_add_o[1]       =  constant_add_i[1];
	assign constant_add_o[2][7:0]  =  constant_add_i[2][7:0] ^ round_constant[round_i];
	assign constant_add_o[2][63:8] =  constant_add_i[2][63:8];
	assign constant_add_o[3]       =  constant_add_i[3];
	assign constant_add_o[4]       =  constant_add_i[4];

endmodule : constant_addition
