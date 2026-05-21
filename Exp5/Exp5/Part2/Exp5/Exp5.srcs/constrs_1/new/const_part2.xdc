
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]


set_property PACKAGE_PIN P16 [get_ports Set]
set_property IOSTANDARD LVCMOS18 [get_ports Set]


set_property PACKAGE_PIN F22 [get_ports {TimerDigit0[0]}]
set_property PACKAGE_PIN G22 [get_ports {TimerDigit0[1]}]
set_property PACKAGE_PIN H22 [get_ports {TimerDigit0[2]}]
set_property PACKAGE_PIN F21 [get_ports {TimerDigit0[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit0[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit0[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit0[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit0[0]}]


set_property PACKAGE_PIN H19 [get_ports {TimerDigit1[0]}]
set_property PACKAGE_PIN H18 [get_ports {TimerDigit1[1]}]
set_property PACKAGE_PIN H17 [get_ports {TimerDigit1[2]}]
set_property PACKAGE_PIN M15 [get_ports {TimerDigit1[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit1[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit1[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit1[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {TimerDigit1[0]}]


set_property PACKAGE_PIN Y11 [get_ports {LCDData[0]}]
set_property PACKAGE_PIN AA11 [get_ports {LCDData[1]}]
set_property PACKAGE_PIN Y10 [get_ports {LCDData[2]}]
set_property PACKAGE_PIN AA9 [get_ports {LCDData[3]}]
set_property PACKAGE_PIN AB11 [get_ports {LCDData[4]}]
set_property PACKAGE_PIN AB10 [get_ports {LCDData[5]}]
set_property PACKAGE_PIN AB9 [get_ports {LCDData[6]}]
set_property PACKAGE_PIN AA8 [get_ports {LCDData[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LCDData[0]}]


set_property PACKAGE_PIN V12 [get_ports LCDRS]
set_property PACKAGE_PIN W10 [get_ports LCDRW]
set_property PACKAGE_PIN V9 [get_ports LCDE]
set_property IOSTANDARD LVCMOS33 [get_ports LCDE]
set_property IOSTANDARD LVCMOS33 [get_ports LCDRW]
set_property IOSTANDARD LVCMOS33 [get_ports LCDRS]