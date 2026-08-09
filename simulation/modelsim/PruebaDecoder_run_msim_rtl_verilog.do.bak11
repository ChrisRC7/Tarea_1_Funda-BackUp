transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder {C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder/DecoderToBcd.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder {C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder/BcdTo7Segment.sv}
vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder {C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder/TopLevel.sv}

vlog -sv -work work +incdir+C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder {C:/Users/YITAN/OneDrive/Escritorio/TDD_Docs_II2024/jtenorio_aflores_klobo_digital_design_lab_2024-master/Laboratorio_1/TDD_P1_Decoder/TopLevel_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TopLevel_tb

add wave *
view structure
view signals
run -all
