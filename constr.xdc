
set_property PACKAGE_PIN P18 [get_ports {outt[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {outt[1]}]

set_property PACKAGE_PIN R18 [get_ports {outt[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {outt[0]}]

set_property PACKAGE_PIN M19 [get_ports {outt2[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {outt2[1]}]

set_property PACKAGE_PIN L17 [get_ports {outt2[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {outt2[0]}]


set_property PACKAGE_PIN U16 [get_ports {EYESAW}]					
set_property IOSTANDARD LVCMOS33 [get_ports {EYESAW}]
	
set_property PACKAGE_PIN W5 [get_ports CLK]							
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

set_property PACKAGE_PIN K17 [get_ports {TRIGGER}]					
set_property IOSTANDARD LVCMOS33 [get_ports {TRIGGER}]

set_property PACKAGE_PIN M18 [get_ports {ECHO}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ECHO}]




	
	

set_property PACKAGE_PIN L1 [get_ports {EYESAW2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {EYESAW2}]

set_property PACKAGE_PIN A17 [get_ports {TRIGGER2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {TRIGGER2}]

set_property PACKAGE_PIN A14 [get_ports {ECHO2}]					
set_property IOSTANDARD LVCMOS33 [get_ports {ECHO2}]
