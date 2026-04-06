# -----------------------------------
# POST-CTS CONSTRAINT UPDATE
# -----------------------------------

update_constraint_mode
set_propagated_clock [all_clocks]
set_clock_uncertainty

set_clock_latency -source xxx clock
set_input_delay
set_output_delay
update_io_latency

# -----------------------------------
# POST-CTS TIMING & OPTIMIZATION
# -----------------------------------

timeDesign -postCTS -outDir postctsTimingReports
optDesign -postCTS -outDir postctsOptTimingReports

# Hold analysis
timeDesign -postCTS -hold -outDir postctsHoldTimingReports
optDesign -postCTS -hold -outDir postctsOptHoldTimingReports

# Hold control
setOptMode -holdTargetSlack -0.2
setOptMode -fixHoldAllowSetupTnsDegrade true | false
setOptMode -ignorePathGroupsForHold {groupA groupB}
setOptMode -fixHoldAllowOverlap true