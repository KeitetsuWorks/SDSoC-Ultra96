set_property PFM_NAME "keitetsu:ultra96:ultra96:1.0" \
[get_files ./ultra96/ultra96.srcs/sources_1/bd/ultra96/ultra96.bd]

set_property PFM.CLOCK { \
clk_out1 {id "0" is_default "true" proc_sys_reset "proc_sys_reset_0" } \
clk_out2 {id "1" is_default "false" proc_sys_reset "proc_sys_reset_1" } \
clk_out3 {id "2" is_default "false" proc_sys_reset "proc_sys_reset_2" } \
clk_out4 {id "3" is_default "false" proc_sys_reset "proc_sys_reset_3" } \
} [get_bd_cells /clk_wiz_0]

set_property PFM.AXI_PORT { \
M_AXI_HPM0_FPD {memport "M_AXI_GP"} \
M_AXI_HPM1_FPD {memport "M_AXI_GP"} \
M_AXI_HPM0_LPD {memport "M_AXI_GP"} \
S_AXI_HPC0_FPD {memport "S_AXI_HPC" sptag "HPC0"} \
S_AXI_HPC1_FPD {memport "S_AXI_HPC" sptag "HPC1"} \
S_AXI_HP0_FPD {memport "S_AXI_HP" sptag "HP0"} \
S_AXI_HP1_FPD {memport "S_AXI_HP" sptag "HP1"} \
} [get_bd_cells /zynq_ultra_ps_e_0]

set intVar []
for {set i 0} {$i < 8} {incr i} {
    lappend intVar In$i {}
}
set_property PFM.IRQ $intVar [get_bd_cells /xlconcat_0]

generate_target all [get_files ./ultra96/ultra96.srcs/sources_1/bd/ultra96/ultra96.bd]

write_dsa ./ultra96/ultra96.dsa -force

