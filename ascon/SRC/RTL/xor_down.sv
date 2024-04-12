//                              					-*- Mode: Verilog -*-
// Fichier : xor_down.sv
// Auteur : Elafani Maïssa
// Description : création module
// Date de création :  

`timescale 1ns/1ps

/*
xor_down : composant qui effectue une opération XOR avec une partie partie de 
		de l'état S suivant un signal de contrôle

:input xor_key_i  : Clé de 128 bits
:input xor_i      : État S en etrée du xor
:input etat_i     : Signal de contôle du xor
:output xor_o     : État S en sortie
*/
module xor_down import ascon_pack::*;
(
	input  logic[127:0] xor_key_i,
	input  type_state   xor_i,
	input  logic[1:0]   etat_i,
	output type_state   xor_o
);

always @*
begin
	if (etat_i == 0 && etat_i == 3) 
	//machine éteinte
		begin 
			xor_o = xor_i;
		end
	
	else if (etat_i == 1)  
	//machine allumée et xor avec données
	begin
		xor_o[0] = xor_i[0];
		xor_o[1] = xor_i[1];
		xor_o[2] = xor_i[2];
		xor_o[3] = xor_i[3];
		xor_o[4] = xor_i[4]  ^ {63'b0,1'b1};
	end

	else if (etat_i == 2)
	//machine allumée et  xor avec clé
	begin
		xor_o[0] = xor_i[0];
		xor_o[1] = xor_i[1];
		xor_o[2] = xor_i[2];
		xor_o[3] = xor_i[3] ^ xor_key_i[127:64];
		xor_o[4] = xor_i[4] ^ xor_key_i[63:0];
	end 

	else
	begin
		xor_o = xor_i;
	end

end

endmodule : xor_down

