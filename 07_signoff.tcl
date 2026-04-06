# -----------------------------------
# SPEF FLOW
# -----------------------------------

spefIn rc_corner1.spef -rc_corner rc_corner1
spefIn rc_corner2.spef -rc_corner rc_corner2

optDesign -postRoute [-hold] -outDir spefFlowTimingReports

# -----------------------------------
# FILLER / DECAP
# -----------------------------------

addFiller -cell filler_cell_list -prefix FILLER
addFiller -cell decap_filler_list -prefix FILLER_DECAP -area {x1 y1 x2 y2}
deleteFiller

# -----------------------------------
# METAL FILL
# -----------------------------------

setMetalFill -activeSpacing value -gapSpacing value -maxWidth value -maxLength value -windowSize x y -windowStep x_step y_step -minDensity value -maxDensity value
addMetalFill
addMetalFill -net
verifyMetalDensity

trimMetalFillNearNet -slackThreshold $slack1 -spacing value -spacingAbove value -spacingBelow value -minTrimDensity value

# -----------------------------------
# SIGNOFF METAL FILL
# -----------------------------------

streamOut -mapFile gds_map -outputMacros -units unit
run_pegasus_metal_fill -ruleFile PEGASUS_RULE_DECK -defMapFile -gdsFile -cell gds_top_cell
run_pvs_metal_fill -ruleFile PVS_RULE_DECK -defMapFile -gdsFile -cell gds_top_cell

# -----------------------------------
# TIMING SIGNOFF
# -----------------------------------

timeDesign -signoff -outDir signOffTimingReports
timeDesign -signoff -hold -reportOnly -outDir signOffTimingReports

# SPEF signoff
timeDesign -signoff -reportOnly -outDir signOffTimingReports
timeDesign -signoff -hold -reportOnly -outDir signOffTimingReports

# Advanced
signoffTimeDesign
signoffOptDesign