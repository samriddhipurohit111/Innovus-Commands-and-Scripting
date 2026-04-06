# -----------------------------------
# ROUTING
# -----------------------------------

routeDesign

# Routing control
setNanoRouteMode -routeWithTimingDriven true
setNanoRouteMode -routeDesignFixClockNets false

setNanoRouteMode -droutePostRouteSpreadWire true
setNanoRouteMode -droutePostRouteSpreadWire false

routeDesign -wireOpt

setNanoRouteMode -drouteUseMultiCutViaEffort {low | medium | high}

# -----------------------------------
# POST-ROUTE EXTRACTION & TIMING
# -----------------------------------

setExtractRCMode -engine postRoute
setExtractRCMode -effortLevel {low | medium | high | signoff}

setDelayCalMode -SIAware false

timeDesign -postRoute -outDir postrouteTimingReports
timeDesign -postRoute -hold -outDir postrouteTimingReports

# -----------------------------------
# POST-ROUTE OPTIMIZATION
# -----------------------------------

optDesign -postRoute
optDesign -postRoute -hold
optDesign -postRoute -setup -hold

# -----------------------------------
# SIGNAL INTEGRITY
# -----------------------------------

setAnalysisMode -analysisType onChipVariation -cppr both
set_global timing_enable_si_cppr true