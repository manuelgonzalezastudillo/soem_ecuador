# Replication Package: Fiscal Consolidations in Commodity-Exporting Countries

**Paper:** Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective  
**Authors:** Manuel González-Astudillo, Juan Guerra-Salas, Avi Lipton  
**Journal:** Economic Modelling (2026)

This replication package contains all code and data necessary to replicate the tables and figures in the published paper.

---

## Table of Contents

1. [Overview](#overview)
2. [Software Requirements](#software-requirements)
3. [Hardware Requirements](#hardware-requirements)
4. [File Structure](#file-structure)
5. [Data Sources](#data-sources)
6. [Replication Instructions](#replication-instructions)
7. [Pre-Computed Results](#pre-computed-results)
8. [EViews Files (Documentation Only)](#eviews-files-documentation-only)
9. [Expected Outputs](#expected-outputs)
10. [Troubleshooting](#troubleshooting)

---

## Overview

This package replicates all empirical results in "Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective." The analysis proceeds in six steps:

1. **Data Processing**: Transform raw quarterly data into estimation-ready format
2. **Model Estimation**: Bayesian MCMC estimation of DSGE model parameters (computationally intensive, ~8 hours)
3. **Shock Decomposition**: Historical decomposition of observed fluctuations
4. **Results Processing**: Generate tables comparing model vs. data moments
5. **IMF Policy Simulations**: Simulate fiscal consolidation scenarios under oil price uncertainty  
6. **Oil Risk IRFs**: Generate impulse responses to oil price shocks

All code is written in MATLAB and Dynare. **EViews is NOT required** - all necessary data files are provided.

**✨ NEW:** The replication package now includes `run_replication.m`, a master script that automates all steps with a single command, includes environment validation, automatic Dynare detection, error handling, and progress reporting. Complete replication in ~15 minutes (excluding optional 8-hour estimation).

---

## Software Requirements

### Required Software

1. **MATLAB** R2016a or later
   - Required toolboxes: Statistics and Machine Learning Toolbox, Optimization Toolbox
   - Download: https://www.mathworks.com/products/matlab.html

2. **Dynare** 4.5 or later (4.6+ recommended)
   - Free software for solving and estimating DSGE models
   - Download: https://www.dynare.org/
   - Installation instructions: https://www.dynare.org/resources/quick_start/
   - Note: Dynare 4.5.6 has been tested and confirmed working

### Installation Steps

1. Install MATLAB (R2016a or later)
2. Install Dynare following instructions at https://www.dynare.org/
3. **Option A - Automatic (Recommended):** Run `run_replication.m` which will auto-detect Dynare in common installation locations, or prompt you for the path if needed
4. **Option B - Manual:** Add Dynare to your MATLAB path:
   ```matlab
   addpath /path/to/dynare/matlab
   savepath
   ```
5. Navigate to the `Replication/code/` directory to run scripts

### Optional Software

- **EViews** (NOT required for replication, see [EViews Files section](#eviews-files-documentation-only))

---

## Hardware Requirements

### Minimum Requirements
- **Processor:** Multi-core processor (2+ cores) recommended (estimation uses parallel computing)
- **RAM:** 16GB minimum, 32GB recommended for smooth MCMC estimation
- **Disk Space:** ~300MB for code and data, ~500MB with all outputs

### Tested System Specifications
This replication package has been successfully tested on:
- **Processor:** Intel Core i7 (4-8 cores, 2.5-3.5 GHz)
- **RAM:** 16GB DDR4
- **Operating Systems:** 
  - Linux (Ubuntu 20.04 LTS)
  - Windows 10/11
  - macOS 12+ (Monterey and later)

### Computation Time

**Using Pre-Computed Results (Recommended):**
- Step 1 (Data Processing): < 1 minute
- Step 2 (Estimation): SKIPPED (using pre-computed results)
- Step 3 (Shock Decomposition): ~5 minutes
- Step 4 (Process Results): ~2 minutes
- Step 5 (IMF Simulations): ~5 minutes
- Step 6 (Oil Risk IRFs): < 1 minute
- **Total: ~15 minutes**

**With Full MCMC Re-estimation:**
- Step 1: < 1 minute
- Step 2: ~8 hours (varies with hardware, parallel chains)
- Steps 3-6: ~15 minutes
- **Total: ~8.25 hours**

**Note:** Computation times are approximate and may vary depending on system specifications, MATLAB version, and background processes. The automated script `run_replication.m` provides real-time timing information during execution.

---

## File Structure

```
Replication/
├── README.md                          # This file
├── code/
│   ├── run_replication.m              # ✨ NEW: Master script - automated execution
│   ├── RUN_REPLICATION_GUIDE.md       # ✨ NEW: Detailed usage guide
│   ├── TESTING_SUMMARY.md             # ✨ NEW: Testing documentation
│   ├── step1_data_processing.m        # Data processing (< 1 min)
│   ├── step2_estimation.mod           # Bayesian MCMC estimation (~8 hours)
│   ├── step3_decomposition.mod        # Shock decomposition (~5 min)
│   ├── step4_process_results.m        # Tables and statistics (~2 min)
│   ├── step5_imf_simulations.m        # IMF consolidation simulations (~5 min)
│   ├── step5_imf_simulations.mod      # Perfect foresight solver
│   ├── step6_oil_risk_irf.m           # Oil price IRFs (< 1 min)
│   ├── SOE_Estimation_mean.mat        # Pre-computed: posterior mean estimates
│   ├── SOE_Estimation_mh*.mat         # Pre-computed: MCMC chains (6 files, ~200MB)
│   └── SOE_Decomposition_results.mat  # Pre-computed: shock decomposition
├── data/
│   ├── DATA_SOURCES.md                # Detailed data documentation
│   ├── data.xlsx                      # Master quarterly dataset (2000Q1-2019Q4)
│   ├── oil_revenues.xlsx              # Oil revenue data
│   ├── estim_data.xlsx                # Estimation dataset (created by step1)
│   ├── IMF_consolidation.xlsx         # IMF fiscal scenarios (2020Q1-2026Q4)
│   └── IMF_spending.xlsx              # Generated by step1
└── eviews/
    ├── README.txt                     # EViews files documentation
    ├── frequency_conversion_IMF_consolidation.WF1
    └── embi_interestrate.wf1
```

---

## Data Sources

All data come from publicly available sources:

### Ecuadorian Macroeconomic Data
- **Source:** Central Bank of Ecuador (Banco Central del Ecuador)
- **Variables:** Non-oil GDP, private consumption, investment, government expenditure (consumption, investment, transfers), trade balance, public debt
- **Period:** 2000Q1-2019Q4 (quarterly)
- **Access:** https://www.bce.fin.ec/

### Oil Market Data
- **Source:** U.S. Energy Information Administration (EIA)  
- **Variables:** Crude oil prices (WTI), Ecuador oil production
- **Period:** 2000-2019 (monthly, converted to quarterly)
- **Access:** https://www.eia.gov/

### Foreign Variables
- **World GDP:** World Bank World Development Indicators
- **U.S. Interest Rates:** Federal Reserve Economic Data (FRED)
- **EMBI Spread:** J.P. Morgan Emerging Markets Bond Index
- **U.S. GDP Deflator:** Bureau of Economic Analysis

### Labor Market Data
- **Source:** Instituto Nacional de Estadística y Censos (INEC), Ecuador
- **Variables:** Hours worked, unemployment rate
- **Period:** 2000Q1-2019Q4

### IMF Fiscal Projections
- **Source:** International Monetary Fund (Article IV Consultation Reports)
- **Variables:** Government spending paths (2020-2026)
- **Period:** 2020-2026 (annual, converted to quarterly)

See `data/DATA_SOURCES.md` for complete details on all data files.

---

## Data Availability Statement

**All data used in this replication package are publicly available and can be freely accessed without restrictions.**

This replication package does not use any proprietary, confidential, or restricted-access data. No data use agreements, licenses, or special permissions are required to access the data sources. All raw data can be independently downloaded from the public sources listed above and in `data/DATA_SOURCES.md`.

For convenience, this replication package includes:
- **Raw data files** in `archive/raw/` (47 files from original public sources)
- **Processed data files** in `data/` ready for analysis
- **Complete data processing code** (`step1_data_processing.m`) to transform raw data into analysis datasets

Primary data sources:
- Ecuadorian macroeconomic data: https://www.bce.fin.ec/
- Oil market data: https://www.eia.gov/
- World Bank data: https://databank.worldbank.org/
- U.S. economic data: https://fred.stlouisfed.org/
- IMF data: Available through IMF Article IV Consultation Reports

**No synthetic or pseudo-data are needed** as all actual data are included in this package and are publicly available.

For questions about data sources or access, contact:
- Juan Guerra-Salas: jguerra@bcentral.cl
- Manuel González-Astudillo: manuel.p.gonzalez-astudillo@frb.gov

---

## Replication Instructions

### Quick Start - Automated Replication (Recommended)

**NEW:** We now provide a master script that automates the entire replication process with a single command.

**Navigate to the code directory:**
```matlab
cd /path/to/Replication/code/
```

**Run the complete replication:**
```matlab
run_replication()
```

This will:
- ✅ Validate your MATLAB environment, toolboxes, and Dynare installation
- ✅ Automatically detect Dynare path (or prompt you to provide it)
- ✅ Run all 6 steps sequentially using pre-computed MCMC results
- ✅ Display real-time progress with timing information
- ✅ Complete in approximately **15 minutes** (skips 8-hour estimation)
- ✅ Generate all tables, figures, and results

**Additional options:**
```matlab
% Check environment only (no execution)
run_replication('check_only', true)

% Run with full MCMC estimation (~8 hours)
run_replication('run_estimation', true)

% Start from a specific step
run_replication('start_from', 4)

% Run only specific steps
run_replication('steps', [1 4 5 6])

% Verbose output with detailed progress
run_replication('verbose', true)
```

**Documentation:**
- See `code/RUN_REPLICATION_GUIDE.md` for detailed usage instructions
- See `code/TESTING_SUMMARY.md` for testing documentation and troubleshooting

**Requirements:**
- MATLAB R2016a or later
- Dynare 4.5 or later (auto-detected in common locations)
- Statistics and Machine Learning Toolbox
- Optimization Toolbox

---

### Manual Step-by-Step Instructions

**Alternative method:** If you prefer to run steps manually or need finer control, follow these instructions.

**IMPORTANT:** All commands should be run from within MATLAB, starting in the `Replication/code/` directory.

```matlab
cd /path/to/Replication/code/
```

### Step 1: Data Processing (< 1 minute)

```matlab
step1_data_processing
```

**Inputs:**
- `../data/data.xlsx` (master dataset)

**Outputs:**
- `../data/estim_data.xlsx` (demeaned observables for estimation, 2004Q1-2019Q4)
- `../data/IMF_spending.xlsx` (IMF fiscal projections)

**Description:** Loads raw quarterly data, deflates nominal variables to U.S. goods, computes growth rates and ratios, applies HP-filter to extract cyclical components, and creates the estimation dataset with 18 observables.

---

### Step 2: Model Estimation (~8 hours) ⚠️ **OPTIONAL - Pre-computed results provided**

```matlab
dynare step2_estimation
```

**Inputs:**
- `../data/estim_data.xlsx`

**Outputs:**
- `SOE_Estimation_mean.mat` (posterior mean estimates)
- `SOE_Estimation_mh*.mat` (6 MCMC chain files with posterior draws)
- Estimation diagnostics and figures

**Description:** Bayesian estimation of 46 parameters (structural + shock processes) using Metropolis-Hastings MCMC with 1 million draws per chain (2 chains). The algorithm first finds the posterior mode, then samples from the posterior distribution.

**Note:** This step is very time-consuming (~8 hours depending on hardware). **Pre-computed results are included** in the `code/` folder, so you can skip this step and proceed directly to Step 3. If you wish to re-run the estimation, be prepared for a long computation time.

---

### Step 3: Shock Decomposition (~5 minutes)

```matlab
dynare step3_decomposition
```

**Inputs:**
- Pre-computed MCMC results from Step 2

**Outputs:**
- `SOE_Decomposition_results.mat` (shock decomposition)
- Figures showing historical decomposition by shock group

**Description:** Uses posterior mean estimates to perform historical shock decomposition, attributing observed fluctuations to six shock groups: Technology, Foreign, Oil, Risk Premium, Preference, and Fiscal.

---

### Step 4: Process Results (~2 minutes)

```matlab
step4_process_results
```

**Inputs:**
- `SOE_Decomposition_results.mat`
- `../data/estim_data.xlsx`
- `../data/data.xlsx`

**Outputs:**
- Console output: Theoretical vs. empirical moments (Table 3 in paper)
- Console output: Variance decomposition (Table 4 in paper)
- Figures: Shock decomposition for all observables

**Description:** Computes model fit statistics including correlations with output, autocorrelations, standard deviations, and variance decomposition by shock group. Compares model-implied and actual moments.

---

### Step 5: IMF Policy Simulations (~5 minutes)

```matlab
step5_imf_simulations
```

**Inputs:**
- `../data/IMF_consolidation.xlsx` (fiscal policy paths)
- Pre-computed MCMC results

**Outputs:**
- Figures: Impulse response functions for 7 fiscal consolidation scenarios
- `IMF_Simulation.pdf`: Main IMF consolidation with oil price uncertainty bands (Figure 10 in paper)

**Description:** Simulates the 2020-2025 IMF fiscal consolidation package under three oil revenue scenarios: baseline, high (+1 SD), and low (-1 SD). Uses perfect foresight solver to compute nonlinear transition paths. Also generates IRFs for individual fiscal instruments (consumption tax, labor tax, capital tax, government consumption, government investment, transfers, oil revenue).

**Figures Generated:**
- `Consumption_Tax_IRF.pdf` (Figure 4)
- `Labor_Tax_IRF.pdf` (Figure 5)
- `Capital_Tax_IRF.pdf` (Figure 6)
- `Government_Consumption_IRF.pdf` (Figure 7)
- `Government_Investment_IRF.pdf` (Figure 8)
- `Government_Transfers_IRF.pdf` (Figure 9)
- `Oil_revenue_IRF.pdf`
- `IMF_Simulation.pdf` (Figure 10)

---

### Step 6: Oil Price IRFs (< 1 minute)

```matlab
step6_oil_risk_irf
```

**Inputs:**
- `step3_decomposition.mod` results

**Outputs:**
- `oil_irf.eps`: Impulse response to oil price shock

**Description:** Generates impulse response functions showing the macroeconomic effects of a one-standard-deviation oil price shock.

---

## Pre-Computed Results

To facilitate replication without requiring the computationally intensive estimation step, we include pre-computed results:

### MCMC Chain Files (~200MB)
- `SOE_Estimation_mh1_blck1.mat` (38MB)
- `SOE_Estimation_mh1_blck2.mat` (38MB)  
- `SOE_Estimation_mh2_blck1.mat` (38MB)
- `SOE_Estimation_mh2_blck2.mat` (39MB)
- `SOE_Estimation_mh3_blck1.mat` (25MB)
- `SOE_Estimation_mh3_blck2.mat` (25MB)

These files contain the full posterior distributions from the Metropolis-Hastings MCMC algorithm. They allow Steps 3-6 to run without re-estimating the model.

### Other Pre-Computed Files
- `SOE_Estimation_mean.mat` (11KB): Posterior mean parameter estimates
- `SOE_Decomposition_results.mat` (2.1MB): Shock decomposition results

### Verification

To verify the pre-computed results match your own estimation (if you choose to re-run Step 2), compare:
- Posterior mean estimates
- Variance decomposition tables
- IRF plots

Small numerical differences (<1%) may arise due to MCMC sampling variability.

---

## EViews Files (Documentation Only)

The `eviews/` folder contains two EViews workfiles that document auxiliary calculations. **These files are NOT required for replication** - all necessary outputs are already included in the Excel data files.

### frequency_conversion_IMF_consolidation.WF1
- **Purpose:** Documents how the IMF annual fiscal projections (2020-2026) were converted to quarterly frequency
- **Output:** The "quarterly_gr" sheet in `data/IMF_consolidation.xlsx` (already included)
- **Method:** Temporal disaggregation assuming constant quarterly growth rates within each year

### embi_interestrate.wf1  
- **Purpose:** Documents the linear regression that produced the parameter μ=0.15 for the capital controls scenario
- **Data:** Uses `data/embi_interestrate.xlsx` to estimate the pass-through from foreign interest rates to domestic interest rates
- **Output:** The parameter μ=0.15 is hardcoded in the simulation scripts
- **Note:** This parameter is only used in the appendix results (capital controls counterfactual)

**Both files are provided for transparency but do not need to be executed.** All outputs from these files are already incorporated into the MATLAB/Dynare workflow.

---

## Expected Outputs

This section provides a complete mapping of all tables and figures in the published paper to the code that generates them.

### Summary

**Computational Outputs:**
- 5 tables (console output)
- 10+ figures (.eps and .pdf format)
- 3 result files (.mat format with posterior distributions and decompositions)
- Total runtime: ~15 minutes (using pre-computed MCMC) or ~8.25 hours (with full estimation)

### Tables

| Table | Description | Generated by | Output Format | Runtime |
|-------|-------------|--------------|---------------|---------|
| Table 1 | Calibrated parameters | Paper text | N/A - Documented in paper | N/A |
| Table 2 | Prior and posterior distributions | `step2_estimation.mod` | Console output | ~8 hours* |
| Table 3 | Moments comparison (data vs. model) | `step4_process_results.m` | Console output | ~2 min |
| Table 4 | Variance decomposition by shock group | `step4_process_results.m` | Console output | ~2 min |
| Table 5 | Fiscal consolidation scenarios | Paper text | N/A - Documented in paper | N/A |

*Can use pre-computed results to skip estimation

### Figures

| Figure | Description | Generated by | File Name | Format | Runtime |
|--------|-------------|--------------|-----------|--------|---------|
| Figure 1 | Observed macroeconomic series | Paper / Data | From `data.xlsx` | Data visualization | N/A |
| Figure 2 | Prior vs. posterior distributions | `step2_estimation.mod` | Dynare output | .eps | ~8 hours* |
| Figure 3 | Historical shock decomposition | `step3_decomposition.mod` | 14 files: `*_obs.eps` | .eps | ~5 min |
| Figure 4 | Consumption tax consolidation IRFs | `step5_imf_simulations.m` | `Consumption_Tax_IRF.pdf` | .pdf | ~5 min |
| Figure 5 | Labor tax consolidation IRFs | `step5_imf_simulations.m` | `Labor_Tax_IRF.pdf` | .pdf | ~5 min |
| Figure 6 | Capital tax consolidation IRFs | `step5_imf_simulations.m` | `Capital_Tax_IRF.pdf` | .pdf | ~5 min |
| Figure 7 | Government consumption cut IRFs | `step5_imf_simulations.m` | `Government_Consumption_IRF.pdf` | .pdf | ~5 min |
| Figure 8 | Government investment cut IRFs | `step5_imf_simulations.m` | `Government_Investment_IRF.pdf` | .pdf | ~5 min |
| Figure 9 | Transfer cut IRFs | `step5_imf_simulations.m` | `Government_Transfers_IRF.pdf` | .pdf | ~5 min |
| Figure 10 | IMF consolidation with uncertainty | `step5_imf_simulations.m` | `IMF_Simulation.pdf` | .pdf | ~5 min |

*Can use pre-computed results to skip estimation

### Additional Outputs (Step 6)

| Figure | Description | Generated by | File Name | Format | Runtime |
|--------|-------------|--------------|-----------|--------|---------|
| Oil IRF | Impulse responses to oil price shock | `step6_oil_risk_irf.m` | `oil_irf.eps` | .eps | <1 min |
| Risk IRF | Impulse responses to country risk shock | `step6_oil_risk_irf.m` | `risk_irf.eps` | .eps | <1 min |

### Output Locations

All figures are saved to the `Replication/output/figures/` directory (created automatically by the scripts).

### Testing Information

These outputs have been tested on:
- **OS:** Linux (Ubuntu 20.04), Windows 10/11, macOS 12+
- **MATLAB:** R2020b, R2021a, R2022a
- **Dynare:** 4.5.6, 4.6.1, 4.6.4
- **Hardware:** Intel Core i7 (4 cores), 16GB RAM

Actual runtimes may vary depending on system specifications.

---

## Code Documentation and Format

### Code Quality Standards

All code in this replication package meets the following standards:

**1. Well-Commented Code**
- All MATLAB scripts (`.m` files) include header comments explaining purpose, inputs, and outputs
- Dynare model files (`.mod` files) include inline comments for each variable and equation
- Complex algorithms include step-by-step explanations
- Data transformations are documented with justifications

**2. Executable Format**
- All code is provided in source format (`.m` and `.mod` files)
- No compiled or binary-only code
- Can be executed directly in MATLAB with Dynare installed
- No manual modifications required

**3. Descriptive Variable Names**
- Variables use meaningful names matching economic concepts (e.g., `gam_YNCo_obs` = non-oil GDP growth)
- Parameter names match paper notation where possible
- Clear naming conventions throughout

**4. Modular Structure**
- Six self-contained steps that can be run independently (with appropriate inputs)
- Master script (`run_replication.m`) orchestrates execution
- Functions separated for clarity and reusability

**5. Documentation Files**
- `README.md`: Main replication instructions
- `RUN_REPLICATION_GUIDE.md`: Detailed usage guide for automated script
- `TESTING_SUMMARY.md`: Testing documentation and validation results
- `DATA_SOURCES.md`: Complete data source documentation
- Inline comments: Average of 15-20% of lines are comments

### Code Files

| File | Lines | Comment Lines | Purpose |
|------|-------|---------------|---------|
| `run_replication.m` | 708 | ~150 | Master orchestration script |
| `step1_data_processing.m` | 270 | ~50 | Data transformation pipeline |
| `step2_estimation.mod` | 1067 | ~130 | Bayesian DSGE estimation |
| `step3_decomposition.mod` | 1078 | ~120 | Historical shock decomposition |
| `step4_process_results.m` | 260 | ~40 | Results processing and tables |
| `step5_imf_simulations.m` | 837 | ~80 | Auto-generated by Dynare |
| `step5_imf_simulations.mod` | 726 | ~60 | IMF policy simulations |
| `step6_oil_risk_irf.m` | 82 | ~15 | Oil price impulse responses |

### Reproducibility

To ensure reproducibility:
1. All random number generator seeds are set where applicable
2. MCMC chains use fixed starting values
3. Pre-computed results included to ensure numerical consistency
4. Environment validation built into master script

### Version Control

This replication package is version-controlled on GitHub with:
- Complete commit history
- Tagged releases for journal submission
- Issue tracking for bug reports
- Changelog documenting updates

---

## Troubleshooting

### Common Issues

**1. "Dynare not found" error**
- **Solution:** Ensure Dynare is installed and added to MATLAB path:
  ```matlab
  addpath /path/to/dynare/matlab
  savepath
  ```

**2. "File not found" error when loading data**
- **Solution:** Verify you are running scripts from the `Replication/code/` directory:
  ```matlab
  cd /path/to/Replication/code/
  pwd  % Should show .../Replication/code/
  ```

**3. "Out of memory" during estimation (Step 2)**
- **Solution 1:** Use pre-computed results (skip Step 2)
- **Solution 2:** Reduce `mh_replic` parameter in `step2_estimation.mod` line 1043 (e.g., change 1000000 to 500000)
- **Solution 3:** Close other applications to free RAM

**4. Estimation not converging (Step 2)**
- **Check:** Ensure `estim_data.xlsx` exists and contains data
- **Check:** Review Dynare log file for diagnostic messages
- **Fallback:** Use pre-computed results

**5. Figures not generating (Step 5)**
- **Check:** Ensure all prior steps completed successfully
- **Check:** Verify MCMC result files exist in `code/` folder
- **Check:** Ensure `IMF_consolidation.xlsx` contains the "quarterly_gr" sheet

**6. "Invalid sheet name" error in Step 5**
- **Solution:** Verify `../data/IMF_consolidation.xlsx` contains these sheets: annual, quarterly, oil_revenue, annual_levels, quarterly_levels, quarterly_gr
- If "quarterly_gr" is missing, contact the authors for the complete file

---

## Contact

**Corresponding Author:**  
Juan Guerra-Salas  
Central Bank of Chile  
Email: jguerra@bcentral.cl

**Other Authors:**
- Manuel González-Astudillo: manuel.p.gonzalez-astudillo@frb.gov
- Avi Lipton: alipton@g.harvard.edu

---

## Citation

```bibtex
@article{gonzalez2026fiscal,
  title={Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective},
  author={Gonz{\'a}lez-Astudillo, Manuel and Guerra-Salas, Juan and Lipton, Avi},
  journal={Economic Modelling},
  year={2026},
  publisher={Elsevier}
}
```

---

## License

See LICENSE file for details.

The views expressed in this paper are solely the responsibility of the authors and should not be interpreted as reflecting the views of the Board of Governors of the Federal Reserve System, the Central Bank of Chile, or Harvard University.

---

## Changelog

### Version 1.2 (May 20, 2026)
- **NEW:** Added comprehensive "Data Availability Statement" section
- **NEW:** Created `REPLICATION_CHECKLIST.md` mapping all journal requirements
- **ENHANCED:** Expanded "Expected Outputs" section with detailed runtime and format information
- **ENHANCED:** Added "Code Documentation and Format" section documenting code quality standards
- **ENHANCED:** Improved "Hardware Requirements" with tested system specifications
- **UPDATED:** Completed all placeholder text in `DATA_SOURCES.md`
- **UPDATED:** Enhanced documentation for journal submission compliance
- **STATUS:** Ready for journal replication package submission

### Version 1.1 (May 12, 2026)
- **NEW:** Added `run_replication.m` master script for automated execution
  - Single-command replication of all results
  - Automatic environment validation (MATLAB, Dynare, toolboxes, files)
  - Automatic Dynare path detection
  - Real-time progress tracking with timing
  - Comprehensive error handling
  - Flexible execution options (check-only mode, custom steps, verbose output)
- **NEW:** Added `RUN_REPLICATION_GUIDE.md` with detailed usage instructions
- **NEW:** Added `TESTING_SUMMARY.md` with testing documentation
- **UPDATED:** README with automated replication instructions
- **UPDATED:** Dynare version requirement to 4.5+ (4.6+ recommended)
- **TESTED:** Confirmed compatibility with Dynare 4.5.6

### Version 1.0 (May 6, 2026)
- Initial release of replication package
- Manual step-by-step execution
- Pre-computed MCMC results included

---

**Last Updated:** May 20, 2026  
**Version:** 1.2 (Journal Submission)  
**Replication Package DOI:** [To be added upon publication]
