# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\Mwehler2\385\ece385-lab6\lab6\sdk\blinker_system\_ide\scripts\debugger_blinker-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\Mwehler2\385\ece385-lab6\lab6\sdk\blinker_system\_ide\scripts\debugger_blinker-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "RealDigital Boo 887100000001A" && level==0 && jtag_device_ctx=="jsn1-0362f093-0"}
fpga -file C:/Users/Mwehler2/385/ece385-lab6/lab6/sdk/blinker/_ide/bitstream/mb_intro_top.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "RealDigital Boo 887100000001A" && jtag_device_ctx=="jsn1-0362f093-0"}
loadhw -hw C:/Users/Mwehler2/385/ece385-lab6/lab6/mb_intro_top.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "RealDigital Boo 887100000001A" && jtag_device_ctx=="jsn1-0362f093-0"}
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "RealDigital Boo 887100000001A" && jtag_device_ctx=="jsn1-0362f093-0"}
dow C:/Users/Mwehler2/385/ece385-lab6/lab6/sdk/blinker/Debug/blinker.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "RealDigital Boo 887100000001A" && jtag_device_ctx=="jsn1-0362f093-0"}
con
