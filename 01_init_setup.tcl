# -----------------------------------
# DESIGN INITIALIZATION
# -----------------------------------

# Load design
source design.globals
init_design
read_mmmc

# Library / routing setup
add_ndr
setGenerateViaMode

# Preservation constraints
dbSet
dbGet
dbSchema
set_dont_touch

# Design mode setup
setDesignMode -process <node> -flowEffort {express | standard | extreme}
setLimitedAccessFeature