# -----------------------------------
# VALIDATION & TIMING CHECK
# -----------------------------------

# Design checks
check_design -all
check_design -type {power_intent}
checkDesign -all
check_timing -verbose

# Early timing (zero wireload)
timeDesign -prePlace -outDir

# Footprint / equivalence
checkFootPrint
reportFootPrint -outfile file_name
loadFootPrint -infile file_name

# -----------------------------------
# POWER SETUP
# -----------------------------------

setOptMode -powerEffort {low | high} -leakageToDynamicRatio 1.0
setOptMode -powerEffort {low | high} -leakageToDynamicRatio 0.0

set_power_analysis_mode -leakage_power_view power_view_name -dynamic_power_view power_view_name
set_power_analysis_mode -leakage_power_view leakage_view_name -dynamic_power_view dynamic_view_name

set_analysis_view
report_power -view power_view_name

read_activity_file -format {VCD | TCF | SAIF | FSDB | PHY | SHM} file_name
set_default_switching_activity -input_activity 0.2 -seq_activity 0.2

# -----------------------------------
# EXTRACTION BASE
# -----------------------------------

extractRC
setExtractRCMode -engine {preRoute | postRoute}
setExtractRCMode -effortLevel {low | medium | high | signoff}

timeDesign