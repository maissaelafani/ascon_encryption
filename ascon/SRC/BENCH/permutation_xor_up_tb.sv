//                              					-*- Mode: Verilog -*-
// Fichier : permutation_xor_up_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench permutation_xor_up
// Date de création :  

`timescale 1ns/1ps

/*
permutation_tb : testbench composant permuation_xor_up
*/
import ascon_pack::*;
module permutation_xor_up_tb ();
		
logic clock_s; 
logic resetb_s; 
logic select_s;
type_state permutation_i_s;
logic[3:0] round_s;
type_state permutation_o_s;
logic enable_s;
logic[127:0] xor_key_i_s;
logic[63:0]  xor_data_i_s;
logic[1:0]   etat_i_s;

// Génération composant 
permutation_xor_up DUT
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
	.etat_i(etat_i_s)
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
	#600;
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
	etat_i_s = 1;
	#100;
	etat_i_s = 0;
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
end

// Initialisation état S
initial 
begin
	//clé
	xor_key_i_s = {128'h000102030405060708090A0B0C0D0E0F};
	//données associés
	xor_data_i_s = {64'h3230323380000000};
	// État S initial
	permutation_i_s[0] = 64'h1b1354db77e0dbb4;
	permutation_i_s[1] = 64'h6f140401cfa0873c;
	permutation_i_s[2] = 64'hd7e8abaf45f2885a;
	permutation_i_s[3] = 64'hc0c5777fa661625e;
	permutation_i_s[4] = 64'hfc4374d28210928c;
end 

endmodule : permutation_xor_up_tb
	
