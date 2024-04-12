//                              					-*- Mode: Verilog -*-
// Fichier : permutation_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench permutation
// Date de création :  

`timescale 1ns/1ps

/*
permutation_tb : testbench composant permuation
*/
import ascon_pack::*;
module permutation_tb ();
		
logic clock_s; 
logic resetb_s; 
logic select_s;
type_state permutation_i_s;
logic[3:0] round_s;
type_state permutation_o_s;
logic enable_s;

// Génération composant 
permutation DUT
(
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.select_i (select_s),
	.permutation_i(permutation_i_s),
	.permutation_o(permutation_o_s),
	.round_i(round_s),
	.enable_i(enable_s)
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
	#1200;
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

//ronde 
initial
begin
	round_s = 0;
	#100;
	round_s = 1;
	#100;
	round_s = 2;
	#100;
	round_s = 3;
	#100;
	round_s = 4;
	#100;
	round_s = 5;
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
	permutation_i_s[0] = 64'h80400c0600000000;
	permutation_i_s[1] = 64'h0001020304050607;
	permutation_i_s[2] = 64'h08090a0b0c0d0e0f;
	permutation_i_s[3] = 64'h0011223344556677;
	permutation_i_s[4] = 64'h8899aabbccddeeff;
end 

endmodule : permutation_tb	
	
