`timescale 1ns/1ps

module fsm import ascon_pack::*;
( 
	input logic clock_i,
	input logic resetb_i,
	input logic start_i,
	input logic data_valid_i, 
	input logic[3:0] round_i,
	input logic[1:0] block_i,
	output logic cipher_valid_o,
	output logic end_o,
	output logic enable_o,
	output logic init_a_o,
	output logic init_b_o,
	output logic enable_block_o, 
	output logic init_block_o,
	output 
