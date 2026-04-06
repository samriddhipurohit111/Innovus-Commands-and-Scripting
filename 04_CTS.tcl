# -----------------------------------
# CTS CONFIGURATION
# -----------------------------------

create_route_type
set_ccopt_property route_type

set_ccopt_property target_max_trans
set_ccopt_property target_skew

set_ccopt_property buffer_cells
set_ccopt_property inverter_cells
set_ccopt_property clock_gating_cells
set_ccopt_property use_inverters

create_ccopt_clock_tree_spec

# -----------------------------------
# RUN CTS
# -----------------------------------

ccopt_design -cts
ccopt_design

# Reports
timeDesign -postCTS
report_ccopt_clock_trees -file clock_trees.rpt
report_ccopt_skew_groups -file skew_groups.rpt