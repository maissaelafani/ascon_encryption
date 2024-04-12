`timescale 1ns/1ps

module cpt_round_tb import ascon_pack::*;
();

	logic clock_s;
	logic resetb_s;
	logic enable_s;
	logic init_a_s;
	logic init_b_s;
	logic counter_s;

cpt_round DUT
(
	. clock_i(clock_s),
	. resetb_i(resetb

