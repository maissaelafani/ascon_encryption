//                              					-*- Mode: Verilog -*-
// Fichier : dff_128.sv
// Auteur : Elafani Maïssa
// Description : création module
// Date de création 

`timescale 1ns/1ps

module dff_128 
(
	input  logic[127:0] d_i, 
	input  logic clock_i, 
	input  logic resetb_i,
	input  logic enable_i,
	output logic[127:0] q_o
);

always_ff @(posedge clock_i or negedge resetb_i)
	begin : seq_0
		if (resetb_i == 0)
			q_o <= {64'h0, 64'h0, 64'h0, 64'h0};
		else if (enable_i == 1)
			q_o <= d_i;
	end : seq_0

endmodule : dff_128

