onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider CONST
add wave -noupdate /xor_up_tb/xor_data_i_s
add wave -noupdate /xor_up_tb/xor_key_i_s
add wave -noupdate -divider {MODE XOR}
add wave -noupdate /xor_up_tb/etat_s
add wave -noupdate -divider INPUT
add wave -noupdate /xor_up_tb/xor_i_s
add wave -noupdate -divider OUTPUT
add wave -noupdate /xor_up_tb/xor_o_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {9050 ps} {10050 ps}
