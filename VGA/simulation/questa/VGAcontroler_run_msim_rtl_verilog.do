transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/tic_tac_toe_game.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/fsm_controller.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/winner_detector.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/winner_detect_3.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/position_registers.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/position_decoder.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/nospace_detector.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/illegal_move_detector.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/video_controller.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/vertical_counter.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/sram.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/horizontal_counter.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/clock_divider.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/VGAcontroler.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/selector.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/contador.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/timer.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/timer_30_sec.sv}
vlog -sv -work work +incdir+/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1 {/home/ridivi/intelFPGA_lite/22.1std/Projects/VGA_1/mark_new_position.sv}

