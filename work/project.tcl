set projDir "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/vivado"
set projName "stackergame_latest"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/au_top_0.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/reset_conditioner_1.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/multi_seven_seg_2.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/cu_test_3.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/edge_detector_4.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/button_conditioner_5.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/counter_6.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/seven_seg_7.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/decoder_8.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/game_beta_9.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/matrix_writer_10.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/pipeline_11.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/alu_12.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/game_CU_13.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/game_miniRegfiles_14.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/counter_15.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/adder_16.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/boolean_17.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/shifter_18.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/compare_19.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/sixteen_bit_multiplier_20.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/counter_21.v" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/verilog/counter_22.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/constraint/alchitry.xdc" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/constraint/au.xdc" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/constraint/custom.xdc" "C:/Users/cajhm/OneDrive\ -\ Singapore\ University\ of\ Technology\ and\ Design/Y2T4/compstruct1d/stackergame_latest/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
