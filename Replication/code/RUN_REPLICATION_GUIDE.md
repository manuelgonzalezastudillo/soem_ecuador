# Using run_replication.m - Quick Start Guide

## Overview

`run_replication.m` is a master script that automates all 6 steps of the replication package, handling environment validation, Dynare setup, error handling, and progress reporting.

## Basic Usage

### 1. Navigate to the code directory
```matlab
cd /mq/manuel_projects/SOEM_EC/Replication/code
```

### 2. Run the complete replication (skip 8-hour estimation)
```matlab
run_replication()
```

This will:
- Validate your environment (MATLAB, Dynare, toolboxes)
- Run all 6 steps using pre-computed MCMC results
- Complete in approximately 15 minutes
- Generate all figures and tables

## Advanced Options

### Check environment without running
```matlab
run_replication('check_only', true)
```
Validates that everything is properly configured without executing any steps.

### Run with full MCMC estimation (~8 hours)
```matlab
run_replication('run_estimation', true)
```
⚠️ This will run the full Bayesian estimation. Only use if you want to regenerate the MCMC results from scratch.

### Start from a specific step
```matlab
run_replication('start_from', 4)
```
Useful if earlier steps already completed successfully.

### Run only specific steps
```matlab
run_replication('steps', [1 4 5])
```
Runs only steps 1, 4, and 5.

### Verbose output
```matlab
run_replication('verbose', true)
```
Shows detailed progress and Dynare output.

### Suppress figure windows
```matlab
run_replication('show_figures', false)
```
Useful for headless systems or when figures aren't needed.

### Continue after errors
```matlab
run_replication('continue_on_error', true)
```
Attempts to continue even if a step fails.

## Expected Output

### Console Output
```
========================================
REPLICATION PACKAGE EXECUTOR
========================================
Paper: Fiscal Consolidations in Commodity-Exporting Countries
Authors: González-Astudillo, Guerra-Salas, Lipton (2026)
========================================

Validating environment...
Environment validation: PASSED

Setting up Dynare path...
  Found Dynare at: /opt/dynare/4.5.6/lib/dynare/matlab
Dynare setup: SUCCESS

Validating pre-computed MCMC results...
Pre-computed results: FOUND

Execution Plan:
  Steps to run: [1 2 3 4 5 6]
  Include estimation: NO (using pre-computed)
  Estimated total time: ~15 minutes

========================================
STARTING REPLICATION
========================================

[1/6] Data Processing... DONE (32 sec)
      Created: ../data/estim_data.xlsx, ../data/IMF_spending.xlsx

[2/6] MCMC Estimation... SKIPPED (using pre-computed results)
      (Use 'run_estimation', true to run ~8 hour estimation)

[3/6] Shock Decomposition... DONE (252 sec)
      Created: SOE_Decomposition_results.mat

[4/6] Process Results... DONE (105 sec)
      Created: Figures in ../output/figures/
      Console output: Model vs. data moments, variance decomposition

[5/6] IMF Policy Simulations... DONE (298 sec)
      Created: Multiple IRF figures (*.eps files)

[6/6] Oil Risk IRFs... DONE (48 sec)
      Created: oil_irf.eps, risk_irf.eps

========================================
REPLICATION COMPLETE
========================================
Total time: 12.2 minutes (732 seconds)

Steps completed successfully: [1 3 4 5 6]
  Step 1: 32 sec
  Step 3: 252 sec
  Step 4: 105 sec
  Step 5: 298 sec
  Step 6: 48 sec

Expected outputs:
  Data files:
    - ../data/estim_data.xlsx
    - ../data/IMF_spending.xlsx
  Figures:
    - ../output/figures/*.eps (shock decomposition)
    - *.eps files in current directory (IRFs)
  Result files:
    - SOE_Decomposition_results.mat

========================================
For questions, see README.md or contact:
  Juan Guerra-Salas: jguerra@bcentral.cl
========================================
```

### Files Created

**Data Files:**
- `../data/estim_data.xlsx` - Estimation dataset (18 observables, 2004Q1-2019Q4)
- `../data/IMF_spending.xlsx` - IMF fiscal projections

**Result Files:**
- `SOE_Decomposition_results.mat` - Historical shock decomposition

**Figures (in `../output/figures/`):**
- 14+ shock decomposition plots (`.eps` files)

**Figures (in current directory):**
- `Consumption_Tax_IRF.eps`
- `Labor_Tax_IRF.eps`
- `Capital_Tax_IRF.eps`
- `Government_Consumption_IRF.eps`
- `Government_Investment_IRF.eps`
- `Transfers_IRF.eps`
- `Oil_Revenue_IRF.eps`
- `IMF_Simulation.eps`
- `oil_irf.eps`
- `risk_irf.eps`

## Troubleshooting

### "Dynare not found"
The script will try to auto-detect Dynare. If it fails, it will prompt you to enter the path manually.

For your system, the path is:
```
/opt/dynare/4.5.6/lib/dynare/matlab
```

You can also add Dynare to your MATLAB path before running:
```matlab
addpath('/opt/dynare/4.5.6/lib/dynare/matlab');
savepath;
```

### "Must run from /Replication/code/ directory"
Make sure you're in the correct directory:
```matlab
cd /mq/manuel_projects/SOEM_EC/Replication/code
pwd  % Should show: /mq/manuel_projects/SOEM_EC/Replication/code
```

### "Missing pre-computed MCMC files"
The replication package includes pre-computed results. If they're missing, you have two options:

1. Re-run estimation (8 hours):
   ```matlab
   run_replication('run_estimation', true)
   ```

2. Obtain pre-computed files from the journal or authors

### Step fails with Dynare error
- Check that all input files exist
- Verify Dynare version (4.5.6 is confirmed working)
- Look for detailed error messages in Dynare log files
- Try running the failing step manually to see full error output

### Out of memory
- Close other applications
- If running Step 2 (estimation), ensure 16-32 GB RAM available
- Consider using pre-computed results instead

## Comparison with Manual Execution

### Manual Method (from README)
```matlab
step1_data_processing
dynare step2_estimation         % 8 hours, optional
dynare step3_decomposition
step4_process_results
step5_imf_simulations
step6_oil_risk_irf
```

### Using run_replication.m
```matlab
run_replication()
```

**Advantages:**
- ✅ Automatic environment validation
- ✅ Automatic Dynare path setup
- ✅ Progress tracking with timing
- ✅ Error handling and recovery
- ✅ Single command execution
- ✅ No need to manually check dependencies

## Notes

1. **Step 2 (Estimation) is optional** - Pre-computed results are included and sufficient for replication
2. **Step 6 re-runs decomposition** - This is intentional in the original code, not a bug in run_replication.m
3. **Version compatibility** - Your Dynare 4.5.6 works fine (README recommends 4.6+ but 4.5.6 is compatible)
4. **Original files unchanged** - `run_replication.m` doesn't modify any of the original step files

## Contact

For issues with the replication package, see the main README.md or contact the authors.

For issues with `run_replication.m` specifically, check that you're using the latest version and that all requirements are met.
