# -----------------------------------
# PRE-PLACEMENT OPTIMIZATION
# -----------------------------------

deleteBufferTree

# -----------------------------------
# PLACEMENT (GigaPlace)
# -----------------------------------

place_opt_design
place_opt_design -incremental

# Placement modes
setPlaceMode -place_design_floorplan_mode true
setPlaceMode -place_design_floorplan_mode false
setPlaceMode -place_global_cong_effort high

# Congestion repair
congRepair

# Floorplan / IO
globalNetConnect
add_tracks
specifyJtag
placeJtag