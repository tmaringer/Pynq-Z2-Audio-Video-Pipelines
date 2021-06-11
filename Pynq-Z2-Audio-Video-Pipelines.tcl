#*****************************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Pynq-Z2-Audio-Video-Pipelines.tcl: Tcl script for re-creating project 'Pynq-Z2-Audio-Video-Pipelines'
#
# IP Build 3064653 on Wed Nov 18 14:17:31 MST 2020
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_fir.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_gain.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_rectification.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_saturation.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/flipflops.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_echo.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/buffers.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/debounce.vhd" \
   "${origin_dir}/src/rtl/i2s audio/i2s_receiver.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/i2s audio/i2s_transmitter.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/hdmi-overlay/hdmi-overlay.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/cdc.vhd" \
   "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/constrs_1/imports/constr/PYNQ-Z2 v1.0.xdc" \
   "${origin_dir}/src/sim/hdmi_overlay_tb.vhd" \
   "${origin_dir}/C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sim_1/imports/sim/bus_cdc.vhd" \
   "${origin_dir}/src/sim/i2s_receiver_tb.vhd" \
   "${origin_dir}/src/sim/axi_echo_tb.vhd" \
   "${origin_dir}/src/sim/axi_gain_tb.vhd" \
   "${origin_dir}/src/sim/flipflops_tb.vhd" \
   "${origin_dir}/src/sim/axi_fir_tb.vhd" \
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "Pynq-Z2-Audio-Video-Pipelines"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "Pynq-Z2-Audio-Video-Pipelines.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/vivado_project"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} $origin_dir/vivado_project -part xc7z020clg400-1 -quiet -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "tul.com.tw:pynq-z2:part0:1.0" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "platform.board_id" -value "pynq-z2" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "VHDL" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "33" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "33" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "33" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "33" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "33" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "33" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "33" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "264" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_MEMORY" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
if { $obj != {} } {
set_property "ip_repo_paths" "" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_fir.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_gain.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_rectification.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_saturation.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/flipflops.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_echo.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/buffers.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/debounce.vhd"] \
 [file normalize "${origin_dir}/src/rtl/i2s audio/i2s_receiver.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/i2s audio/i2s_transmitter.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/hdmi-overlay/hdmi-overlay.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/cdc.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_fir.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_gain.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_rectification.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_saturation.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/flipflops.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_echo.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/buffers.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/debounce.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/src/rtl/i2s audio/i2s_receiver.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/i2s audio/i2s_transmitter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj
set_property -name "used_in" -value "synthesis" -objects $file_obj
set_property -name "used_in_simulation" -value "0" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/hdmi-overlay/hdmi-overlay.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/cdc.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "design_1_wrapper" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize ${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/constrs_1/imports/constr/PYNQ-Z2 v1.0.xdc]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/constrs_1/imports/constr/PYNQ-Z2 v1.0.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
set files [list \
 [file normalize "${origin_dir}/src/sim/hdmi_overlay_tb.vhd"] \
 [file normalize "${origin_dir}/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sim_1/imports/sim/bus_cdc.vhd"] \
 [file normalize "${origin_dir}/src/sim/i2s_receiver_tb.vhd"] \
 [file normalize "${origin_dir}/src/sim/axi_echo_tb.vhd"] \
 [file normalize "${origin_dir}/src/sim/axi_gain_tb.vhd"] \
 [file normalize "${origin_dir}/src/sim/flipflops_tb.vhd"] \
 [file normalize "${origin_dir}/src/sim/axi_fir_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sim_1' fileset file properties for remote files
set file "$origin_dir/src/sim/hdmi_overlay_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sim_1/imports/sim/bus_cdc.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/sim/i2s_receiver_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/sim/axi_echo_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/sim/axi_gain_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/sim/flipflops_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/sim/axi_fir_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sim_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sim_1' fileset file properties for local files
# None

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "hbs.configure_design_for_hier_access" -value "1" -objects $obj
set_property -name "nl.mode" -value "funcsim" -objects $obj
set_property -name "top" -value "pattern_generator_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj
set_property -name "xsim.elaborate.debug_level" -value "all" -objects $obj
set_property -name "xsim.simulate.log_all_signals" -value "1" -objects $obj
set_property -name "xsim.simulate.runtime" -value "40ms" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]


# Adding sources referenced in BDs, if not already added
if { [get_files axi_fir.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_fir.vhd
}
if { [get_files axi_gain.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_gain.vhd
}
if { [get_files axi_rectification.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_rectification.vhd
}
if { [get_files axi_saturation.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_saturation.vhd
}
if { [get_files flipflops.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/flipflops.vhd
}
if { [get_files axi_echo.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/audio-effects/axi_echo.vhd
}
if { [get_files buffers.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/buffers.vhd
}
if { [get_files debounce.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/misc/debounce.vhd
}
if { [get_files i2s_receiver.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/src/rtl/i2s audio/i2s_receiver.vhd
}
if { [get_files i2s_transmitter.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/i2s audio/i2s_transmitter.vhd
}
if { [get_files hdmi-overlay.vhd] == "" } {
  import_files -quiet -fileset sources_1 C:/FPGA/Vivadoprojects/Pynq-Z2-Audio-Video-Pipelines/vivado_project/Pynq-Z2-Audio-Video-Pipelines.srcs/sources_1/imports/rtl/hdmi-overlay/hdmi-overlay.vhd
}


# Proc to create BD design_1
proc cr_bd_design_1 { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# Buffers, Debounce, I2S_Receiver, I2S_Transmitter, pattern_generator, AXI_Echo, AXI_Fir, AXI_Gain, AXI_Rectification, AXI_Saturation, FlipFlops



  # CHANGE DESIGN NAME HERE
  set design_name design_1

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:processing_system7:5.5\
  xilinx.com:ip:axi_iic:2.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  xilinx.com:ip:clk_wiz:6.0\
  digilentinc.com:ip:dvi2rgb:1.9.5\
  digilentinc.com:ip:rgb2dvi:1.4\
  xilinx.com:ip:xlconstant:1.1\
  xilinx.com:ip:xlconcat:2.1\
  xilinx.com:ip:xpm_cdc_gen:1.0\
  xilinx.com:ip:axi_apb_bridge:3.0\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  Buffers\
  Debounce\
  I2S_Receiver\
  I2S_Transmitter\
  pattern_generator\
  AXI_Echo\
  AXI_Fir\
  AXI_Gain\
  AXI_Rectification\
  AXI_Saturation\
  FlipFlops\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  
# Hierarchical cell: AXI_Effects
proc create_hier_cell_AXI_Effects { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_AXI_Effects() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI4_LITE

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis


  # Create pins
  create_bd_pin -dir I in1
  create_bd_pin -dir I in2
  create_bd_pin -dir I in3
  create_bd_pin -dir I in4
  create_bd_pin -dir O led1
  create_bd_pin -dir O led2
  create_bd_pin -dir O led3
  create_bd_pin -dir O led4
  create_bd_pin -dir O led4_b
  create_bd_pin -dir O led4_r
  create_bd_pin -dir O led5_b
  create_bd_pin -dir O led5_r
  create_bd_pin -dir O -from 23 -to 0 m_axis1_tdata
  create_bd_pin -dir I -type clk s_axi_aclk1
  create_bd_pin -dir I -type rst s_axi_aresetn1
  create_bd_pin -dir O src_send
  create_bd_pin -dir I sw

  # Create instance: AXI_Echo_0, and set properties
  set block_name AXI_Echo
  set block_cell_name AXI_Echo_0
  if { [catch {set AXI_Echo_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AXI_Echo_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.default_delay {48000} \
   CONFIG.ram_length {144000} \
 ] $AXI_Echo_0

  # Create instance: AXI_Fir_0, and set properties
  set block_name AXI_Fir
  set block_cell_name AXI_Fir_0
  if { [catch {set AXI_Fir_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AXI_Fir_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AXI_Gain_0, and set properties
  set block_name AXI_Gain
  set block_cell_name AXI_Gain_0
  if { [catch {set AXI_Gain_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AXI_Gain_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AXI_Rectification_0, and set properties
  set block_name AXI_Rectification
  set block_cell_name AXI_Rectification_0
  if { [catch {set AXI_Rectification_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AXI_Rectification_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: AXI_Saturation_0, and set properties
  set block_name AXI_Saturation
  set block_cell_name AXI_Saturation_0
  if { [catch {set AXI_Saturation_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AXI_Saturation_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: FlipFlops_0, and set properties
  set block_name FlipFlops
  set block_cell_name FlipFlops_0
  if { [catch {set FlipFlops_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $FlipFlops_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_apb_bridge_0, and set properties
  set axi_apb_bridge_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_apb_bridge:3.0 axi_apb_bridge_0 ]
  set_property -dict [ list \
   CONFIG.C_APB_NUM_SLAVES {5} \
 ] $axi_apb_bridge_0

  # Create interface connections
  connect_bd_intf_net -intf_net AXI4_LITE_1 [get_bd_intf_pins AXI4_LITE] [get_bd_intf_pins axi_apb_bridge_0/AXI4_LITE]
  connect_bd_intf_net -intf_net AXI_Echo_0_m_axis [get_bd_intf_pins m_axis] [get_bd_intf_pins AXI_Echo_0/m_axis]
  connect_bd_intf_net -intf_net AXI_Fir_0_m_axis [get_bd_intf_pins AXI_Echo_0/s_axis] [get_bd_intf_pins AXI_Fir_0/m_axis]
  connect_bd_intf_net -intf_net AXI_Gain_0_m_axis [get_bd_intf_pins AXI_Gain_0/m_axis] [get_bd_intf_pins AXI_Saturation_0/s_axis]
  connect_bd_intf_net -intf_net AXI_Rectification_0_m_axis [get_bd_intf_pins AXI_Fir_0/s_axis] [get_bd_intf_pins AXI_Rectification_0/m_axis]
  connect_bd_intf_net -intf_net AXI_Saturation_0_m_axis [get_bd_intf_pins AXI_Rectification_0/s_axis] [get_bd_intf_pins AXI_Saturation_0/m_axis]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M [get_bd_intf_pins AXI_Gain_0/s_apb] [get_bd_intf_pins axi_apb_bridge_0/APB_M]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M2 [get_bd_intf_pins AXI_Saturation_0/s_apb] [get_bd_intf_pins axi_apb_bridge_0/APB_M2]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M3 [get_bd_intf_pins AXI_Echo_0/s_apb] [get_bd_intf_pins axi_apb_bridge_0/APB_M3]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M4 [get_bd_intf_pins AXI_Fir_0/s_apb] [get_bd_intf_pins axi_apb_bridge_0/APB_M4]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M5 [get_bd_intf_pins FlipFlops_0/s_apb] [get_bd_intf_pins axi_apb_bridge_0/APB_M5]
  connect_bd_intf_net -intf_net s_axis_1 [get_bd_intf_pins s_axis] [get_bd_intf_pins AXI_Gain_0/s_axis]

  # Create port connections
  connect_bd_net -net AXI_Echo_0_led_enable [get_bd_pins led4] [get_bd_pins AXI_Echo_0/led_enable]
  connect_bd_net -net AXI_Echo_0_m_axis1_tdata [get_bd_pins m_axis1_tdata] [get_bd_pins AXI_Echo_0/m_axis1_tdata]
  connect_bd_net -net AXI_Echo_0_src_send [get_bd_pins src_send] [get_bd_pins AXI_Echo_0/src_send]
  connect_bd_net -net AXI_Fir_0_led_enable [get_bd_pins led3] [get_bd_pins AXI_Fir_0/led_enable]
  connect_bd_net -net AXI_Rectification_0_led_enable [get_bd_pins led2] [get_bd_pins AXI_Rectification_0/led_enable]
  connect_bd_net -net AXI_Saturation_0_led_bot_l [get_bd_pins led5_b] [get_bd_pins AXI_Saturation_0/led_bot_l]
  connect_bd_net -net AXI_Saturation_0_led_bot_r [get_bd_pins led4_b] [get_bd_pins AXI_Saturation_0/led_bot_r]
  connect_bd_net -net AXI_Saturation_0_led_enable [get_bd_pins led1] [get_bd_pins AXI_Saturation_0/led_enable]
  connect_bd_net -net AXI_Saturation_0_led_top_l [get_bd_pins led5_r] [get_bd_pins AXI_Saturation_0/led_top_l]
  connect_bd_net -net AXI_Saturation_0_led_top_r [get_bd_pins led4_r] [get_bd_pins AXI_Saturation_0/led_top_r]
  connect_bd_net -net FlipFlops_0_out1 [get_bd_pins AXI_Saturation_0/enable] [get_bd_pins FlipFlops_0/out1]
  connect_bd_net -net FlipFlops_0_out2 [get_bd_pins AXI_Rectification_0/enable] [get_bd_pins FlipFlops_0/out2]
  connect_bd_net -net FlipFlops_0_out3 [get_bd_pins AXI_Fir_0/enable] [get_bd_pins FlipFlops_0/out3]
  connect_bd_net -net FlipFlops_0_out4 [get_bd_pins AXI_Echo_0/enable] [get_bd_pins FlipFlops_0/out4]
  connect_bd_net -net in1_1 [get_bd_pins in1] [get_bd_pins FlipFlops_0/in1]
  connect_bd_net -net in2_1 [get_bd_pins in2] [get_bd_pins FlipFlops_0/in2]
  connect_bd_net -net in3_1 [get_bd_pins in3] [get_bd_pins FlipFlops_0/in3]
  connect_bd_net -net in4_1 [get_bd_pins in4] [get_bd_pins FlipFlops_0/in4]
  connect_bd_net -net s_axi_aclk1_1 [get_bd_pins s_axi_aclk1] [get_bd_pins AXI_Echo_0/clk] [get_bd_pins AXI_Fir_0/clk] [get_bd_pins AXI_Gain_0/clk] [get_bd_pins AXI_Rectification_0/clk] [get_bd_pins AXI_Saturation_0/clk] [get_bd_pins FlipFlops_0/clk] [get_bd_pins axi_apb_bridge_0/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn1_1 [get_bd_pins s_axi_aresetn1] [get_bd_pins AXI_Echo_0/rst] [get_bd_pins AXI_Fir_0/rst] [get_bd_pins AXI_Gain_0/rst] [get_bd_pins AXI_Rectification_0/rst] [get_bd_pins AXI_Saturation_0/rst] [get_bd_pins FlipFlops_0/rst] [get_bd_pins axi_apb_bridge_0/s_axi_aresetn]
  connect_bd_net -net sw_1 [get_bd_pins sw] [get_bd_pins AXI_Rectification_0/switch]

  # Perform GUI Layout
  regenerate_bd_layout -hierarchy [get_bd_cells /clock_domain_audio/AXI_Effects] -layout_string {
   "ActiveEmotionalView":"Default View",
   "Default View_ScaleFactor":"0.626429",
   "Default View_TopLeft":"-144,-26",
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS
#  -string -flagsOSRD
preplace port AXI4_LITE -pg 1 -lvl 0 -x 0 -y 450 -defaultsOSRD
preplace port m_axis -pg 1 -lvl 5 -x 1300 -y 600 -defaultsOSRD
preplace port s_axis -pg 1 -lvl 0 -x 0 -y 370 -defaultsOSRD
preplace port led1 -pg 1 -lvl 5 -x 1300 -y 130 -defaultsOSRD
preplace port led2 -pg 1 -lvl 5 -x 1300 -y 320 -defaultsOSRD
preplace port led3 -pg 1 -lvl 5 -x 1300 -y 730 -defaultsOSRD
preplace port led4 -pg 1 -lvl 5 -x 1300 -y 620 -defaultsOSRD
preplace port led4_b -pg 1 -lvl 5 -x 1300 -y 210 -defaultsOSRD
preplace port led4_r -pg 1 -lvl 5 -x 1300 -y 190 -defaultsOSRD
preplace port led5_b -pg 1 -lvl 5 -x 1300 -y 170 -defaultsOSRD
preplace port led5_r -pg 1 -lvl 5 -x 1300 -y 150 -defaultsOSRD
preplace port s_axi_aclk1 -pg 1 -lvl 0 -x 0 -y 470 -defaultsOSRD
preplace port s_axi_aresetn1 -pg 1 -lvl 0 -x 0 -y 490 -defaultsOSRD
preplace port sw -pg 1 -lvl 0 -x 0 -y 310 -defaultsOSRD
preplace port src_send -pg 1 -lvl 5 -x 1300 -y 660 -defaultsOSRD
preplace port in3 -pg 1 -lvl 0 -x 0 -y 150 -defaultsOSRD
preplace port in4 -pg 1 -lvl 0 -x 0 -y 170 -defaultsOSRD
preplace port in2 -pg 1 -lvl 0 -x 0 -y 130 -defaultsOSRD
preplace port in1 -pg 1 -lvl 0 -x 0 -y 110 -defaultsOSRD
preplace portBus m_axis1_tdata -pg 1 -lvl 5 -x 1300 -y 640 -defaultsOSRD
preplace inst axi_apb_bridge_0 -pg 1 -lvl 1 -x 150 -y 470 -defaultsOSRD
preplace inst AXI_Fir_0 -pg 1 -lvl 3 -x 750 -y 510 -defaultsOSRD
preplace inst AXI_Gain_0 -pg 1 -lvl 2 -x 440 -y 400 -defaultsOSRD
preplace inst AXI_Rectification_0 -pg 1 -lvl 4 -x 1130 -y 310 -defaultsOSRD
preplace inst AXI_Saturation_0 -pg 1 -lvl 3 -x 750 -y 250 -defaultsOSRD
preplace inst FlipFlops_0 -pg 1 -lvl 2 -x 440 -y 110 -defaultsOSRD
preplace inst AXI_Echo_0 -pg 1 -lvl 4 -x 1130 -y 630 -defaultsOSRD
preplace netloc AXI_Echo_0_led_enable 1 4 1 NJ 620
preplace netloc AXI_Fir_0_led_enable 1 3 2 NJ 520 1280J
preplace netloc AXI_Rectification_0_led_enable 1 4 1 NJ 320
preplace netloc AXI_Saturation_0_led_bot_l 1 3 2 920J 170 NJ
preplace netloc AXI_Saturation_0_led_bot_r 1 3 2 950J 210 NJ
preplace netloc AXI_Saturation_0_led_enable 1 3 2 890J 130 NJ
preplace netloc AXI_Saturation_0_led_top_l 1 3 2 910J 150 NJ
preplace netloc AXI_Saturation_0_led_top_r 1 3 2 930J 190 NJ
preplace netloc FlipFlops_0_out1 1 2 1 590 80n
preplace netloc FlipFlops_0_out2 1 2 2 N 100 970J
preplace netloc FlipFlops_0_out3 1 2 1 560 120n
preplace netloc FlipFlops_0_out4 1 2 2 580J 130 880
preplace netloc s_axi_aclk1_1 1 0 4 30 570 290 250 600 360 980
preplace netloc s_axi_aresetn1_1 1 0 4 20 580 320 260 620 140 900
preplace netloc sw_1 1 0 4 NJ 310 NJ 310 570J 120 960J
preplace netloc AXI_Echo_0_m_axis1_tdata 1 4 1 NJ 640
preplace netloc AXI_Echo_0_src_send 1 4 1 NJ 660
preplace netloc in3_1 1 0 2 NJ 150 NJ
preplace netloc in4_1 1 0 2 NJ 170 NJ
preplace netloc in2_1 1 0 2 NJ 130 NJ
preplace netloc in1_1 1 0 2 NJ 110 NJ
preplace netloc s_axis_1 1 0 2 NJ 370 NJ
preplace netloc AXI_Echo_0_m_axis 1 4 1 NJ 600
preplace netloc AXI_Saturation_0_m_axis 1 3 1 940 200n
preplace netloc axi_apb_bridge_0_APB_M5 1 1 1 270 50n
preplace netloc AXI_Gain_0_m_axis 1 2 1 580 210n
preplace netloc AXI4_LITE_1 1 0 1 NJ 450
preplace netloc AXI_Rectification_0_m_axis 1 2 3 630 400 940J 410 1280
preplace netloc axi_apb_bridge_0_APB_M3 1 1 3 310 490 610J 410 890J
preplace netloc axi_apb_bridge_0_APB_M2 1 1 2 300 230 NJ
preplace netloc AXI_Fir_0_m_axis 1 3 1 870 500n
preplace netloc axi_apb_bridge_0_APB_M 1 1 1 310 390n
preplace netloc axi_apb_bridge_0_APB_M4 1 1 2 280 500 630J
levelinfo -pg 1 0 150 440 750 1130 1300
pagesize -pg 1 -db -bbox -sgen -150 -10 1480 750
"
}

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: crossing_clock_domain_audio_hdmi
proc create_hier_cell_crossing_clock_domain_audio_hdmi { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_crossing_clock_domain_audio_hdmi() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 In0
  create_bd_pin -dir I -from 0 -to 0 In1
  create_bd_pin -dir I -from 0 -to 0 In2
  create_bd_pin -dir I -from 0 -to 0 In3
  create_bd_pin -dir I -type clk dest_clk
  create_bd_pin -dir O -from 3 -to 0 dest_out
  create_bd_pin -dir O -from 23 -to 0 dest_out1
  create_bd_pin -dir I -type clk src_clk
  create_bd_pin -dir I -from 23 -to 0 src_in
  create_bd_pin -dir I src_send

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xpm_cdc_gen_0, and set properties
  set xpm_cdc_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 xpm_cdc_gen_0 ]
  set_property -dict [ list \
   CONFIG.INIT_SYNC_FF {true} \
   CONFIG.SIM_ASSERT_CHK {false} \
   CONFIG.SRC_INPUT_REG {true} \
   CONFIG.WIDTH {4} \
 ] $xpm_cdc_gen_0

  # Create instance: xpm_cdc_gen_1, and set properties
  set xpm_cdc_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xpm_cdc_gen:1.0 xpm_cdc_gen_1 ]
  set_property -dict [ list \
   CONFIG.CDC_TYPE {xpm_cdc_handshake} \
   CONFIG.DEST_EXT_HSK {true} \
   CONFIG.INIT_SYNC_FF {true} \
   CONFIG.SIM_ASSERT_CHK {false} \
   CONFIG.SRC_INPUT_REG {true} \
   CONFIG.WIDTH {24} \
 ] $xpm_cdc_gen_1

  # Create port connections
  connect_bd_net -net clk_wiz_0_pix [get_bd_pins dest_clk] [get_bd_pins xpm_cdc_gen_0/dest_clk] [get_bd_pins xpm_cdc_gen_1/dest_clk]
  connect_bd_net -net clock_domain_50_out1 [get_bd_pins In0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net clock_domain_50_out2 [get_bd_pins In1] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net clock_domain_50_out3 [get_bd_pins In2] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net clock_domain_50_out4 [get_bd_pins In3] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins src_clk] [get_bd_pins xpm_cdc_gen_0/src_clk] [get_bd_pins xpm_cdc_gen_1/src_clk]
  connect_bd_net -net src_in_1 [get_bd_pins src_in] [get_bd_pins xpm_cdc_gen_1/src_in]
  connect_bd_net -net src_send_1 [get_bd_pins src_send] [get_bd_pins xpm_cdc_gen_1/src_send]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins xlconcat_0/dout] [get_bd_pins xpm_cdc_gen_0/src_in]
  connect_bd_net -net xpm_cdc_gen_0_dest_out [get_bd_pins dest_out] [get_bd_pins xpm_cdc_gen_0/dest_out]
  connect_bd_net -net xpm_cdc_gen_1_dest_out [get_bd_pins dest_out1] [get_bd_pins xpm_cdc_gen_1/dest_out]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: clock_domain_hdmi
proc create_hier_cell_clock_domain_hdmi { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_clock_domain_hdmi() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC_1


  # Create pins
  create_bd_pin -dir I -type clk clk_in1_0
  create_bd_pin -dir O -type clk clk_n
  create_bd_pin -dir O -type clk clk_p
  create_bd_pin -dir O -from 2 -to 0 data_n
  create_bd_pin -dir O -from 2 -to 0 data_p
  create_bd_pin -dir O -from 0 -to 0 dout_0
  create_bd_pin -dir I -type clk hdmi_rx_clk_n
  create_bd_pin -dir I -type clk hdmi_rx_clk_p
  create_bd_pin -dir I -from 2 -to 0 hdmi_rx_d_n
  create_bd_pin -dir I -from 2 -to 0 hdmi_rx_d_p
  create_bd_pin -dir O -type clk pixel_clk
  create_bd_pin -dir I -from 23 -to 0 soundinput
  create_bd_pin -dir I -from 3 -to 0 sw
  create_bd_pin -dir I sw1

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {80.0} \
   CONFIG.CLKOUT1_DRIVES {BUFG} \
   CONFIG.CLKOUT1_JITTER {109.241} \
   CONFIG.CLKOUT1_PHASE_ERROR {96.948} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
   CONFIG.CLKOUT2_DRIVES {BUFG} \
   CONFIG.CLKOUT3_DRIVES {BUFG} \
   CONFIG.CLKOUT4_DRIVES {BUFG} \
   CONFIG.CLKOUT5_DRIVES {BUFG} \
   CONFIG.CLKOUT6_DRIVES {BUFG} \
   CONFIG.CLKOUT7_DRIVES {BUFG} \
   CONFIG.MMCM_BANDWIDTH {OPTIMIZED} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {8} \
   CONFIG.MMCM_CLKIN1_PERIOD {8.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {5} \
   CONFIG.MMCM_COMPENSATION {ZHOLD} \
   CONFIG.PRIMITIVE {PLL} \
   CONFIG.PRIM_IN_FREQ {125} \
   CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.USE_LOCKED {true} \
   CONFIG.USE_PHASE_ALIGNMENT {true} \
 ] $clk_wiz_0

  # Create instance: dvi2rgb_0, and set properties
  set dvi2rgb_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:dvi2rgb:1.9.5 dvi2rgb_0 ]
  set_property -dict [ list \
   CONFIG.kClkRange {3} \
   CONFIG.kDebug {false} \
   CONFIG.kEdidFileName {dgl_720p_cea.data} \
   CONFIG.kEnableSerialClkOutput {false} \
 ] $dvi2rgb_0

  # Create instance: pattern_generator_0, and set properties
  set block_name pattern_generator
  set block_cell_name pattern_generator_0
  if { [catch {set pattern_generator_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pattern_generator_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.audio_size {600} \
   CONFIG.frame_height {720} \
   CONFIG.frame_width {1280} \
 ] $pattern_generator_0

  # Create instance: rgb2dvi_0, and set properties
  set rgb2dvi_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dvi:1.4 rgb2dvi_0 ]
  set_property -dict [ list \
   CONFIG.kClkPrimitive {MMCM} \
   CONFIG.kClkRange {3} \
 ] $rgb2dvi_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins DDC_1] [get_bd_intf_pins dvi2rgb_0/DDC]

  # Create port connections
  connect_bd_net -net clk_in1_0_1 [get_bd_pins clk_in1_0] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins dvi2rgb_0/RefClk]
  connect_bd_net -net dvi2rgb_0_vid_pData [get_bd_pins dvi2rgb_0/vid_pData] [get_bd_pins pattern_generator_0/video_in]
  connect_bd_net -net dvi2rgb_0_vid_pHSync [get_bd_pins dvi2rgb_0/vid_pHSync] [get_bd_pins pattern_generator_0/hsync_in]
  connect_bd_net -net dvi2rgb_0_vid_pVDE [get_bd_pins dvi2rgb_0/vid_pVDE] [get_bd_pins pattern_generator_0/video_active_in]
  connect_bd_net -net dvi2rgb_0_vid_pVSync [get_bd_pins dvi2rgb_0/vid_pVSync] [get_bd_pins pattern_generator_0/vsync_in]
  connect_bd_net -net hdmi_io_0_pixel_clk [get_bd_pins pixel_clk] [get_bd_pins dvi2rgb_0/PixelClk] [get_bd_pins pattern_generator_0/clk] [get_bd_pins rgb2dvi_0/PixelClk]
  connect_bd_net -net hdmi_rx_clk_n_1 [get_bd_pins hdmi_rx_clk_n] [get_bd_pins dvi2rgb_0/TMDS_Clk_n]
  connect_bd_net -net hdmi_rx_clk_p_1 [get_bd_pins hdmi_rx_clk_p] [get_bd_pins dvi2rgb_0/TMDS_Clk_p]
  connect_bd_net -net hdmi_rx_d_n_1 [get_bd_pins hdmi_rx_d_n] [get_bd_pins dvi2rgb_0/TMDS_Data_n]
  connect_bd_net -net hdmi_rx_d_p_1 [get_bd_pins hdmi_rx_d_p] [get_bd_pins dvi2rgb_0/TMDS_Data_p]
  connect_bd_net -net pattern_generator_0_hsync_out [get_bd_pins pattern_generator_0/hsync_out] [get_bd_pins rgb2dvi_0/vid_pHSync]
  connect_bd_net -net pattern_generator_0_rgb [get_bd_pins pattern_generator_0/rgb] [get_bd_pins rgb2dvi_0/vid_pData]
  connect_bd_net -net pattern_generator_0_video_active_out [get_bd_pins pattern_generator_0/video_active_out] [get_bd_pins rgb2dvi_0/vid_pVDE]
  connect_bd_net -net pattern_generator_0_vsync_out [get_bd_pins pattern_generator_0/vsync_out] [get_bd_pins rgb2dvi_0/vid_pVSync]
  connect_bd_net -net rgb2dvi_0_TMDS_Clk_n [get_bd_pins clk_n] [get_bd_pins rgb2dvi_0/TMDS_Clk_n]
  connect_bd_net -net rgb2dvi_0_TMDS_Clk_p [get_bd_pins clk_p] [get_bd_pins rgb2dvi_0/TMDS_Clk_p]
  connect_bd_net -net rgb2dvi_0_TMDS_Data_n [get_bd_pins data_n] [get_bd_pins rgb2dvi_0/TMDS_Data_n]
  connect_bd_net -net rgb2dvi_0_TMDS_Data_p [get_bd_pins data_p] [get_bd_pins rgb2dvi_0/TMDS_Data_p]
  connect_bd_net -net soundinput_1 [get_bd_pins soundinput] [get_bd_pins pattern_generator_0/soundinput]
  connect_bd_net -net sw1_1 [get_bd_pins sw1] [get_bd_pins pattern_generator_0/enable]
  connect_bd_net -net sw_1 [get_bd_pins sw] [get_bd_pins pattern_generator_0/sw]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins clk_wiz_0/reset] [get_bd_pins dvi2rgb_0/aRst] [get_bd_pins dvi2rgb_0/pRst] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins dout_0] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  
# Hierarchical cell: clock_domain_audio
proc create_hier_cell_clock_domain_audio { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_clock_domain_audio() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_rtl


  # Create pins
  create_bd_pin -dir I au_adc
  create_bd_pin -dir I au_bclk
  create_bd_pin -dir O au_dac
  create_bd_pin -dir I au_lrclk
  create_bd_pin -dir O -from 23 -to 0 audiodata
  create_bd_pin -dir I btn1
  create_bd_pin -dir I btn2
  create_bd_pin -dir I btn3
  create_bd_pin -dir I btn4
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O led1
  create_bd_pin -dir O led2
  create_bd_pin -dir O led3
  create_bd_pin -dir O led4
  create_bd_pin -dir O led4_b
  create_bd_pin -dir O led4_r
  create_bd_pin -dir O led5_b
  create_bd_pin -dir O led5_r
  create_bd_pin -dir O out1
  create_bd_pin -dir O out2
  create_bd_pin -dir O out3
  create_bd_pin -dir O out4
  create_bd_pin -dir I -type clk s_axi_aclk1
  create_bd_pin -dir O src_send
  create_bd_pin -dir I sw
  create_bd_pin -dir O test_adc
  create_bd_pin -dir O test_bclk
  create_bd_pin -dir O test_dac
  create_bd_pin -dir O test_lrclk

  # Create instance: AXI_Effects
  create_hier_cell_AXI_Effects $hier_obj AXI_Effects

  # Create instance: Buffers, and set properties
  set block_name Buffers
  set block_cell_name Buffers
  if { [catch {set Buffers [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Buffers eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Debounce_0, and set properties
  set block_name Debounce
  set block_cell_name Debounce_0
  if { [catch {set Debounce_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Debounce_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: I2S_Receiver, and set properties
  set block_name I2S_Receiver
  set block_cell_name I2S_Receiver
  if { [catch {set I2S_Receiver [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $I2S_Receiver eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.DATA_WIDTH {24} \
 ] $I2S_Receiver

  # Create instance: I2S_Transmitter, and set properties
  set block_name I2S_Transmitter
  set block_cell_name I2S_Transmitter
  if { [catch {set I2S_Transmitter [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $I2S_Transmitter eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.DATA_WIDTH {24} \
 ] $I2S_Transmitter

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]
  set_property -dict [ list \
   CONFIG.IIC_BOARD_INTERFACE {Custom} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_iic_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
 ] $ps7_0_axi_periph

  # Create instance: rst_ps7_0_50M, and set properties
  set rst_ps7_0_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_50M ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI_Effects_m_axis [get_bd_intf_pins AXI_Effects/m_axis] [get_bd_intf_pins I2S_Transmitter/s_axis]
  connect_bd_intf_net -intf_net I2S_Receiver_0_m_axis [get_bd_intf_pins AXI_Effects/s_axis] [get_bd_intf_pins I2S_Receiver/m_axis]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_pins iic_rtl] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins AXI_Effects/AXI4_LITE] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]

  # Create port connections
  connect_bd_net -net AXI_Effects_led1 [get_bd_pins led1] [get_bd_pins out1] [get_bd_pins AXI_Effects/led1]
  connect_bd_net -net AXI_Effects_led2 [get_bd_pins led2] [get_bd_pins out2] [get_bd_pins AXI_Effects/led2]
  connect_bd_net -net AXI_Effects_led3 [get_bd_pins led3] [get_bd_pins out3] [get_bd_pins AXI_Effects/led3]
  connect_bd_net -net AXI_Effects_led4 [get_bd_pins led4] [get_bd_pins out4] [get_bd_pins AXI_Effects/led4]
  connect_bd_net -net AXI_Effects_m_axis1_tdata [get_bd_pins audiodata] [get_bd_pins AXI_Effects/m_axis1_tdata]
  connect_bd_net -net AXI_Effects_src_send [get_bd_pins src_send] [get_bd_pins AXI_Effects/src_send]
  connect_bd_net -net AXI_Saturation_0_led_bot [get_bd_pins led5_r] [get_bd_pins AXI_Effects/led5_r]
  connect_bd_net -net AXI_Saturation_0_led_bot_l [get_bd_pins led5_b] [get_bd_pins AXI_Effects/led5_b]
  connect_bd_net -net AXI_Saturation_0_led_bot_r [get_bd_pins led4_b] [get_bd_pins AXI_Effects/led4_b]
  connect_bd_net -net AXI_Saturation_0_led_top_r [get_bd_pins led4_r] [get_bd_pins AXI_Effects/led4_r]
  connect_bd_net -net Buffers_0_out1 [get_bd_pins test_bclk] [get_bd_pins Buffers/out1]
  connect_bd_net -net Buffers_0_out2 [get_bd_pins test_lrclk] [get_bd_pins Buffers/out2]
  connect_bd_net -net Buffers_0_out3 [get_bd_pins test_adc] [get_bd_pins Buffers/out3]
  connect_bd_net -net Buffers_0_out4 [get_bd_pins au_dac] [get_bd_pins Buffers/out4]
  connect_bd_net -net Buffers_0_out5 [get_bd_pins test_dac] [get_bd_pins Buffers/out5]
  connect_bd_net -net I2S_Transmitter_1_sdata [get_bd_pins Buffers/in4] [get_bd_pins I2S_Transmitter/sdata]
  connect_bd_net -net bclk_0_1 [get_bd_pins au_bclk] [get_bd_pins Buffers/in1] [get_bd_pins I2S_Receiver/bclk] [get_bd_pins I2S_Transmitter/bclk]
  connect_bd_net -net btn1_1 [get_bd_pins btn1] [get_bd_pins Debounce_0/button1]
  connect_bd_net -net btn2_1 [get_bd_pins btn2] [get_bd_pins Debounce_0/button2]
  connect_bd_net -net btn3_1 [get_bd_pins btn3] [get_bd_pins Debounce_0/button3]
  connect_bd_net -net btn4_1 [get_bd_pins btn4] [get_bd_pins Debounce_0/button4]
  connect_bd_net -net in1_1 [get_bd_pins AXI_Effects/in1] [get_bd_pins Debounce_0/result1]
  connect_bd_net -net in2_1 [get_bd_pins AXI_Effects/in2] [get_bd_pins Debounce_0/result2]
  connect_bd_net -net in3_1 [get_bd_pins AXI_Effects/in3] [get_bd_pins Debounce_0/result3]
  connect_bd_net -net in4_1 [get_bd_pins AXI_Effects/in4] [get_bd_pins Debounce_0/result4]
  connect_bd_net -net lrclk_0_1 [get_bd_pins au_lrclk] [get_bd_pins Buffers/in2] [get_bd_pins I2S_Receiver/lrclk] [get_bd_pins I2S_Transmitter/lrclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins s_axi_aclk1] [get_bd_pins AXI_Effects/s_axi_aclk1] [get_bd_pins Debounce_0/clk] [get_bd_pins I2S_Receiver/m_axis_aclk] [get_bd_pins I2S_Transmitter/s_axis_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins rst_ps7_0_50M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins ext_reset_in] [get_bd_pins rst_ps7_0_50M/ext_reset_in]
  connect_bd_net -net rst_ps7_0_50M_peripheral_aresetn [get_bd_pins AXI_Effects/s_axi_aresetn1] [get_bd_pins Debounce_0/rst] [get_bd_pins I2S_Receiver/m_axis_aresetn] [get_bd_pins I2S_Transmitter/s_axis_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_50M/peripheral_aresetn]
  connect_bd_net -net sdata_0_1 [get_bd_pins au_adc] [get_bd_pins Buffers/in3] [get_bd_pins I2S_Receiver/sdata]
  connect_bd_net -net switch_0_1 [get_bd_pins sw] [get_bd_pins AXI_Effects/sw]

  # Perform GUI Layout
  regenerate_bd_layout -hierarchy [get_bd_cells /clock_domain_audio] -layout_string {
   "ActiveEmotionalView":"Default View",
   "Default View_ScaleFactor":"0.506941",
   "Default View_TopLeft":"-126,-24",
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS
#  -string -flagsOSRD
preplace port iic_rtl -pg 1 -lvl 6 -x 1670 -y 240 -defaultsOSRD
preplace port S00_AXI -pg 1 -lvl 0 -x 0 -y 190 -defaultsOSRD
preplace port au_bclk -pg 1 -lvl 0 -x 0 -y 540 -defaultsOSRD
preplace port au_lrclk -pg 1 -lvl 0 -x 0 -y 560 -defaultsOSRD
preplace port au_adc -pg 1 -lvl 0 -x 0 -y 580 -defaultsOSRD
preplace port s_axi_aclk1 -pg 1 -lvl 0 -x 0 -y 50 -defaultsOSRD
preplace port ext_reset_in -pg 1 -lvl 0 -x 0 -y 70 -defaultsOSRD
preplace port test_bclk -pg 1 -lvl 6 -x 1670 -y 830 -defaultsOSRD
preplace port test_lrclk -pg 1 -lvl 6 -x 1670 -y 850 -defaultsOSRD
preplace port test_adc -pg 1 -lvl 6 -x 1670 -y 870 -defaultsOSRD
preplace port au_dac -pg 1 -lvl 6 -x 1670 -y 890 -defaultsOSRD
preplace port test_dac -pg 1 -lvl 6 -x 1670 -y 910 -defaultsOSRD
preplace port led1 -pg 1 -lvl 6 -x 1670 -y 320 -defaultsOSRD
preplace port led2 -pg 1 -lvl 6 -x 1670 -y 360 -defaultsOSRD
preplace port led3 -pg 1 -lvl 6 -x 1670 -y 400 -defaultsOSRD
preplace port led4 -pg 1 -lvl 6 -x 1670 -y 440 -defaultsOSRD
preplace port led4_b -pg 1 -lvl 6 -x 1670 -y 480 -defaultsOSRD
preplace port led4_r -pg 1 -lvl 6 -x 1670 -y 500 -defaultsOSRD
preplace port led5_b -pg 1 -lvl 6 -x 1670 -y 520 -defaultsOSRD
preplace port led5_r -pg 1 -lvl 6 -x 1670 -y 540 -defaultsOSRD
preplace port sw -pg 1 -lvl 0 -x 0 -y 300 -defaultsOSRD
preplace port out1 -pg 1 -lvl 6 -x 1670 -y 340 -defaultsOSRD
preplace port out2 -pg 1 -lvl 6 -x 1670 -y 380 -defaultsOSRD
preplace port out3 -pg 1 -lvl 6 -x 1670 -y 420 -defaultsOSRD
preplace port out4 -pg 1 -lvl 6 -x 1670 -y 460 -defaultsOSRD
preplace port src_send -pg 1 -lvl 6 -x 1670 -y 580 -defaultsOSRD
preplace port btn2 -pg 1 -lvl 0 -x 0 -y 440 -defaultsOSRD
preplace port btn4 -pg 1 -lvl 0 -x 0 -y 480 -defaultsOSRD
preplace port btn3 -pg 1 -lvl 0 -x 0 -y 460 -defaultsOSRD
preplace port btn1 -pg 1 -lvl 0 -x 0 -y 420 -defaultsOSRD
preplace portBus audiodata -pg 1 -lvl 6 -x 1670 -y 560 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 4 -x 1160 -y 260 -defaultsOSRD
preplace inst rst_ps7_0_50M -pg 1 -lvl 1 -x 190 -y 90 -defaultsOSRD
preplace inst AXI_Effects -pg 1 -lvl 4 -x 1160 -y 480 -defaultsOSRD
preplace inst ps7_0_axi_periph -pg 1 -lvl 3 -x 780 -y 270 -defaultsOSRD
preplace inst Buffers -pg 1 -lvl 5 -x 1510 -y 870 -defaultsOSRD
preplace inst Debounce_0 -pg 1 -lvl 2 -x 480 -y 430 -defaultsOSRD
preplace inst I2S_Receiver -pg 1 -lvl 3 -x 780 -y 580 -defaultsOSRD
preplace inst I2S_Transmitter -pg 1 -lvl 5 -x 1510 -y 670 -defaultsOSRD
preplace netloc I2S_Transmitter_1_sdata 1 4 2 1390 570 1630
preplace netloc bclk_0_1 1 0 5 NJ 540 NJ 540 590 480 930J 630 1310
preplace netloc lrclk_0_1 1 0 5 NJ 560 NJ 560 610 680 NJ 680 1380
preplace netloc sdata_0_1 1 0 5 NJ 580 NJ 580 590 880 NJ 880 NJ
preplace netloc processing_system7_0_FCLK_CLK1 1 0 5 20 230 360 230 600 120 1010 170 1370J
preplace netloc rst_ps7_0_50M_peripheral_aresetn 1 1 4 370 130 620 130 1000 180 1350J
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 1 NJ 70
preplace netloc Buffers_0_out1 1 5 1 NJ 830
preplace netloc Buffers_0_out2 1 5 1 NJ 850
preplace netloc Buffers_0_out3 1 5 1 NJ 870
preplace netloc Buffers_0_out4 1 5 1 NJ 890
preplace netloc Buffers_0_out5 1 5 1 NJ 910
preplace netloc AXI_Effects_led1 1 4 2 1310J 340 1650J
preplace netloc AXI_Effects_led2 1 4 2 1330J 380 1650J
preplace netloc AXI_Effects_led3 1 4 2 1340J 420 1650J
preplace netloc AXI_Effects_led4 1 4 2 NJ 460 1650J
preplace netloc AXI_Saturation_0_led_bot_r 1 4 2 NJ 480 NJ
preplace netloc AXI_Saturation_0_led_top_r 1 4 2 NJ 500 NJ
preplace netloc AXI_Saturation_0_led_bot_l 1 4 2 NJ 520 NJ
preplace netloc AXI_Saturation_0_led_bot 1 4 2 NJ 540 NJ
preplace netloc switch_0_1 1 0 4 NJ 300 NJ 300 610J 470 950J
preplace netloc AXI_Effects_m_axis1_tdata 1 4 2 1360J 550 1650J
preplace netloc AXI_Effects_src_send 1 4 2 1380J 560 1640J
preplace netloc btn2_1 1 0 2 NJ 440 NJ
preplace netloc btn4_1 1 0 2 NJ 480 NJ
preplace netloc btn3_1 1 0 2 NJ 460 NJ
preplace netloc btn1_1 1 0 2 NJ 420 NJ
preplace netloc in1_1 1 2 2 590J 410 970
preplace netloc in2_1 1 2 2 NJ 420 960
preplace netloc in3_1 1 2 2 NJ 440 980
preplace netloc in4_1 1 2 2 NJ 460 940
preplace netloc ps7_0_axi_periph_M01_AXI 1 3 1 960 280n
preplace netloc AXI_Effects_m_axis 1 4 1 1320 380n
preplace netloc processing_system7_0_M_AXI_GP0 1 0 3 NJ 190 NJ 190 NJ
preplace netloc ps7_0_axi_periph_M00_AXI 1 3 1 960 240n
preplace netloc I2S_Receiver_0_m_axis 1 3 1 990 420n
preplace netloc axi_iic_0_IIC 1 4 2 NJ 240 NJ
levelinfo -pg 1 0 190 480 780 1160 1510 1670
pagesize -pg 1 -db -bbox -sgen -130 -10 1820 970
"
}

  # Restore current instance
  current_bd_instance $oldCurInst
}
  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDC_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC_0 ]

  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  set iic_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_rtl ]


  # Create ports
  set au_adc [ create_bd_port -dir I au_adc ]
  set au_bclk [ create_bd_port -dir I au_bclk ]
  set au_dac [ create_bd_port -dir O au_dac ]
  set au_lrclk [ create_bd_port -dir I au_lrclk ]
  set au_mclk [ create_bd_port -dir O -type clk au_mclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {10000000} \
 ] $au_mclk
  set btn1 [ create_bd_port -dir I btn1 ]
  set btn2 [ create_bd_port -dir I btn2 ]
  set btn3 [ create_bd_port -dir I btn3 ]
  set btn4 [ create_bd_port -dir I btn4 ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 125000000 clk ]
  set hdmi_rx_clk_n [ create_bd_port -dir I -type clk hdmi_rx_clk_n ]
  set hdmi_rx_clk_p [ create_bd_port -dir I -type clk hdmi_rx_clk_p ]
  set hdmi_rx_data_n [ create_bd_port -dir I -from 2 -to 0 hdmi_rx_data_n ]
  set hdmi_rx_data_p [ create_bd_port -dir I -from 2 -to 0 hdmi_rx_data_p ]
  set hdmi_rx_hpd [ create_bd_port -dir O -from 0 -to 0 hdmi_rx_hpd ]
  set hdmi_tx_clk_n [ create_bd_port -dir O -type clk hdmi_tx_clk_n ]
  set hdmi_tx_clk_p [ create_bd_port -dir O -type clk hdmi_tx_clk_p ]
  set hdmi_tx_data_n [ create_bd_port -dir O -from 2 -to 0 hdmi_tx_data_n ]
  set hdmi_tx_data_p [ create_bd_port -dir O -from 2 -to 0 hdmi_tx_data_p ]
  set hdmi_tx_hpdn [ create_bd_port -dir O -from 0 -to 0 hdmi_tx_hpdn ]
  set led1 [ create_bd_port -dir O led1 ]
  set led2 [ create_bd_port -dir O led2 ]
  set led3 [ create_bd_port -dir O led3 ]
  set led4 [ create_bd_port -dir O led4 ]
  set led4_b [ create_bd_port -dir O led4_b ]
  set led4_r [ create_bd_port -dir O led4_r ]
  set led5_b [ create_bd_port -dir O led5_b ]
  set led5_r [ create_bd_port -dir O led5_r ]
  set sw [ create_bd_port -dir I sw ]
  set sw1 [ create_bd_port -dir I sw1 ]
  set test_adc [ create_bd_port -dir O test_adc ]
  set test_bclk [ create_bd_port -dir O test_bclk ]
  set test_dac [ create_bd_port -dir O test_dac ]
  set test_lrclk [ create_bd_port -dir O test_lrclk ]

  # Create instance: clock_domain_audio
  create_hier_cell_clock_domain_audio [current_bd_instance .] clock_domain_audio

  # Create instance: clock_domain_hdmi
  create_hier_cell_clock_domain_hdmi [current_bd_instance .] clock_domain_hdmi

  # Create instance: crossing_clock_domain_audio_hdmi
  create_hier_cell_crossing_clock_domain_audio_hdmi [current_bd_instance .] crossing_clock_domain_audio_hdmi

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {650.000000} \
   CONFIG.PCW_ACT_CAN0_PERIPHERAL_FREQMHZ {23.8095} \
   CONFIG.PCW_ACT_CAN1_PERIPHERAL_FREQMHZ {23.8095} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.096154} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_I2C_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_ACT_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_ACT_USB1_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {108.333336} \
   CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
   CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {650} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {26} \
   CONFIG.PCW_CAN0_BASEADDR {0xE0008000} \
   CONFIG.PCW_CAN0_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN0_HIGHADDR {0xE0008FFF} \
   CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN0_PERIPHERAL_FREQMHZ {-1} \
   CONFIG.PCW_CAN1_BASEADDR {0xE0009000} \
   CONFIG.PCW_CAN1_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN1_HIGHADDR {0xE0009FFF} \
   CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN1_PERIPHERAL_FREQMHZ {-1} \
   CONFIG.PCW_CAN_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_CAN_PERIPHERAL_VALID {0} \
   CONFIG.PCW_CLK0_FREQ {10000000} \
   CONFIG.PCW_CLK1_FREQ {50000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CORE0_FIQ_INTR {0} \
   CONFIG.PCW_CORE0_IRQ_INTR {0} \
   CONFIG.PCW_CORE1_FIQ_INTR {0} \
   CONFIG.PCW_CORE1_IRQ_INTR {0} \
   CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {667} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1300.000} \
   CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {ARM PLL} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {DDR PLL} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {52} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {2} \
   CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {10.159} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {21} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1050.000} \
   CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION {HPR(0)/LPR(32)} \
   CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL {15} \
   CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL {2} \
   CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_PORT0_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT1_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT2_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT3_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_RAM_BASEADDR {0x00100000} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
   CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL {2} \
   CONFIG.PCW_DM_WIDTH {4} \
   CONFIG.PCW_DQS_WIDTH {4} \
   CONFIG.PCW_DQ_WIDTH {32} \
   CONFIG.PCW_ENET0_BASEADDR {0xE000B000} \
   CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
   CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
   CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
   CONFIG.PCW_ENET0_HIGHADDR {0xE000BFFF} \
   CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET0_RESET_ENABLE {1} \
   CONFIG.PCW_ENET0_RESET_IO {MIO 9} \
   CONFIG.PCW_ENET1_BASEADDR {0xE000C000} \
   CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0} \
   CONFIG.PCW_ENET1_HIGHADDR {0xE000CFFF} \
   CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {1} \
   CONFIG.PCW_ENET_RESET_POLARITY {Active Low} \
   CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_EN_4K_TIMER {0} \
   CONFIG.PCW_EN_CAN0 {0} \
   CONFIG.PCW_EN_CAN1 {0} \
   CONFIG.PCW_EN_CLK0_PORT {1} \
   CONFIG.PCW_EN_CLK1_PORT {1} \
   CONFIG.PCW_EN_CLK2_PORT {0} \
   CONFIG.PCW_EN_CLK3_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG0_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG1_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG2_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG3_PORT {0} \
   CONFIG.PCW_EN_DDR {1} \
   CONFIG.PCW_EN_EMIO_CAN0 {0} \
   CONFIG.PCW_EN_EMIO_CAN1 {0} \
   CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_CD_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_ENET0 {0} \
   CONFIG.PCW_EN_EMIO_ENET1 {0} \
   CONFIG.PCW_EN_EMIO_GPIO {0} \
   CONFIG.PCW_EN_EMIO_I2C0 {0} \
   CONFIG.PCW_EN_EMIO_I2C1 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART0 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART1 {0} \
   CONFIG.PCW_EN_EMIO_PJTAG {0} \
   CONFIG.PCW_EN_EMIO_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_SPI0 {0} \
   CONFIG.PCW_EN_EMIO_SPI1 {0} \
   CONFIG.PCW_EN_EMIO_SRAM_INT {0} \
   CONFIG.PCW_EN_EMIO_TRACE {0} \
   CONFIG.PCW_EN_EMIO_TTC0 {0} \
   CONFIG.PCW_EN_EMIO_TTC1 {0} \
   CONFIG.PCW_EN_EMIO_UART0 {0} \
   CONFIG.PCW_EN_EMIO_UART1 {0} \
   CONFIG.PCW_EN_EMIO_WDT {0} \
   CONFIG.PCW_EN_EMIO_WP_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_WP_SDIO1 {0} \
   CONFIG.PCW_EN_ENET0 {1} \
   CONFIG.PCW_EN_ENET1 {0} \
   CONFIG.PCW_EN_GPIO {1} \
   CONFIG.PCW_EN_I2C0 {0} \
   CONFIG.PCW_EN_I2C1 {0} \
   CONFIG.PCW_EN_MODEM_UART0 {0} \
   CONFIG.PCW_EN_MODEM_UART1 {0} \
   CONFIG.PCW_EN_PJTAG {0} \
   CONFIG.PCW_EN_PTP_ENET0 {0} \
   CONFIG.PCW_EN_PTP_ENET1 {0} \
   CONFIG.PCW_EN_QSPI {1} \
   CONFIG.PCW_EN_RST0_PORT {1} \
   CONFIG.PCW_EN_RST1_PORT {0} \
   CONFIG.PCW_EN_RST2_PORT {0} \
   CONFIG.PCW_EN_RST3_PORT {0} \
   CONFIG.PCW_EN_SDIO0 {1} \
   CONFIG.PCW_EN_SDIO1 {0} \
   CONFIG.PCW_EN_SMC {0} \
   CONFIG.PCW_EN_SPI0 {0} \
   CONFIG.PCW_EN_SPI1 {0} \
   CONFIG.PCW_EN_TRACE {0} \
   CONFIG.PCW_EN_TTC0 {0} \
   CONFIG.PCW_EN_TTC1 {0} \
   CONFIG.PCW_EN_UART0 {1} \
   CONFIG.PCW_EN_UART1 {0} \
   CONFIG.PCW_EN_USB0 {1} \
   CONFIG.PCW_EN_USB1 {0} \
   CONFIG.PCW_EN_WDT {0} \
   CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {10} \
   CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {4} \
   CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
   CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
   CONFIG.PCW_FCLK_CLK2_BUF {FALSE} \
   CONFIG.PCW_FCLK_CLK3_BUF {FALSE} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {10} \
   CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_GP0_EN_MODIFIABLE_TXN {1} \
   CONFIG.PCW_GP0_NUM_READ_THREADS {4} \
   CONFIG.PCW_GP0_NUM_WRITE_THREADS {4} \
   CONFIG.PCW_GP1_EN_MODIFIABLE_TXN {1} \
   CONFIG.PCW_GP1_NUM_READ_THREADS {4} \
   CONFIG.PCW_GP1_NUM_WRITE_THREADS {4} \
   CONFIG.PCW_GPIO_BASEADDR {0xE000A000} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
   CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {64} \
   CONFIG.PCW_GPIO_HIGHADDR {0xE000AFFF} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
   CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C0_BASEADDR {0xE0004000} \
   CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C0_HIGHADDR {0xE0004FFF} \
   CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_BASEADDR {0xE0005000} \
   CONFIG.PCW_I2C1_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C1_HIGHADDR {0xE0005FFF} \
   CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_I2C_RESET_ENABLE {1} \
   CONFIG.PCW_I2C_RESET_POLARITY {Active Low} \
   CONFIG.PCW_IMPORT_BOARD_PRESET {None} \
   CONFIG.PCW_INCLUDE_ACP_TRANS_CHECK {0} \
   CONFIG.PCW_INCLUDE_TRACE_BUFFER {0} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {20} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
   CONFIG.PCW_IRQ_F2P_INTR {0} \
   CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
   CONFIG.PCW_MIO_0_DIRECTION {inout} \
   CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_0_PULLUP {enabled} \
   CONFIG.PCW_MIO_0_SLEW {slow} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {enabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {enabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {enabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {enabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {in} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {enabled} \
   CONFIG.PCW_MIO_14_SLEW {slow} \
   CONFIG.PCW_MIO_15_DIRECTION {out} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {enabled} \
   CONFIG.PCW_MIO_15_SLEW {slow} \
   CONFIG.PCW_MIO_16_DIRECTION {out} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_16_PULLUP {enabled} \
   CONFIG.PCW_MIO_16_SLEW {slow} \
   CONFIG.PCW_MIO_17_DIRECTION {out} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_17_PULLUP {enabled} \
   CONFIG.PCW_MIO_17_SLEW {slow} \
   CONFIG.PCW_MIO_18_DIRECTION {out} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_18_PULLUP {enabled} \
   CONFIG.PCW_MIO_18_SLEW {slow} \
   CONFIG.PCW_MIO_19_DIRECTION {out} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_19_PULLUP {enabled} \
   CONFIG.PCW_MIO_19_SLEW {slow} \
   CONFIG.PCW_MIO_1_DIRECTION {out} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {enabled} \
   CONFIG.PCW_MIO_1_SLEW {slow} \
   CONFIG.PCW_MIO_20_DIRECTION {out} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_20_PULLUP {enabled} \
   CONFIG.PCW_MIO_20_SLEW {slow} \
   CONFIG.PCW_MIO_21_DIRECTION {out} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_21_PULLUP {enabled} \
   CONFIG.PCW_MIO_21_SLEW {slow} \
   CONFIG.PCW_MIO_22_DIRECTION {in} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_22_PULLUP {enabled} \
   CONFIG.PCW_MIO_22_SLEW {slow} \
   CONFIG.PCW_MIO_23_DIRECTION {in} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_23_PULLUP {enabled} \
   CONFIG.PCW_MIO_23_SLEW {slow} \
   CONFIG.PCW_MIO_24_DIRECTION {in} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_24_PULLUP {enabled} \
   CONFIG.PCW_MIO_24_SLEW {slow} \
   CONFIG.PCW_MIO_25_DIRECTION {in} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_25_PULLUP {enabled} \
   CONFIG.PCW_MIO_25_SLEW {slow} \
   CONFIG.PCW_MIO_26_DIRECTION {in} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_26_PULLUP {enabled} \
   CONFIG.PCW_MIO_26_SLEW {slow} \
   CONFIG.PCW_MIO_27_DIRECTION {in} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_27_PULLUP {enabled} \
   CONFIG.PCW_MIO_27_SLEW {slow} \
   CONFIG.PCW_MIO_28_DIRECTION {inout} \
   CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_28_PULLUP {enabled} \
   CONFIG.PCW_MIO_28_SLEW {slow} \
   CONFIG.PCW_MIO_29_DIRECTION {in} \
   CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_29_PULLUP {enabled} \
   CONFIG.PCW_MIO_29_SLEW {slow} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {slow} \
   CONFIG.PCW_MIO_30_DIRECTION {out} \
   CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_30_PULLUP {enabled} \
   CONFIG.PCW_MIO_30_SLEW {slow} \
   CONFIG.PCW_MIO_31_DIRECTION {in} \
   CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_31_PULLUP {enabled} \
   CONFIG.PCW_MIO_31_SLEW {slow} \
   CONFIG.PCW_MIO_32_DIRECTION {inout} \
   CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_32_PULLUP {enabled} \
   CONFIG.PCW_MIO_32_SLEW {slow} \
   CONFIG.PCW_MIO_33_DIRECTION {inout} \
   CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_33_PULLUP {enabled} \
   CONFIG.PCW_MIO_33_SLEW {slow} \
   CONFIG.PCW_MIO_34_DIRECTION {inout} \
   CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_34_PULLUP {enabled} \
   CONFIG.PCW_MIO_34_SLEW {slow} \
   CONFIG.PCW_MIO_35_DIRECTION {inout} \
   CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_35_PULLUP {enabled} \
   CONFIG.PCW_MIO_35_SLEW {slow} \
   CONFIG.PCW_MIO_36_DIRECTION {in} \
   CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_36_PULLUP {enabled} \
   CONFIG.PCW_MIO_36_SLEW {slow} \
   CONFIG.PCW_MIO_37_DIRECTION {inout} \
   CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_37_PULLUP {enabled} \
   CONFIG.PCW_MIO_37_SLEW {slow} \
   CONFIG.PCW_MIO_38_DIRECTION {inout} \
   CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_38_PULLUP {enabled} \
   CONFIG.PCW_MIO_38_SLEW {slow} \
   CONFIG.PCW_MIO_39_DIRECTION {inout} \
   CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_39_PULLUP {enabled} \
   CONFIG.PCW_MIO_39_SLEW {slow} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {slow} \
   CONFIG.PCW_MIO_40_DIRECTION {inout} \
   CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_40_PULLUP {enabled} \
   CONFIG.PCW_MIO_40_SLEW {slow} \
   CONFIG.PCW_MIO_41_DIRECTION {inout} \
   CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_41_PULLUP {enabled} \
   CONFIG.PCW_MIO_41_SLEW {slow} \
   CONFIG.PCW_MIO_42_DIRECTION {inout} \
   CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_42_PULLUP {enabled} \
   CONFIG.PCW_MIO_42_SLEW {slow} \
   CONFIG.PCW_MIO_43_DIRECTION {inout} \
   CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_43_PULLUP {enabled} \
   CONFIG.PCW_MIO_43_SLEW {slow} \
   CONFIG.PCW_MIO_44_DIRECTION {inout} \
   CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_44_PULLUP {enabled} \
   CONFIG.PCW_MIO_44_SLEW {slow} \
   CONFIG.PCW_MIO_45_DIRECTION {inout} \
   CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_45_PULLUP {enabled} \
   CONFIG.PCW_MIO_45_SLEW {slow} \
   CONFIG.PCW_MIO_46_DIRECTION {out} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_46_PULLUP {enabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {in} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_47_PULLUP {enabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_48_DIRECTION {inout} \
   CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_48_PULLUP {enabled} \
   CONFIG.PCW_MIO_48_SLEW {slow} \
   CONFIG.PCW_MIO_49_DIRECTION {inout} \
   CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_49_PULLUP {enabled} \
   CONFIG.PCW_MIO_49_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {slow} \
   CONFIG.PCW_MIO_50_DIRECTION {inout} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_50_PULLUP {enabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_51_PULLUP {enabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {out} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_52_PULLUP {enabled} \
   CONFIG.PCW_MIO_52_SLEW {slow} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_53_PULLUP {enabled} \
   CONFIG.PCW_MIO_53_SLEW {slow} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {slow} \
   CONFIG.PCW_MIO_6_DIRECTION {out} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {slow} \
   CONFIG.PCW_MIO_7_DIRECTION {out} \
   CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_7_PULLUP {disabled} \
   CONFIG.PCW_MIO_7_SLEW {slow} \
   CONFIG.PCW_MIO_8_DIRECTION {out} \
   CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_8_PULLUP {disabled} \
   CONFIG.PCW_MIO_8_SLEW {slow} \
   CONFIG.PCW_MIO_9_DIRECTION {out} \
   CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_9_PULLUP {enabled} \
   CONFIG.PCW_MIO_9_SLEW {slow} \
   CONFIG.PCW_MIO_PRIMITIVE {54} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS { \
     0#Enet 0 \
     0#Enet 0 \
     0#Enet 0 \
     0#Enet 0 \
     0#Enet 0 \
     0#Enet 0 \
     0#Enet 0 \
     0#SD 0#USB \
     0#SD 0#USB \
     0#SD 0#USB \
     0#UART 0#Enet \
     0#USB 0#SD \
     0#USB 0#SD \
     0#USB 0#SD \
     0#USB 0#SD \
     0#USB 0#SD \
     0#USB 0#SD \
     Flash#ENET Reset#GPIO#GPIO#GPIO#GPIO#UART \
     Flash#GPIO#Quad SPI \
     Flash#Quad SPI \
     Flash#Quad SPI \
     Flash#Quad SPI \
     Flash#Quad SPI \
     Flash#Quad SPI \
     GPIO#Quad SPI \
     Reset#SD 0#GPIO#GPIO#GPIO#GPIO#Enet \
   } \
   CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#gpio[7]#qspi_fbclk#reset#gpio[10]#gpio[11]#gpio[12]#gpio[13]#rx#tx#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#reset#cd#gpio[48]#gpio[49]#gpio[50]#gpio[51]#mdc#mdio} \
   CONFIG.PCW_M_AXI_GP0_ENABLE_STATIC_REMAP {0} \
   CONFIG.PCW_M_AXI_GP0_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP0_SUPPORT_NARROW_BURST {0} \
   CONFIG.PCW_M_AXI_GP0_THREAD_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP1_ENABLE_STATIC_REMAP {0} \
   CONFIG.PCW_M_AXI_GP1_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP1_SUPPORT_NARROW_BURST {0} \
   CONFIG.PCW_M_AXI_GP1_THREAD_ID_WIDTH {12} \
   CONFIG.PCW_NAND_CYCLES_T_AR {1} \
   CONFIG.PCW_NAND_CYCLES_T_CLR {1} \
   CONFIG.PCW_NAND_CYCLES_T_RC {11} \
   CONFIG.PCW_NAND_CYCLES_T_REA {1} \
   CONFIG.PCW_NAND_CYCLES_T_RR {1} \
   CONFIG.PCW_NAND_CYCLES_T_WC {11} \
   CONFIG.PCW_NAND_CYCLES_T_WP {1} \
   CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
   CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_CS0_T_CEOE {1} \
   CONFIG.PCW_NOR_CS0_T_PC {1} \
   CONFIG.PCW_NOR_CS0_T_RC {11} \
   CONFIG.PCW_NOR_CS0_T_TR {1} \
   CONFIG.PCW_NOR_CS0_T_WC {11} \
   CONFIG.PCW_NOR_CS0_T_WP {1} \
   CONFIG.PCW_NOR_CS0_WE_TIME {0} \
   CONFIG.PCW_NOR_CS1_T_CEOE {1} \
   CONFIG.PCW_NOR_CS1_T_PC {1} \
   CONFIG.PCW_NOR_CS1_T_RC {11} \
   CONFIG.PCW_NOR_CS1_T_TR {1} \
   CONFIG.PCW_NOR_CS1_T_WC {11} \
   CONFIG.PCW_NOR_CS1_T_WP {1} \
   CONFIG.PCW_NOR_CS1_WE_TIME {0} \
   CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
   CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_SRAM_CS0_T_CEOE {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_PC {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_RC {11} \
   CONFIG.PCW_NOR_SRAM_CS0_T_TR {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_WC {11} \
   CONFIG.PCW_NOR_SRAM_CS0_T_WP {1} \
   CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {0} \
   CONFIG.PCW_NOR_SRAM_CS1_T_CEOE {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_PC {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_RC {11} \
   CONFIG.PCW_NOR_SRAM_CS1_T_TR {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_WC {11} \
   CONFIG.PCW_NOR_SRAM_CS1_T_WP {1} \
   CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {0} \
   CONFIG.PCW_OVERRIDE_BASIC_CLOCK {0} \
   CONFIG.PCW_P2F_CAN0_INTR {0} \
   CONFIG.PCW_P2F_CAN1_INTR {0} \
   CONFIG.PCW_P2F_CTI_INTR {0} \
   CONFIG.PCW_P2F_DMAC0_INTR {0} \
   CONFIG.PCW_P2F_DMAC1_INTR {0} \
   CONFIG.PCW_P2F_DMAC2_INTR {0} \
   CONFIG.PCW_P2F_DMAC3_INTR {0} \
   CONFIG.PCW_P2F_DMAC4_INTR {0} \
   CONFIG.PCW_P2F_DMAC5_INTR {0} \
   CONFIG.PCW_P2F_DMAC6_INTR {0} \
   CONFIG.PCW_P2F_DMAC7_INTR {0} \
   CONFIG.PCW_P2F_DMAC_ABORT_INTR {0} \
   CONFIG.PCW_P2F_ENET0_INTR {0} \
   CONFIG.PCW_P2F_ENET1_INTR {0} \
   CONFIG.PCW_P2F_GPIO_INTR {0} \
   CONFIG.PCW_P2F_I2C0_INTR {0} \
   CONFIG.PCW_P2F_I2C1_INTR {0} \
   CONFIG.PCW_P2F_QSPI_INTR {0} \
   CONFIG.PCW_P2F_SDIO0_INTR {0} \
   CONFIG.PCW_P2F_SDIO1_INTR {0} \
   CONFIG.PCW_P2F_SMC_INTR {0} \
   CONFIG.PCW_P2F_SPI0_INTR {0} \
   CONFIG.PCW_P2F_SPI1_INTR {0} \
   CONFIG.PCW_P2F_UART0_INTR {0} \
   CONFIG.PCW_P2F_UART1_INTR {0} \
   CONFIG.PCW_P2F_USB0_INTR {0} \
   CONFIG.PCW_P2F_USB1_INTR {0} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.279} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.260} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.085} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.092} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.051} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {-0.006} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.009} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.033} \
   CONFIG.PCW_PACKAGE_NAME {clg400} \
   CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_PERIPHERAL_BOARD_PRESET {part0} \
   CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_PLL_BYPASSMODE_ENABLE {0} \
   CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 3.3V} \
   CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
   CONFIG.PCW_PS7_SI_REV {PRODUCTION} \
   CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8} \
   CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
   CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_QSPI_INTERNAL_HIGHADDRESS {0xFCFFFFFF} \
   CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
   CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
   CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
   CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
   CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
   CONFIG.PCW_SD1_GRP_CD_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_WP_ENABLE {0} \
   CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SDIO0_BASEADDR {0xE0100000} \
   CONFIG.PCW_SDIO0_HIGHADDR {0xE0100FFF} \
   CONFIG.PCW_SDIO1_BASEADDR {0xE0101000} \
   CONFIG.PCW_SDIO1_HIGHADDR {0xE0101FFF} \
   CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
   CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
   CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
   CONFIG.PCW_SMC_CYCLE_T0 {NA} \
   CONFIG.PCW_SMC_CYCLE_T1 {NA} \
   CONFIG.PCW_SMC_CYCLE_T2 {NA} \
   CONFIG.PCW_SMC_CYCLE_T3 {NA} \
   CONFIG.PCW_SMC_CYCLE_T4 {NA} \
   CONFIG.PCW_SMC_CYCLE_T5 {NA} \
   CONFIG.PCW_SMC_CYCLE_T6 {NA} \
   CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_SMC_PERIPHERAL_VALID {0} \
   CONFIG.PCW_SPI0_BASEADDR {0xE0006000} \
   CONFIG.PCW_SPI0_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI0_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI0_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI0_HIGHADDR {0xE0006FFF} \
   CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI1_BASEADDR {0xE0007000} \
   CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI1_HIGHADDR {0xE0007FFF} \
   CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
   CONFIG.PCW_SPI_PERIPHERAL_VALID {0} \
   CONFIG.PCW_S_AXI_ACP_ARUSER_VAL {31} \
   CONFIG.PCW_S_AXI_ACP_AWUSER_VAL {31} \
   CONFIG.PCW_S_AXI_ACP_ID_WIDTH {3} \
   CONFIG.PCW_S_AXI_GP0_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_GP1_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP0_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP1_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP2_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP3_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP3_ID_WIDTH {6} \
   CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_TRACE_BUFFER_CLOCK_DELAY {12} \
   CONFIG.PCW_TRACE_BUFFER_FIFO_SIZE {128} \
   CONFIG.PCW_TRACE_GRP_16BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_2BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_32BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_4BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_8BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_INTERNAL_WIDTH {2} \
   CONFIG.PCW_TRACE_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TRACE_PIPELINE_WIDTH {8} \
   CONFIG.PCW_TTC0_BASEADDR {0xE0104000} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_HIGHADDR {0xE0104fff} \
   CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TTC1_BASEADDR {0xE0105000} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_HIGHADDR {0xE0105fff} \
   CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_UART0_BASEADDR {0xE0000000} \
   CONFIG.PCW_UART0_BAUD_RATE {115200} \
   CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART0_HIGHADDR {0xE0000FFF} \
   CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART0_UART0_IO {MIO 14 .. 15} \
   CONFIG.PCW_UART1_BASEADDR {0xE0001000} \
   CONFIG.PCW_UART1_BAUD_RATE {115200} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_HIGHADDR {0xE0001FFF} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_UART_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {525.000000} \
   CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {0} \
   CONFIG.PCW_UIPARAM_DDR_AL {0} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BL {8} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.279} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.260} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.085} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.092} \
   CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {27.95} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {80.4535} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {27.95} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {80.4535} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {80.4535} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {80.4535} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {32.14} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {105.056} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {31.12} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {66.904} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {89.1715} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {113.63} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.051} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {-0.006} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.009} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.033} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {32.2} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {98.503} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {31.08} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {68.5855} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {90.295} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {0} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {103.977} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
   CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
   CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {525} \
   CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)} \
   CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.91} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {0} \
   CONFIG.PCW_UIPARAM_GENERATE_SUMMARY {NA} \
   CONFIG.PCW_USB0_BASEADDR {0xE0102000} \
   CONFIG.PCW_USB0_HIGHADDR {0xE0102fff} \
   CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB0_RESET_ENABLE {1} \
   CONFIG.PCW_USB0_RESET_IO {MIO 46} \
   CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
   CONFIG.PCW_USB1_BASEADDR {0xE0103000} \
   CONFIG.PCW_USB1_HIGHADDR {0xE0103fff} \
   CONFIG.PCW_USB1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_USB1_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {1} \
   CONFIG.PCW_USB_RESET_POLARITY {Active Low} \
   CONFIG.PCW_USB_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_USE_AXI_FABRIC_IDLE {0} \
   CONFIG.PCW_USE_AXI_NONSECURE {0} \
   CONFIG.PCW_USE_CORESIGHT {0} \
   CONFIG.PCW_USE_CROSS_TRIGGER {0} \
   CONFIG.PCW_USE_CR_FABRIC {1} \
   CONFIG.PCW_USE_DDR_BYPASS {0} \
   CONFIG.PCW_USE_DEBUG {0} \
   CONFIG.PCW_USE_DEFAULT_ACP_USER_VAL {0} \
   CONFIG.PCW_USE_DMA0 {0} \
   CONFIG.PCW_USE_DMA1 {0} \
   CONFIG.PCW_USE_DMA2 {0} \
   CONFIG.PCW_USE_DMA3 {0} \
   CONFIG.PCW_USE_EXPANDED_IOP {0} \
   CONFIG.PCW_USE_EXPANDED_PS_SLCR_REGISTERS {0} \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {0} \
   CONFIG.PCW_USE_HIGH_OCM {0} \
   CONFIG.PCW_USE_M_AXI_GP0 {1} \
   CONFIG.PCW_USE_M_AXI_GP1 {0} \
   CONFIG.PCW_USE_PROC_EVENT_BUS {0} \
   CONFIG.PCW_USE_PS_SLCR_REGISTERS {0} \
   CONFIG.PCW_USE_S_AXI_ACP {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_GP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP0 {0} \
   CONFIG.PCW_USE_S_AXI_HP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP2 {0} \
   CONFIG.PCW_USE_S_AXI_HP3 {0} \
   CONFIG.PCW_USE_TRACE {0} \
   CONFIG.PCW_USE_TRACE_DATA_EDGE_DETECTOR {0} \
   CONFIG.PCW_VALUE_SILVERSION {3} \
   CONFIG.PCW_WDT_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_WDT_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.preset {None} \
 ] $processing_system7_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports iic_rtl] [get_bd_intf_pins clock_domain_audio/iic_rtl]
  connect_bd_intf_net -intf_net clock_domain_hdmi_DDC_1 [get_bd_intf_ports DDC_0] [get_bd_intf_pins clock_domain_hdmi/DDC_1]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins clock_domain_audio/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net AXI_Effects_led1 [get_bd_ports led1] [get_bd_pins clock_domain_audio/led1]
  connect_bd_net -net AXI_Effects_led2 [get_bd_ports led2] [get_bd_pins clock_domain_audio/led2]
  connect_bd_net -net AXI_Effects_led3 [get_bd_ports led3] [get_bd_pins clock_domain_audio/led3]
  connect_bd_net -net AXI_Effects_led4 [get_bd_ports led4] [get_bd_pins clock_domain_audio/led4]
  connect_bd_net -net AXI_Effects_m_axis1_tdata [get_bd_pins clock_domain_audio/audiodata] [get_bd_pins crossing_clock_domain_audio_hdmi/src_in]
  connect_bd_net -net AXI_Saturation_0_led_bot [get_bd_ports led5_r] [get_bd_pins clock_domain_audio/led5_r]
  connect_bd_net -net AXI_Saturation_0_led_bot_l [get_bd_ports led5_b] [get_bd_pins clock_domain_audio/led5_b]
  connect_bd_net -net AXI_Saturation_0_led_bot_r [get_bd_ports led4_b] [get_bd_pins clock_domain_audio/led4_b]
  connect_bd_net -net AXI_Saturation_0_led_top_r [get_bd_ports led4_r] [get_bd_pins clock_domain_audio/led4_r]
  connect_bd_net -net Buffers_0_out1 [get_bd_ports test_bclk] [get_bd_pins clock_domain_audio/test_bclk]
  connect_bd_net -net Buffers_0_out2 [get_bd_ports test_lrclk] [get_bd_pins clock_domain_audio/test_lrclk]
  connect_bd_net -net Buffers_0_out3 [get_bd_ports test_adc] [get_bd_pins clock_domain_audio/test_adc]
  connect_bd_net -net Buffers_0_out4 [get_bd_ports au_dac] [get_bd_pins clock_domain_audio/au_dac]
  connect_bd_net -net Buffers_0_out5 [get_bd_ports test_dac] [get_bd_pins clock_domain_audio/test_dac]
  connect_bd_net -net bclk_0_1 [get_bd_ports au_bclk] [get_bd_pins clock_domain_audio/au_bclk]
  connect_bd_net -net btn1_1 [get_bd_ports btn1] [get_bd_pins clock_domain_audio/btn1]
  connect_bd_net -net btn2_1 [get_bd_ports btn2] [get_bd_pins clock_domain_audio/btn2]
  connect_bd_net -net btn3_1 [get_bd_ports btn3] [get_bd_pins clock_domain_audio/btn3]
  connect_bd_net -net btn4_1 [get_bd_ports btn4] [get_bd_pins clock_domain_audio/btn4]
  connect_bd_net -net clk_in1_0_1 [get_bd_ports clk] [get_bd_pins clock_domain_hdmi/clk_in1_0]
  connect_bd_net -net clock_domain_50_out1 [get_bd_pins clock_domain_audio/out1] [get_bd_pins crossing_clock_domain_audio_hdmi/In0]
  connect_bd_net -net clock_domain_50_out2 [get_bd_pins clock_domain_audio/out2] [get_bd_pins crossing_clock_domain_audio_hdmi/In1]
  connect_bd_net -net clock_domain_50_out3 [get_bd_pins clock_domain_audio/out3] [get_bd_pins crossing_clock_domain_audio_hdmi/In2]
  connect_bd_net -net clock_domain_50_out4 [get_bd_pins clock_domain_audio/out4] [get_bd_pins crossing_clock_domain_audio_hdmi/In3]
  connect_bd_net -net clock_domain_50_src_send [get_bd_pins clock_domain_audio/src_send] [get_bd_pins crossing_clock_domain_audio_hdmi/src_send]
  connect_bd_net -net clock_domain_hdmi_dout_0 [get_bd_ports hdmi_rx_hpd] [get_bd_ports hdmi_tx_hpdn] [get_bd_pins clock_domain_hdmi/dout_0]
  connect_bd_net -net crossing_clock_domain_50_hdmi_dest_out1 [get_bd_pins clock_domain_hdmi/soundinput] [get_bd_pins crossing_clock_domain_audio_hdmi/dest_out1]
  connect_bd_net -net dest_clk_1 [get_bd_pins clock_domain_hdmi/pixel_clk] [get_bd_pins crossing_clock_domain_audio_hdmi/dest_clk]
  connect_bd_net -net hdmi_out_0_clk_n [get_bd_ports hdmi_tx_clk_n] [get_bd_pins clock_domain_hdmi/clk_n]
  connect_bd_net -net hdmi_out_0_clk_p [get_bd_ports hdmi_tx_clk_p] [get_bd_pins clock_domain_hdmi/clk_p]
  connect_bd_net -net hdmi_out_0_data_n [get_bd_ports hdmi_tx_data_n] [get_bd_pins clock_domain_hdmi/data_n]
  connect_bd_net -net hdmi_out_0_data_p [get_bd_ports hdmi_tx_data_p] [get_bd_pins clock_domain_hdmi/data_p]
  connect_bd_net -net hdmi_rx_clk_n_1 [get_bd_ports hdmi_rx_clk_n] [get_bd_pins clock_domain_hdmi/hdmi_rx_clk_n]
  connect_bd_net -net hdmi_rx_clk_p_1 [get_bd_ports hdmi_rx_clk_p] [get_bd_pins clock_domain_hdmi/hdmi_rx_clk_p]
  connect_bd_net -net hdmi_rx_d_n_1 [get_bd_ports hdmi_rx_data_n] [get_bd_pins clock_domain_hdmi/hdmi_rx_d_n]
  connect_bd_net -net hdmi_rx_d_p_1 [get_bd_ports hdmi_rx_data_p] [get_bd_pins clock_domain_hdmi/hdmi_rx_d_p]
  connect_bd_net -net lrclk_0_1 [get_bd_ports au_lrclk] [get_bd_pins clock_domain_audio/au_lrclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_ports au_mclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clock_domain_audio/s_axi_aclk1] [get_bd_pins crossing_clock_domain_audio_hdmi/src_clk] [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins clock_domain_audio/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net sdata_0_1 [get_bd_ports au_adc] [get_bd_pins clock_domain_audio/au_adc]
  connect_bd_net -net sw1_1 [get_bd_ports sw1] [get_bd_pins clock_domain_hdmi/sw1]
  connect_bd_net -net switch_0_1 [get_bd_ports sw] [get_bd_pins clock_domain_audio/sw]
  connect_bd_net -net xpm_cdc_gen_0_dest_out [get_bd_pins clock_domain_hdmi/sw] [get_bd_pins crossing_clock_domain_audio_hdmi/dest_out]

  # Create address segments
  assign_bd_address -offset 0x43C30000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs clock_domain_audio/AXI_Effects/AXI_Echo_0/s_apb/Reg] -force
  assign_bd_address -offset 0x43C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs clock_domain_audio/AXI_Effects/AXI_Fir_0/s_apb/Reg] -force
  assign_bd_address -offset 0x43C10000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs clock_domain_audio/AXI_Effects/AXI_Gain_0/s_apb/Reg] -force
  assign_bd_address -offset 0x43C20000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs clock_domain_audio/AXI_Effects/AXI_Saturation_0/s_apb/Reg] -force
  assign_bd_address -offset 0x43C40000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs clock_domain_audio/AXI_Effects/FlipFlops_0/s_apb/Reg] -force
  assign_bd_address -offset 0x41600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs clock_domain_audio/axi_iic_0/S_AXI/Reg] -force

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ActiveEmotionalView":"Default View",
   "Color Coded_ExpandedHierarchyInLayout":"",
   "Color Coded_Layout":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS
#  -string -flagsOSRD
preplace port DDR -pg 1 -lvl 5 -x 1420 -y 60 -defaultsOSRD
preplace port FIXED_IO -pg 1 -lvl 5 -x 1420 -y 80 -defaultsOSRD
preplace port iic_rtl -pg 1 -lvl 5 -x 1420 -y 380 -defaultsOSRD
preplace port au_mclk -pg 1 -lvl 5 -x 1420 -y 140 -defaultsOSRD
preplace port au_bclk -pg 1 -lvl 0 -x 0 -y 640 -defaultsOSRD
preplace port au_lrclk -pg 1 -lvl 0 -x 0 -y 660 -defaultsOSRD
preplace port au_adc -pg 1 -lvl 0 -x 0 -y 680 -defaultsOSRD
preplace port au_dac -pg 1 -lvl 5 -x 1420 -y 1150 -defaultsOSRD
preplace port test_bclk -pg 1 -lvl 5 -x 1420 -y 1090 -defaultsOSRD
preplace port test_lrclk -pg 1 -lvl 5 -x 1420 -y 1110 -defaultsOSRD
preplace port test_adc -pg 1 -lvl 5 -x 1420 -y 1130 -defaultsOSRD
preplace port test_dac -pg 1 -lvl 5 -x 1420 -y 1170 -defaultsOSRD
preplace port led1 -pg 1 -lvl 5 -x 1420 -y 690 -defaultsOSRD
preplace port btn1 -pg 1 -lvl 0 -x 0 -y 780 -defaultsOSRD
preplace port btn2 -pg 1 -lvl 0 -x 0 -y 760 -defaultsOSRD
preplace port btn3 -pg 1 -lvl 0 -x 0 -y 740 -defaultsOSRD
preplace port btn4 -pg 1 -lvl 0 -x 0 -y 800 -defaultsOSRD
preplace port led3 -pg 1 -lvl 5 -x 1420 -y 670 -defaultsOSRD
preplace port led4 -pg 1 -lvl 5 -x 1420 -y 790 -defaultsOSRD
preplace port led2 -pg 1 -lvl 5 -x 1420 -y 650 -defaultsOSRD
preplace port sw -pg 1 -lvl 0 -x 0 -y 720 -defaultsOSRD
preplace port led5_b -pg 1 -lvl 5 -x 1420 -y 730 -defaultsOSRD
preplace port led5_r -pg 1 -lvl 5 -x 1420 -y 710 -defaultsOSRD
preplace port led4_r -pg 1 -lvl 5 -x 1420 -y 750 -defaultsOSRD
preplace port led4_b -pg 1 -lvl 5 -x 1420 -y 770 -defaultsOSRD
preplace port sw1 -pg 1 -lvl 0 -x 0 -y 820 -defaultsOSRD
preplace port led4_g -pg 1 -lvl 5 -x 1420 -y 810 -defaultsOSRD
preplace port led5_g -pg 1 -lvl 5 -x 1420 -y 830 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 3 -x 940 -y 120 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 3 -x 940 -y 400 -defaultsOSRD
preplace inst ps7_0_axi_periph -pg 1 -lvl 2 -x 560 -y 390 -defaultsOSRD
preplace inst i2s_transmitter_0 -pg 1 -lvl 4 -x 1280 -y 930 -swap {0 1 2 3 4 8 9 7 5 6} -defaultsOSRD
preplace inst InOutTranslation_0 -pg 1 -lvl 4 -x 1280 -y 1130 -swap {1 2 3 0 4 5 6 7 8} -defaultsOSRD
preplace inst i2s_receiver_0 -pg 1 -lvl 2 -x 560 -y 640 -swap {0 1 2 3 4 7 8 9 5 6} -defaultsOSRD
preplace inst rst_ps7_0_50M -pg 1 -lvl 1 -x 200 -y 350 -defaultsOSRD
preplace inst AXI_Effects -pg 1 -lvl 3 -x 940 -y 730 -defaultsOSRD
preplace netloc bclk_0_1 1 0 4 NJ 640 410 940 NJ 940 1150
preplace netloc lrclk_0_1 1 0 4 NJ 660 390 950 NJ 950 1140
preplace netloc sdata_0_1 1 0 4 NJ 680 370 1160 NJ 1160 NJ
preplace netloc InOutTranslation_0_out1 1 4 1 NJ 1090
preplace netloc InOutTranslation_0_out2 1 4 1 NJ 1110
preplace netloc InOutTranslation_0_out3 1 4 1 NJ 1130
preplace netloc i2s_transmitter_0_sdata 1 3 2 1160 1030 1400
preplace netloc InOutTranslation_0_out4 1 4 1 NJ 1150
preplace netloc InOutTranslation_0_out5 1 4 1 NJ 1170
preplace netloc processing_system7_0_FCLK_CLK0 1 3 2 NJ 140 NJ
preplace netloc AXI_Saturation_0_led_enable 1 3 2 NJ 690 NJ
preplace netloc AXI_Rectification_0_led_enable 1 3 2 NJ 650 NJ
preplace netloc switch_0_1 1 0 3 NJ 720 400J 740 710J
preplace netloc AXI_Saturation_0_led_bot 1 3 2 NJ 710 NJ
preplace netloc AXI_Saturation_0_led_bot_l 1 3 2 NJ 730 NJ
preplace netloc AXI_Saturation_0_led_top_r 1 3 2 NJ 750 NJ
preplace netloc AXI_Saturation_0_led_bot_r 1 3 2 NJ 770 NJ
preplace netloc AXI_Echo_0_led_enable 1 3 2 NJ 670 NJ
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 4 20 250 NJ 250 NJ 250 1140
preplace netloc ARESETN_1 1 1 1 370 350n
preplace netloc processing_system7_0_FCLK_CLK1 1 0 4 30 450 410 530 720 480 1160
preplace netloc rst_ps7_0_50M_peripheral_aresetn 1 1 3 370 540 730 930 NJ
preplace netloc AXI_Effects_led4 1 3 2 NJ 790 NJ
preplace netloc btn3_1 1 0 3 NJ 740 380J 750 740J
preplace netloc btn2_1 1 0 3 NJ 760 NJ 760 NJ
preplace netloc btn1_1 1 0 3 NJ 780 NJ 780 NJ
preplace netloc btn4_1 1 0 3 NJ 800 NJ 800 NJ
preplace netloc switch_0_2 1 0 3 NJ 820 NJ 820 NJ
preplace netloc AXI_Effects_led_g1_0 1 3 2 NJ 810 NJ
preplace netloc AXI_Effects_led_g2_0 1 3 2 NJ 830 NJ
preplace netloc ps7_0_axi_periph_M00_AXI 1 2 1 N 380
preplace netloc processing_system7_0_M_AXI_GP0 1 1 3 410 240 NJ 240 1150
preplace netloc processing_system7_0_FIXED_IO 1 3 2 NJ 80 NJ
preplace netloc i2s_receiver_0_m_axis 1 2 1 N 640
preplace netloc AXI_Echo_0_m_axis 1 3 1 1150 630n
preplace netloc axi_iic_0_IIC 1 3 2 NJ 380 NJ
preplace netloc ps7_0_axi_periph_M01_AXI 1 2 1 710 400n
preplace netloc processing_system7_0_DDR 1 3 2 NJ 60 NJ
levelinfo -pg 1 0 200 560 940 1280 1420
pagesize -pg 1 -db -bbox -sgen -100 0 1540 1230
",
   "Color Coded_ScaleFactor":"0.408943",
   "Color Coded_TopLeft":"-746,0",
   "Default View_ScaleFactor":"0.456932",
   "Default View_TopLeft":"-179,-74",
   "Display-PortTypeClock":"true",
   "Display-PortTypeOthers":"true",
   "Display-PortTypeReset":"true",
   "ExpandedHierarchyInLayout":"",
   "Interfaces View_Layers":"/processing_system7_0_FCLK_CLK1:false|/processing_system7_0_FCLK_RESET0_N:false|/rst_ps7_0_100M_peripheral_aresetn:false|/processing_system7_0_FCLK_CLK0:false|",
   "Interfaces View_ScaleFactor":"1.0",
   "Interfaces View_TopLeft":"-138,-54",
   "No Loops_ExpandedHierarchyInLayout":"",
   "No Loops_Layers":"/processing_system7_0_FCLK_CLK1:true|/processing_system7_0_FCLK_RESET0_N:true|/rst_ps7_0_100M_peripheral_aresetn:true|/processing_system7_0_FCLK_CLK0:true|",
   "No Loops_Layout":"# # String gsaved with Nlview 7.0r4  2019-12-20 bk=1.5203 VDI=41 GEI=36 GUI=JA:10.0 TLS
#  -string -flagsOSRD
preplace port DDR -pg 1 -lvl 9 -x 2990 -y 60 -defaultsOSRD
preplace port FIXED_IO -pg 1 -lvl 9 -x 2990 -y 80 -defaultsOSRD
preplace port iic_rtl -pg 1 -lvl 9 -x 2990 -y 220 -defaultsOSRD
preplace port au_mclk -pg 1 -lvl 9 -x 2990 -y 120 -defaultsOSRD
preplace port au_bclk -pg 1 -lvl 0 -x 0 -y 1020 -defaultsOSRD
preplace port au_lrclk -pg 1 -lvl 0 -x 0 -y 1040 -defaultsOSRD
preplace port au_adc -pg 1 -lvl 0 -x 0 -y 1060 -defaultsOSRD
preplace port au_dac -pg 1 -lvl 9 -x 2990 -y 920 -defaultsOSRD
preplace port test_bclk -pg 1 -lvl 9 -x 2990 -y 860 -defaultsOSRD
preplace port test_lrclk -pg 1 -lvl 9 -x 2990 -y 880 -defaultsOSRD
preplace port test_adc -pg 1 -lvl 9 -x 2990 -y 900 -defaultsOSRD
preplace port test_dac -pg 1 -lvl 9 -x 2990 -y 940 -defaultsOSRD
preplace port led1 -pg 1 -lvl 9 -x 2990 -y 480 -defaultsOSRD
preplace port btn1 -pg 1 -lvl 0 -x 0 -y 340 -defaultsOSRD
preplace port btn2 -pg 1 -lvl 0 -x 0 -y 360 -defaultsOSRD
preplace port btn3 -pg 1 -lvl 0 -x 0 -y 380 -defaultsOSRD
preplace port btn4 -pg 1 -lvl 0 -x 0 -y 400 -defaultsOSRD
preplace port led3 -pg 1 -lvl 9 -x 2990 -y 420 -defaultsOSRD
preplace port led4 -pg 1 -lvl 9 -x 2990 -y 720 -defaultsOSRD
preplace port led2 -pg 1 -lvl 9 -x 2990 -y 440 -defaultsOSRD
preplace port sw -pg 1 -lvl 0 -x 0 -y 640 -defaultsOSRD
preplace port led5_b -pg 1 -lvl 9 -x 2990 -y 1040 -defaultsOSRD
preplace port led5_r -pg 1 -lvl 9 -x 2990 -y 1020 -defaultsOSRD
preplace port led4_r -pg 1 -lvl 9 -x 2990 -y 1060 -defaultsOSRD
preplace port led4_b -pg 1 -lvl 9 -x 2990 -y 460 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 8 -x 2780 -y 60 -swap {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 68 67 69 66} -defaultsOSRD -pinDir DDR right -pinY DDR 0R -pinDir FIXED_IO right -pinY FIXED_IO 20R -pinDir USBIND_0 right -pinY USBIND_0 40R -pinDir M_AXI_GP0 left -pinY M_AXI_GP0 0L -pinDir M_AXI_GP0_ACLK left -pinY M_AXI_GP0_ACLK 40L -pinDir FCLK_CLK0 right -pinY FCLK_CLK0 60R -pinDir FCLK_CLK1 left -pinY FCLK_CLK1 60L -pinDir FCLK_RESET0_N left -pinY FCLK_RESET0_N 20L
preplace inst axi_iic_0 -pg 1 -lvl 8 -x 2780 -y 220 -defaultsOSRD -pinDir S_AXI left -pinY S_AXI 0L -pinDir IIC right -pinY IIC 0R -pinDir s_axi_aclk left -pinY s_axi_aclk 20L -pinDir s_axi_aresetn left -pinY s_axi_aresetn 100L -pinDir iic2intc_irpt right -pinY iic2intc_irpt 20R -pinBusDir gpo right -pinBusY gpo 40R
preplace inst ps7_0_axi_periph -pg 1 -lvl 7 -x 2400 -y 60 -swap {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 78 75 79 76 80 77 81} -defaultsOSRD -pinDir S00_AXI right -pinY S00_AXI 0R -pinDir M00_AXI right -pinY M00_AXI 20R -pinDir M01_AXI left -pinY M01_AXI 0L -pinDir ACLK left -pinY ACLK 20L -pinDir ARESETN left -pinY ARESETN 100L -pinDir S00_ACLK left -pinY S00_ACLK 40L -pinDir S00_ARESETN left -pinY S00_ARESETN 120L -pinDir M00_ACLK left -pinY M00_ACLK 60L -pinDir M00_ARESETN left -pinY M00_ARESETN 140L -pinDir M01_ACLK left -pinY M01_ACLK 80L -pinDir M01_ARESETN left -pinY M01_ARESETN 160L
preplace inst rst_ps7_0_100M -pg 1 -lvl 1 -x 200 -y 460 -swap {1 0 2 3 4 5 6 7 8 9} -defaultsOSRD -pinDir slowest_sync_clk right -pinY slowest_sync_clk 20R -pinDir ext_reset_in right -pinY ext_reset_in 0R -pinDir aux_reset_in left -pinY aux_reset_in 0L -pinDir mb_debug_sys_rst left -pinY mb_debug_sys_rst 20L -pinDir dcm_locked left -pinY dcm_locked 40L -pinDir mb_reset right -pinY mb_reset 40R -pinBusDir bus_struct_reset right -pinBusY bus_struct_reset 60R -pinBusDir peripheral_reset right -pinBusY peripheral_reset 80R -pinBusDir interconnect_aresetn right -pinBusY interconnect_aresetn 100R -pinBusDir peripheral_aresetn right -pinBusY peripheral_aresetn 120R
preplace inst i2s_transmitter_0 -pg 1 -lvl 7 -x 2400 -y 780 -swap {0 1 2 3 4 8 9 7 5 6} -defaultsOSRD -pinDir s_axis left -pinY s_axis 0L -pinDir bclk left -pinY bclk 60L -pinDir lrclk left -pinY lrclk 80L -pinDir sdata right -pinY sdata 80R -pinDir s_axis_aclk left -pinY s_axis_aclk 20L -pinDir s_axis_aresetn left -pinY s_axis_aresetn 40L
preplace inst InOutTranslation_0 -pg 1 -lvl 8 -x 2780 -y 860 -swap {1 2 3 0 4 5 6 7 8} -defaultsOSRD -pinDir in1 left -pinY in1 60L -pinDir in2 left -pinY in2 80L -pinDir in3 left -pinY in3 100L -pinDir in4 left -pinY in4 0L -pinDir out1 right -pinY out1 0R -pinDir out2 right -pinY out2 20R -pinDir out3 right -pinY out3 40R -pinDir out4 right -pinY out4 60R -pinDir out5 right -pinY out5 80R
preplace inst i2s_receiver_0 -pg 1 -lvl 4 -x 1190 -y 740 -swap {0 1 2 3 4 8 9 7 5 6} -defaultsOSRD -pinDir m_axis right -pinY m_axis 0R -pinDir bclk left -pinY bclk 300L -pinDir lrclk left -pinY lrclk 320L -pinDir sdata left -pinY sdata 280L -pinDir m_axis_aclk left -pinY m_axis_aclk 0L -pinDir m_axis_aresetn left -pinY m_axis_aresetn 20L
preplace inst debounce_0 -pg 1 -lvl 2 -x 520 -y 340 -swap {4 5 0 1 2 3 6 7 8 9} -defaultsOSRD -pinDir clk left -pinY clk 140L -pinDir reset_n left -pinY reset_n 160L -pinDir button1 left -pinY button1 0L -pinDir button2 left -pinY button2 20L -pinDir button3 left -pinY button3 40L -pinDir button4 left -pinY button4 60L -pinDir result1 right -pinY result1 100R -pinDir result2 right -pinY result2 120R -pinDir result3 right -pinY result3 140R -pinDir result4 right -pinY result4 160R
preplace inst system_ila_0 -pg 1 -lvl 7 -x 2400 -y 540 -swap {15 1 2 3 4 20 6 7 8 9 10 11 12 13 14 5 16 17 18 19 0 21 22 23 24 25 26} -defaultsOSRD -pinDir SLOT_0_AXIS left -pinY SLOT_0_AXIS 60L -pinDir SLOT_1_AXIS left -pinY SLOT_1_AXIS 80L -pinDir SLOT_2_AXIS left -pinY SLOT_2_AXIS 40L -pinDir SLOT_3_AXIS left -pinY SLOT_3_AXIS 20L -pinDir SLOT_4_AXIS left -pinY SLOT_4_AXIS 0L -pinDir clk left -pinY clk 100L -pinDir resetn left -pinY resetn 120L
preplace inst AXI_Gain_0 -pg 1 -lvl 5 -x 1590 -y 740 -defaultsOSRD -pinDir s_axis left -pinY s_axis 0L -pinDir m_axis right -pinY m_axis 0R -pinDir S_APB_GP0 left -pinY S_APB_GP0 20L -pinDir clk left -pinY clk 40L -pinDir rst left -pinY rst 60L
preplace inst AXI_Rectification_0 -pg 1 -lvl 5 -x 1590 -y 480 -swap {5 1 2 3 4 0 6 7 8 9 13 14 12 11 10} -defaultsOSRD -pinDir s_axis right -pinY s_axis 40R -pinDir m_axis right -pinY m_axis 0R -pinDir clk left -pinY clk 40L -pinDir rst left -pinY rst 60L -pinDir led_enable right -pinY led_enable 60R -pinDir switch left -pinY switch 20L -pinDir enable left -pinY enable 0L
preplace inst Activation_0 -pg 1 -lvl 4 -x 1190 -y 440 -swap {0 1 2 3 4 5 6 7 8 15 17 9 18 10 12 11 14 13 16} -defaultsOSRD -pinDir S_APB_GP0 left -pinY S_APB_GP0 0L -pinDir aclk left -pinY aclk 120L -pinDir aresetn left -pinY aresetn 140L -pinDir IN1 left -pinY IN1 20L -pinDir OUT1 right -pinY OUT1 140R -pinDir IN2 left -pinY IN2 40L -pinDir OUT2 right -pinY OUT2 40R -pinDir IN3 left -pinY IN3 60L -pinDir OUT3 right -pinY OUT3 100R -pinDir IN4 left -pinY IN4 80L -pinDir OUT4 right -pinY OUT4 120R
preplace inst axi_apb_bridge_0 -pg 1 -lvl 3 -x 860 -y 130 -swap {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 44 18 19 20 21 22 23 24 25 17 27 28 29 30 31 32 33 34 26 36 37 38 39 40 41 42 43 35 45 46 47 48 49 50 51 52 53 54} -defaultsOSRD -pinDir AXI4_LITE right -pinY AXI4_LITE 0R -pinDir APB_M right -pinY APB_M 80R -pinDir APB_M2 right -pinY APB_M2 20R -pinDir APB_M3 right -pinY APB_M3 40R -pinDir APB_M4 right -pinY APB_M4 60R -pinDir s_axi_aclk left -pinY s_axi_aclk 0L -pinDir s_axi_aresetn left -pinY s_axi_aresetn 20L
preplace inst AXI_Saturation_0 -pg 1 -lvl 6 -x 1970 -y 740 -swap {0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 22 23 24 25 21 26} -defaultsOSRD -pinDir s_axis left -pinY s_axis 0L -pinDir m_axis right -pinY m_axis 0R -pinDir S_APB_GP0 left -pinY S_APB_GP0 20L -pinDir clk left -pinY clk 40L -pinDir rst left -pinY rst 60L -pinDir led_enable right -pinY led_enable 40R -pinDir led_top_l right -pinY led_top_l 280R -pinDir led_bot_l right -pinY led_bot_l 300R -pinDir led_top_r right -pinY led_top_r 320R -pinDir led_bot_r right -pinY led_bot_r 20R -pinDir enable left -pinY enable 100L
preplace inst AXI_Echo_0 -pg 1 -lvl 6 -x 1970 -y 300 -swap {10 1 2 3 4 5 6 7 8 9 0 11 12 13 14 15 16 17 18 20 22 21 19} -defaultsOSRD -pinDir s_axis left -pinY s_axis 20L -pinDir m_axis right -pinY m_axis 40R -pinDir S_APB_GP0 left -pinY S_APB_GP0 0L -pinDir clk left -pinY clk 140L -pinDir rst left -pinY rst 160L -pinDir led_enable right -pinY led_enable 120R -pinDir enable left -pinY enable 120L
preplace netloc processing_system7_0_FCLK_RESET0_N 1 1 7 380 280 NJ 280 N 280 NJ 280 1730J 240 2250J 280 2570J
preplace netloc rst_ps7_0_100M_peripheral_aresetn 1 1 7 400 580 690 680 1050 680 1450 680 1810 660 2230 320 NJ
preplace netloc bclk_0_1 1 0 8 NJ 1020 NJ 1020 710 1140 1010 1140 NJ 1140 NJ 1140 2170 920 NJ
preplace netloc lrclk_0_1 1 0 8 NJ 1040 NJ 1040 630 1160 1050 1160 NJ 1160 NJ 1160 2230 940 NJ
preplace netloc sdata_0_1 1 0 8 NJ 1060 NJ 1060 670 1120 990 1120 NJ 1120 NJ 1120 NJ 1120 2570J
preplace netloc InOutTranslation_0_out1 1 8 1 NJ 860
preplace netloc InOutTranslation_0_out2 1 8 1 NJ 880
preplace netloc InOutTranslation_0_out3 1 8 1 NJ 900
preplace netloc i2s_transmitter_0_sdata 1 7 1 N 860
preplace netloc InOutTranslation_0_out4 1 8 1 NJ 920
preplace netloc InOutTranslation_0_out5 1 8 1 NJ 940
preplace netloc button1_0_1 1 0 2 NJ 340 NJ
preplace netloc button2_0_1 1 0 2 NJ 360 NJ
preplace netloc button3_0_1 1 0 2 NJ 380 NJ
preplace netloc button4_0_1 1 0 2 NJ 400 NJ
preplace netloc debounce_0_result1 1 2 2 730 460 N
preplace netloc processing_system7_0_FCLK_CLK1 1 1 7 380 560 670 660 1010 660 1430 660 1790 640 2210 300 2590
preplace netloc processing_system7_0_FCLK_CLK0 1 8 1 NJ 120
preplace netloc Activation_0_OUT1 1 4 2 1330 860 1770J
preplace netloc AXI_Saturation_0_led_enable 1 6 3 2130J 480 NJ 480 NJ
preplace netloc AXI_Rectification_0_led_enable 1 5 4 NJ 540 2150J 440 NJ 440 NJ
preplace netloc switch_0_1 1 0 5 NJ 640 NJ 640 NJ 640 N 640 1350J
preplace netloc AXI_Saturation_0_led_bot 1 6 3 NJ 1020 NJ 1020 NJ
preplace netloc debounce_0_result2 1 2 2 710 480 N
preplace netloc debounce_0_result3 1 2 2 650 500 N
preplace netloc debounce_0_result4 1 2 2 630 520 N
preplace netloc Activation_0_OUT2 1 4 1 N 480
preplace netloc Activation_0_OUT4 1 4 5 1370J 640 1730J 680 2150J 720 NJ 720 NJ
preplace netloc AXI_Saturation_0_led_bot_l 1 6 3 NJ 1040 NJ 1040 NJ
preplace netloc AXI_Saturation_0_led_top_r 1 6 3 NJ 1060 NJ 1060 NJ
preplace netloc AXI_Saturation_0_led_bot_r 1 6 3 2190J 460 NJ 460 NJ
preplace netloc Activation_0_OUT3 1 4 2 1410 600 1730J
preplace netloc AXI_Echo_0_led_enable 1 6 3 NJ 420 NJ 420 NJ
preplace netloc AXI_Echo_0_m_axis 1 6 1 2170 340n
preplace netloc AXI_Rectification_0_m_axis 1 5 2 1830 560 N
preplace netloc processing_system7_0_DDR 1 8 1 NJ 60
preplace netloc processing_system7_0_M_AXI_GP0 1 7 1 N 60
preplace netloc ps7_0_axi_periph_M00_AXI 1 7 1 2550 80n
preplace netloc processing_system7_0_FIXED_IO 1 8 1 NJ 80
preplace netloc axi_iic_0_IIC 1 8 1 NJ 220
preplace netloc AXI_Gain_0_m_axis 1 5 2 1830 620 NJ
preplace netloc i2s_receiver_0_m_axis 1 4 3 1410 620 1770J 600 NJ
preplace netloc AXI_Saturation_0_m_axis 1 5 2 NJ 520 2110
preplace netloc axi_apb_bridge_0_APB_M 1 3 1 1010 210n
preplace netloc axi_apb_bridge_0_APB_M4 1 3 2 1050J 170 1390
preplace netloc axi_apb_bridge_0_APB_M3 1 3 3 1030J 150 NJ 150 1750
preplace netloc axi_apb_bridge_0_APB_M2 1 3 3 1010J 130 NJ 130 1830
preplace netloc ps7_0_axi_periph_M01_AXI 1 3 4 990J 0 NJ 0 NJ 0 2250J
levelinfo -pg 1 0 200 520 860 1190 1590 1970 2400 2780 2990
pagesize -pg 1 -db -bbox -sgen -110 -20 3110 1170
",
   "No Loops_ScaleFactor":"0.435043",
   "No Loops_TopLeft":"-103,2",
   "guistr":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS
#  -string -flagsOSRD
preplace port DDR -pg 1 -lvl 3 -x 870 -y 670 -defaultsOSRD
preplace port FIXED_IO -pg 1 -lvl 3 -x 870 -y 690 -defaultsOSRD
preplace port iic_rtl -pg 1 -lvl 3 -x 870 -y 70 -defaultsOSRD
preplace port DDC_0 -pg 1 -lvl 3 -x 870 -y 820 -defaultsOSRD
preplace port au_adc -pg 1 -lvl 0 -x -10 -y 220 -defaultsOSRD
preplace port au_bclk -pg 1 -lvl 0 -x -10 -y 180 -defaultsOSRD
preplace port au_dac -pg 1 -lvl 3 -x 870 -y 150 -defaultsOSRD
preplace port au_lrclk -pg 1 -lvl 0 -x -10 -y 200 -defaultsOSRD
preplace port au_mclk -pg 1 -lvl 3 -x 870 -y 750 -defaultsOSRD
preplace port btn1 -pg 1 -lvl 0 -x -10 -y 320 -defaultsOSRD
preplace port btn2 -pg 1 -lvl 0 -x -10 -y 260 -defaultsOSRD
preplace port btn3 -pg 1 -lvl 0 -x -10 -y 300 -defaultsOSRD
preplace port btn4 -pg 1 -lvl 0 -x -10 -y 280 -defaultsOSRD
preplace port led1 -pg 1 -lvl 3 -x 870 -y 190 -defaultsOSRD
preplace port led2 -pg 1 -lvl 3 -x 870 -y 210 -defaultsOSRD
preplace port led3 -pg 1 -lvl 3 -x 870 -y 230 -defaultsOSRD
preplace port led4 -pg 1 -lvl 3 -x 870 -y 250 -defaultsOSRD
preplace port led4_b -pg 1 -lvl 3 -x 870 -y 270 -defaultsOSRD
preplace port led4_r -pg 1 -lvl 3 -x 870 -y 290 -defaultsOSRD
preplace port led5_b -pg 1 -lvl 3 -x 870 -y 310 -defaultsOSRD
preplace port led5_r -pg 1 -lvl 3 -x 870 -y 330 -defaultsOSRD
preplace port sw -pg 1 -lvl 0 -x -10 -y 240 -defaultsOSRD
preplace port test_adc -pg 1 -lvl 3 -x 870 -y 130 -defaultsOSRD
preplace port test_bclk -pg 1 -lvl 3 -x 870 -y 90 -defaultsOSRD
preplace port test_dac -pg 1 -lvl 3 -x 870 -y 170 -defaultsOSRD
preplace port test_lrclk -pg 1 -lvl 3 -x 870 -y 110 -defaultsOSRD
preplace port hdmi_tx_clk_p -pg 1 -lvl 3 -x 870 -y 840 -defaultsOSRD
preplace port hdmi_tx_clk_n -pg 1 -lvl 3 -x 870 -y 860 -defaultsOSRD
preplace port hdmi_rx_clk_p -pg 1 -lvl 0 -x -10 -y 870 -defaultsOSRD
preplace port hdmi_rx_clk_n -pg 1 -lvl 0 -x -10 -y 850 -defaultsOSRD
preplace port clk -pg 1 -lvl 0 -x -10 -y 930 -defaultsOSRD
preplace port sw1 -pg 1 -lvl 0 -x -10 -y 950 -defaultsOSRD
preplace portBus hdmi_tx_data_p -pg 1 -lvl 3 -x 870 -y 880 -defaultsOSRD
preplace portBus hdmi_tx_data_n -pg 1 -lvl 3 -x 870 -y 900 -defaultsOSRD
preplace portBus hdmi_rx_data_p -pg 1 -lvl 0 -x -10 -y 910 -defaultsOSRD
preplace portBus hdmi_rx_data_n -pg 1 -lvl 0 -x -10 -y 890 -defaultsOSRD
preplace portBus hdmi_rx_hpd -pg 1 -lvl 3 -x 870 -y 920 -defaultsOSRD
preplace portBus hdmi_tx_hpdn -pg 1 -lvl 3 -x 870 -y 940 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 1 -x 280 -y 730 -defaultsOSRD
preplace inst clock_domain_audio -pg 1 -lvl 2 -x 680 -y 260 -defaultsOSRD
preplace inst clock_domain_hdmi -pg 1 -lvl 2 -x 680 -y 880 -defaultsOSRD
preplace inst crossing_clock_domain_audio_hdmi -pg 1 -lvl 1 -x 280 -y 430 -defaultsOSRD
preplace netloc AXI_Saturation_0_led_bot 1 2 1 NJ 330
preplace netloc AXI_Saturation_0_led_bot_l 1 2 1 NJ 310
preplace netloc AXI_Saturation_0_led_bot_r 1 2 1 NJ 270
preplace netloc AXI_Saturation_0_led_top_r 1 2 1 NJ 290
preplace netloc Buffers_0_out1 1 2 1 NJ 90
preplace netloc Buffers_0_out2 1 2 1 NJ 110
preplace netloc Buffers_0_out3 1 2 1 NJ 130
preplace netloc Buffers_0_out4 1 2 1 NJ 150
preplace netloc Buffers_0_out5 1 2 1 NJ 170
preplace netloc bclk_0_1 1 0 2 NJ 180 NJ
preplace netloc lrclk_0_1 1 0 2 NJ 200 NJ
preplace netloc processing_system7_0_FCLK_CLK0 1 1 2 NJ 750 NJ
preplace netloc processing_system7_0_FCLK_CLK1 1 0 2 20 260 530
preplace netloc sdata_0_1 1 0 2 NJ 220 NJ
preplace netloc switch_0_1 1 0 2 NJ 240 520J
preplace netloc AXI_Effects_m_axis1_tdata 1 0 3 80 560 NJ 560 850
preplace netloc hdmi_out_0_clk_p 1 2 1 NJ 840
preplace netloc hdmi_out_0_clk_n 1 2 1 NJ 860
preplace netloc hdmi_out_0_data_n 1 2 1 NJ 900
preplace netloc hdmi_out_0_data_p 1 2 1 NJ 880
preplace netloc AXI_Effects_led1 1 2 1 NJ 190
preplace netloc AXI_Effects_led2 1 2 1 NJ 210
preplace netloc AXI_Effects_led3 1 2 1 NJ 230
preplace netloc AXI_Effects_led4 1 2 1 NJ 250
preplace netloc clock_domain_50_out1 1 0 3 80 10 NJ 10 810
preplace netloc clock_domain_50_out4 1 0 3 40 580 NJ 580 830
preplace netloc clock_domain_50_out2 1 0 3 50 550 NJ 550 810
preplace netloc clock_domain_50_out3 1 0 3 30 570 NJ 570 840
preplace netloc xpm_cdc_gen_0_dest_out 1 1 1 490 420n
preplace netloc crossing_clock_domain_50_hdmi_dest_out1 1 1 1 480 440n
preplace netloc clock_domain_50_src_send 1 0 3 60 590 NJ 590 820
preplace netloc hdmi_rx_clk_n_1 1 0 2 NJ 850 NJ
preplace netloc hdmi_rx_clk_p_1 1 0 2 NJ 870 NJ
preplace netloc hdmi_rx_d_n_1 1 0 2 NJ 890 NJ
preplace netloc hdmi_rx_d_p_1 1 0 2 NJ 910 NJ
preplace netloc dest_clk_1 1 0 3 70 600 NJ 600 810
preplace netloc processing_system7_0_FCLK_RESET0_N 1 1 1 540 260n
preplace netloc clk_in1_0_1 1 0 2 NJ 930 NJ
preplace netloc clock_domain_hdmi_dout_0 1 2 1 830 920n
preplace netloc btn2_1 1 0 2 10J 270 550J
preplace netloc btn4_1 1 0 2 NJ 280 480J
preplace netloc btn3_1 1 0 2 NJ 300 510J
preplace netloc btn1_1 1 0 2 10J 290 520J
preplace netloc sw1_1 1 0 2 NJ 950 NJ
preplace netloc processing_system7_0_DDR 1 1 2 NJ 670 NJ
preplace netloc processing_system7_0_M_AXI_GP0 1 1 1 500 160n
preplace netloc axi_iic_0_IIC 1 2 1 NJ 70
preplace netloc clock_domain_hdmi_DDC_1 1 2 1 NJ 820
preplace netloc processing_system7_0_FIXED_IO 1 1 2 NJ 690 NJ
levelinfo -pg 1 -10 280 680 870
pagesize -pg 1 -db -bbox -sgen -190 0 1050 1000
"
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_design_1()
cr_bd_design_1 ""
set_property REGISTERED_WITH_MANAGER "1" [get_files design_1.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files design_1.bd ] 
set_property USED_IN "synthesis implementation" [get_files design_1.bd ] 
set_property USED_IN_SIMULATION "0" [get_files design_1.bd ] 


# Create wrapper file for design_1.bd
make_wrapper -files [get_files design_1.bd] -import -top

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7z020clg400-1 -flow {Vivado Synthesis 2020} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2020" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1]
set_property -name "auto_incremental_checkpoint.directory" -value "C:/home/thibaut/FPGA/Vivadoprojects/audio-project/audio-project.srcs/utils_1/imports/synth_1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7z020clg400-1 -flow {Vivado Implementation 2020} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2020" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "options.verbose" -value "1" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "auto_incremental_checkpoint.directory" -value "C:/home/thibaut/FPGA/Vivadoprojects/audio-project/audio-project.srcs/utils_1/imports/impl_1" -objects $obj
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

# Change current directory to project folder
cd [file dirname [info script]]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1
