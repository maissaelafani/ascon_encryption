//                              					-*- Mode: Verilog -*-
// Fichier : permutation_final_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench permutation_final
// Date de création :  

`timescale 1ns/1ps

/*
permutation_final_tb : testbench composant permuation_final
*/
import ascon_pack::*;
module permutation_final_tb ();
		
logic clock_s; 
logic resetb_s; 
logic select_s;
type_state permutation_i_s;
logic[3:0] round_s;
type_state permutation_o_s;
logic enable_s;
logic[127:0] xor_key_i_s;
logic[63:0]  xor_data_i_s;
logic[1:0]   etat_up_i_s;
logic[1:0]   etat_down_i_s;
logic enable_cipher_s;
logic enable_tag_s;
logic[63:0] sortie_cipher_s;
logic[127:0] sortie_tag_s;


// Génération composant 
permutation_final DUT
(
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.select_i (select_s),
	.permutation_i(permutation_i_s),
	.permutation_o(permutation_o_s),
	.round_i(round_s),
	.enable_i(enable_s),
	.xor_key_i(xor_key_i_s),
	.xor_data_i(xor_data_i_s),
	.etat_up_i(etat_up_i_s),
	.etat_down_i(etat_down_i_s),
	.enable_cipher(enable_cipher_s),
	.enable_tag(enable_tag_s),
	.sortie_cipher(sortie_cipher_s),
	.sortie_tag(sortie_ta)
);

// Génerer la clock
initial
begin 
	clock_s = 0;
	forever #50 clock_s = ~clock_s;
end

// Signal enable_s
initial 
begin 
	enable_s = 1;
	#1800;
	enable_s = 0;
end

// signal de reset
initial
begin
	resetb_s = 0;
	#25;
	resetb_s = 1;
end

// signal select
initial
begin
	select_s = 1;
	#100;
	select_s = 0;
end

//xor_up
initial
begin
	etat_up_i_s = 1;
	#100;
	etat_up_i_s = 0;
	#500;
	etat_up_i_s = 1;
	#100; 
	etat_up_i_s = 0;
	#500;
	etat_up_i_s = 1;
	#100;
	etat_up_i_s = 0;
	#500;
	etat_up_i_s = 1;
	#100;
end

//xor_down
initial
begin
	etat_down_i_s = 0;
end

//ronde 
initial
begin
	round_s = 6;
	#100;
	round_s = 7;
	#100;
	round_s = 8;
	#100;
	round_s = 9;
	#100;
	round_s = 10;
	#100;
	round_s = 11;
	#100;
	round_s = 6;
	#100;
	round_s = 7;
	#100;
	round_s = 8;
	#100;
	round_s = 9;
	#100;
	round_s = 10;
	#100;
	round_s = 11;
	#100;
	round_s = 6;
	#100;
	round_s = 7;
	#100;
	round_s = 8;
	#100;
	round_s = 9;
	#100;
	round_s = 10;
	#100;
	round_s = 11;
	#100;
end

// Initialisation état S
initial 
begin
	//clé
	xor_key_i_s = {128'h000102030405060708090A0B0C0D0E0F};
	//données associés
	xor_data_i_s = {64'h3230323380000000};
	// État S initial
	permutation_i_s[0] = 64'h4608da0e76fcee25;
	permutation_i_s[1] = 64'h876f2d998dd3ed21;
	permutation_i_s[2] = 64'h5d5b8b59b7ac16ee;
	permutation_i_s[3] = 64'he23c656f97f63dc8;
	permutation_i_s[4] = 64'h3e09499302483746;
end 

//Message à chiffrer
initial
begin
	xor_data_i_s = 64'h436F6E636576657A;
	#600;
	xor_data_i_s = 64'h204153434F4E2065;
	#600;
	xor_data_i_s = 64'h6E2053797374656D;
	#600;
	xor_data_i_s = 64'h566572696C6F6780;
end

//Etzt dff cipher
initial
begin
	enable_cipher_s = 1;
	#100
	enable_cipher_s = 0;
	#500;
	enable_cipher_s = 1;
	#100
	enable_cipher_s = 0;
	#500
	enable_cipher_s = 1;
	#100
	enable_cipher_s = 0;
	#500
	enable_cipher_s = 1;
	#100
	enable_cipher_s = 0;

end
endmodule : permutation_final_tb
	
