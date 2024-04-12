//                              					-*- Mode: Verilog -*-
// Fichier : sbox_tb.sv
// Auteur : Elafani Maïssa
// Description : testbench sbox
// Date de création :  

`timescale 1ns/1ps

/*
sbox_tb : testbench du composant sbox
*/
module sbox_tb ();

logic[4:0] sbox_i_s; 
logic[4:0] sbox_o_s;

// Génération du composant sbox
sbox DUT
(
	.sbox_i(sbox_i_s),
	.sbox_o(sbox_o_s)
);

initial
	begin
		sbox_i_s = 5'h00;
		#50;
		sbox_i_s = 5'h01;
		#50;
	end 

endmodule : sbox_tb
