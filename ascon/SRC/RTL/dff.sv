`timescale 1ns/1ps

module dff 
(
	input  type_state d_i, 
	input  logic clock_i, resetb_i,
	output logic q_o
);

always_ff @(posedge clock_i or negedge resetb_i)
	begin : seq_0
		if (resetb_i == 0)
			q_o <= {64'h0, 64'h0, 64'h0, 64'h0};
		else 
			q_o <= d_i;
	end : seq_0

endmodule : dff

