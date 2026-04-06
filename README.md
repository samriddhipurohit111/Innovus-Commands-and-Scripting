# Innovus Timing Closure – TCL Flow Reference

A **flow-oriented TCL command reference** for Cadence Innovus.

This is structured for **quick lookup during implementation**, not for theory or tutorials.

---

# 🔁 Flow Overview

```id="flow-main"
Init 
→ Validation 
→ Placement (PreCTS) 
→ CTS 
→ PostCTS 
→ Routing 
→ PostRoute 
→ Signoff
```

---

# 📂 Structure

```id="repo-structure"
commands/
│
├── 01_init_setup.tcl
├── 02_validation_power.tcl
├── 03_preCTS_placement.tcl
├── 04_CTS.tcl
├── 05_postCTS.tcl
├── 06_routing_postRoute.tcl
├── 07_signoff.tcl
```

---

# ⚙️ Stage Summary

## 01 – Init & Setup

* Load design, MMMC, libraries
* Define constraints and modes

---

## 02 – Validation & Early Timing

* Run design checks
* Verify constraints
* Run `timeDesign -prePlace`

---

## 03 – Placement (PreCTS)

* `place_opt_design`
* Congestion handling (`congRepair`, blockages)
* Floorplan alignment

---

## 04 – CTS

* Configure CCOpt
* Build and balance clock tree
* Switch to propagated clocks

---

## 05 – PostCTS

* Setup + Hold optimization
* Constraint updates for real clock delays

---

## 06 – Routing & PostRoute

* `routeDesign` (NanoRoute)
* Post-route extraction
* Fix final violations

---

## 07 – Signoff

* Accurate extraction
* Final timing (`timeDesign -signoff`)
* Fillers + metal fill

---

# 🧠 Usage Notes

* Commands are grouped by **where they are used in flow**
* Not all commands are required in every run
* Some depend on:

  * MMMC setup
  * Library availability
  * Design complexity

---

# ⚠️ Important

* Always validate:

  * Timing after each stage (`timeDesign`)
  * Congestion after placement
* Large timing jumps → check:

  * Extraction settings
  * Constraints
  * Clock behavior

---

# 📌 Key Reminder

```id="key-line"
Timing closure = flow convergence, not a single step
```

---
