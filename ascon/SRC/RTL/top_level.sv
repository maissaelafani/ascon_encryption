`timescale 1ns/1ps

module top_level import ascon_pack::*;

//entrées et sorties
(
	input logic start_i,
	input logic data_valid_i,
	input logic[63:0] data_i,
	input logic[127:0] key_i, 
	input logic[127:0] nonce_i, 
	input logic[3:0] round_i,
	input logic[1:0] block_i,
	output logic cipher_valid_o, 
	output logic end_o, 
	output logic[63:0] cipher_o, 
	output logic [127:0] tag_o,
	output logic init_a_i, 
	output logic init_b_i
);

//idle
if s









//instancier fsm

//compteur de blocs
