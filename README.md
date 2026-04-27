# Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective

**Authors:** Manuel González-Astudillo, Juan Guerra-Salas, Avi Lipton

**Affiliations:**
- Manuel González-Astudillo: Board of Governors of the Federal Reserve System and Escuela Superior Politécnica del Litoral
- Juan Guerra-Salas: Central Bank of Chile (Corresponding author)
- Avi Lipton: Harvard University

**Publication:** Economic Modelling (2026)

**DOI:** [To be added upon publication]

## Overview

This repository contains the complete replication package for "Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective." The package includes:

- Raw and processed quarterly data for Ecuador (2000Q1-2019Q4)
- Bayesian estimation code for a small open economy DSGE model
- Policy simulation code for fiscal consolidation experiments
- All code to replicate tables and figures in the published paper

The model evaluates the macroeconomic effects of different fiscal consolidation strategies in commodity-exporting small open economies, with application to Ecuador.

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

## Repository Structure

```
SOEM_Ecuador/
├── README.md                    # This file
├── LICENSE                      # License information
├── CITATION.cff                # Citation metadata
├── code/
│   ├── data_processing1.m      # Data processing script
│   └── model/                  # Main estimation and simulation code
│       ├── SOE_Estimation.mod  # Bayesian estimation
│       ├── SOE_Decomposition.mod # Shock decomposition
│       ├── process_results.m   # Results compilation
│       ├── simulation_setup_final.m # Policy scenarios
│       ├── SOE_simulations.mod # Policy simulations
│       └── IRFs_final.m        # IRF generation
├── data/
│   ├── raw/                    # Original data sources
│   ├── processed/              # Cleaned and compiled data
│   ├── analysis/               # Data ready for estimation
│   └── DATA_SOURCES.md         # Detailed data documentation
├── manuscript/
│   ├── manuscript.tex          # LaTeX source
│   ├── references.bib          # Bibliography
│   ├── Figures/                # Manuscript figures
│   ├── highlights.docx         # Paper highlights
│   └── competing_interests.docx # Declaration
└── references/                 # Background literature
```

## Data Availability

### Data Sources

All data are from publicly available sources:

1. **Ecuadorian Macroeconomic Data**
   - Source: Central Bank of Ecuador
   - Variables: Non-oil GDP, private consumption, investment, government fiscal variables, trade balance, debt stocks, GDP deflator
   - Frequency: Quarterly (2000Q1-2019Q4)
   - Availability: Public

2. **Oil Market Data**
   - Source: U.S. Energy Information Administration (EIA)
   - Variables: Oil prices, Ecuador oil production
   - Frequency: Monthly, converted to quarterly
   - Availability: Public

3. **Foreign Variables**
   - World GDP: World Bank World Development Indicators
   - U.S. Interest Rates: Federal Reserve Economic Data (FRED)
   - EMBI Spread: J.P. Morgan
   - U.S. GDP Deflator: Bureau of Economic Analysis
   - Frequency: Quarterly/Monthly
   - Availability: Public

4. **Labor Market Data**
   - Source: Instituto Nacional de Estadística y Censos (INEC), Ecuador
   - Variables: Hours worked, unemployment rate
   - Frequency: Quarterly
   - Availability: Public

5. **IMF Fiscal Projections**
   - Source: International Monetary Fund
   - Variables: Government spending projections (2020-2026)
   - Frequency: Annual, converted to quarterly
   - Availability: IMF Article IV reports

See `data/DATA_SOURCES.md` for complete documentation of all raw data files.

### Processed Data Files

- `/data/processed/data.xlsx`: Master quarterly dataset (2000Q1-2019Q4) with 26 variables across three sheets (quarterly, monthly, annual data)
- `/data/processed/oil_revenues.xlsx`: Oil revenue data and projections
- `/data/analysis/estim_data.xlsx`: Demeaned observables for model estimation (2004Q1-2019Q4, 18 variables)
- `/data/analysis/IMF_consolidation.xlsx`: IMF fiscal consolidation scenarios

All data are publicly available or derived from publicly available sources.

## Software Requirements

### Required Software

- **MATLAB** (R2016a or later)
  - Required toolboxes: Statistics and Machine Learning Toolbox, Optimization Toolbox
  - Download: https://www.mathworks.com/products/matlab.html

- **Dynare** (4.6 or later)
  - Free software for solving and estimating DSGE models
  - Download and installation: https://www.dynare.org/
  - After installation, add Dynare to your MATLAB path

### Installation Instructions

1. Install MATLAB (R2016a or later)
2. Install Dynare (4.6 or later) following instructions at https://www.dynare.org/resources/quick_start/
3. Add Dynare to MATLAB path:
   ```matlab
   addpath /path/to/dynare/matlab
   ```
4. Clone this repository:
   ```bash
   git clone https://github.com/manuelgonzalezastudillo/soem_ecuador.git
   cd soem_ecuador
   ```

### Hardware Requirements

- **Processor:** Multi-core processor recommended (estimation uses parallel computing)
- **RAM:** 8GB minimum, 16GB recommended
- **Disk Space:** ~2GB for code and data, additional space for MCMC output
- **Computation Time:** The Bayesian estimation step (Step 2) is computationally intensive and may take several hours depending on hardware

## Replication Instructions

Run the following steps in sequence from MATLAB. All scripts should be run from their respective directories.

### Step 1: Data Processing

**Working directory:** `/code/`

```matlab
cd code
data_processing1.m
```

**Inputs:** 
- Raw data files from `/data/raw/`
- Master data file `/data/processed/data.xlsx`

**Outputs:**
- `/data/analysis/estim_data.xlsx` (demeaned observables for estimation)
- `/data/analysis/IMF_spending.xlsx` (IMF consolidation scenarios)

**Description:** Loads raw quarterly data, deflates nominal variables to U.S. goods, computes growth rates and ratios, applies HP-filter to extract cyclical components, estimates fiscal policy rules using OLS, and creates IMF projection scenarios for 2020-2026.

**Expected runtime:** < 1 minute

---

### Step 2: Model Estimation

**Working directory:** `/code/model/`

```matlab
cd code/model
dynare SOE_Estimation
```

**Inputs:** 
- `/data/analysis/estim_data.xlsx`

**Outputs:**
- `SOE_Estimation_results.mat` (full posterior distribution)
- `SOE_Estimation_mode.mat` (posterior mode)
- `/MH_draws/` folder (Metropolis-Hastings MCMC chains)
- Log files with estimation diagnostics

**Description:** Bayesian estimation using Metropolis-Hastings MCMC algorithm. Estimates 46 parameters including structural parameters and shock processes for 13 shocks using 18 observables (2004Q1-2019Q4). The algorithm first finds the posterior mode using optimization, then samples from the posterior distribution using MCMC with 1 million draws per chain (2 chains).

**Expected runtime:** Several hours (depends on hardware). The MCMC sampling is the time-intensive step.

**Note:** This step is computationally intensive. Pre-computed results are included in the repository for verification purposes.

---

### Step 3: Shock Decomposition

**Working directory:** `/code/model/`

```matlab
cd code/model
dynare SOE_Decomposition
```

**Inputs:** 
- `SOE_Estimation_results.mat` (from Step 2)
- `/data/analysis/estim_data.xlsx`

**Outputs:**
- `SOE_Decomposition_results.mat`
- Shock decomposition figures in `/shock_decomp_results/` subfolder
- Historical and smoothed variable figures

**Description:** Uses posterior mean estimates to perform historical shock decomposition, showing the contribution of each shock group (Technology, Foreign, Oil, Risk Premium, Preference, Fiscal) to observed fluctuations. Also produces variance decomposition and smoothed historical series.

**Expected runtime:** ~5-10 minutes

---

### Step 4: Compile Results Tables

**Working directory:** `/code/model/`

```matlab
cd code/model
process_results.m
```

**Inputs:** 
- `SOE_Decomposition_results.mat`
- `/data/analysis/estim_data.xlsx`
- `/data/processed/data.xlsx`

**Outputs:**
- Theoretical vs empirical moments (console output)
- Variance decomposition tables (console output)
- Shock decomposition figures for all observables

**Description:** Computes model fit statistics including correlations with output, autocorrelations, standard deviations, and variance decomposition by shock group. Generates figures comparing model-implied and actual debt paths.

**Expected runtime:** ~2-3 minutes

---

### Step 5: Setup Policy Simulations

**Working directory:** `/code/model/`

```matlab
cd code/model
simulation_setup_final.m
```

**Inputs:** 
- Calibrated fiscal policy parameter changes

**Outputs:** Scenario files in `/data/analysis/`:
- `estim_data_ct_ss.xlsx` (consumption tax increase scenario)
- `estim_data_nt_ss.xlsx` (labor income tax increase scenario)
- `estim_data_kt_ss.xlsx` (capital income tax increase scenario)
- `estim_data_g_c_ss.xlsx` (government consumption cut scenario)
- `estim_data_g_i_ss.xlsx` (government investment cut scenario)
- `estim_data_tr_ss.xlsx` (transfer cut scenario)
- `estim_data_oil_ss.xlsx` (oil revenue increase scenario)
- `estim_data_IMF_ss.xlsx` (baseline IMF consolidation)
- `estim_data_IMF_ss_up.xlsx` (IMF consolidation with high oil prices)
- `estim_data_IMF_ss_down.xlsx` (IMF consolidation with low oil prices)

**Description:** Creates Excel files with paths for fiscal policy instruments under different counterfactual scenarios. Each scenario represents a 1% of GDP fiscal consolidation achieved through different fiscal instruments, or the IMF-proposed consolidation package.

**Expected runtime:** < 1 minute

---

### Step 6: Policy Simulations

**Working directory:** `/code/model/`

```matlab
cd code/model
dynare SOE_simulations
```

**Inputs:** 
- Scenario files from Step 5
- `SOE_Estimation_results.mat`

**Outputs:** 
- `SOE_simulations_results.mat` (state-space representation)

**Description:** Runs policy counterfactual simulations for fiscal consolidation scenarios. Computes model solution and prepares state-space matrices for impulse response function generation.

**Expected runtime:** ~2-3 minutes

---

### Step 7: Generate IRF Figures

**Working directory:** `/code/model/`

```matlab
cd code/model
IRFs_final.m
```

**Inputs:** 
- `SOE_simulations_results.mat`
- Scenario files from `/data/analysis/`

**Outputs:** IRF figures (EPS and PDF formats):
- `Consumption_Tax_IRF.pdf/eps`
- `Labor_Tax_IRF.pdf/eps`
- `Capital_Tax_IRF.pdf/eps`
- `Government_Consumption_IRF.pdf/eps`
- `Government_Investment_IRF.pdf/eps`
- `Government_Transfers_IRF.pdf/eps`
- `Oil_revenue_IRF.pdf/eps`
- `IMF_Simulation.pdf/eps` (with oil price uncertainty bands)
- Additional figures for robustness checks

**Description:** Generates impulse response functions for 7 fiscal policy scenarios showing the dynamic effects on key macroeconomic variables (output, consumption, investment, debt, etc.) over 20 quarters. Also produces IMF consolidation simulations with uncertainty bands for different oil price scenarios.

**Expected runtime:** ~5 minutes

---

## Output Files and Correspondence to Paper

### Tables

| Table | Description | Generated by | Output location |
|-------|-------------|--------------|-----------------|
| Table 1 | Calibrated parameters | Paper text | Steady-state values in code |
| Table 2 | Prior and posterior distributions | `SOE_Estimation.mod` | `SOE_Estimation_results.mat`, console output |
| Table 3 | Moments comparison (data vs model) | `process_results.m` | Console output |
| Table 4 | Variance decomposition by shock group | `process_results.m` | Console output from `SOE_Decomposition_results.mat` |
| Table 5 | Fiscal consolidation scenarios | Paper text | Scenario definitions in `simulation_setup_final.m` |

### Figures

| Figure | Description | Generated by | File name |
|--------|-------------|--------------|-----------|
| Figure 1 | Observed series (Ecuador data) | `data_processing1.m` or paper | Data plots |
| Figure 2 | Prior vs posterior distributions | `SOE_Estimation.mod` | Dynare output |
| Figure 3 | Historical shock decomposition | `SOE_Decomposition.mod` | Files in `/shock_decomp_results/` |
| Figure 4 | Consumption tax consolidation IRFs | `IRFs_final.m` | `Consumption_Tax_IRF.pdf` |
| Figure 5 | Labor tax consolidation IRFs | `IRFs_final.m` | `Labor_Tax_IRF.pdf` |
| Figure 6 | Capital tax consolidation IRFs | `IRFs_final.m` | `Capital_Tax_IRF.pdf` |
| Figure 7 | Government consumption cut IRFs | `IRFs_final.m` | `Government_Consumption_IRF.pdf` |
| Figure 8 | Government investment cut IRFs | `IRFs_final.m` | `Government_Investment_IRF.pdf` |
| Figure 9 | Transfer cut IRFs | `IRFs_final.m` | `Government_Transfers_IRF.pdf` |
| Figure 10 | IMF consolidation simulation | `IRFs_final.m` | `IMF_Simulation.pdf` |

## Model Description

The model is a small open economy DSGE model calibrated to Ecuador with the following key features:

**Households:** Two types of households: (1) Ricardian optimizers who smooth consumption and hold assets, and (2) rule-of-thumb consumers who consume their disposable income each period. Share of Ricardian households is estimated.

**Production:** Competitive firms produce a home good using capital and labor with Cobb-Douglas technology. Home and foreign goods are combined in CES aggregation to produce final consumption and investment goods.

**Government:** Government finances expenditures (consumption, investment, transfers) through three distortionary taxes (consumption, labor income, capital income) and oil revenues, and can accumulate debt. Fiscal policy rules make spending and taxes respond to output deviations and debt levels.

**Oil Sector:** Exogenous oil production and world oil prices. Oil revenues accrue to the government as a windfall.

**Financial Sector:** Country risk premium depends on net foreign asset position and external shocks, affecting the interest rate faced by domestic borrowers.

**Foreign Sector:** Small open economy takes as given world interest rate, world GDP, oil price, and oil production. All follow exogenous AR(1) processes.

**Shocks:** 13 structural shocks including technology, foreign variables (interest rate, GDP, oil price/quantity), risk premium, preferences (consumption, labor supply, investment), and fiscal policy (government consumption, investment, transfers).

**Estimation:** Bayesian estimation using 18 quarterly observables (2004Q1-2019Q4) including non-oil GDP growth, consumption, investment, hours worked, EMBI spread, oil variables, government fiscal variables, and debt flows.

## Troubleshooting

### Common Issues

1. **Dynare not found:**
   - Ensure Dynare is installed and added to MATLAB path
   - Run `addpath /path/to/dynare/matlab` in MATLAB

2. **Data file not found:**
   - Check that you are running scripts from the correct working directory
   - Verify that data folder structure matches repository organization

3. **Out of memory during estimation:**
   - Reduce `mh_replic` parameter in `SOE_Estimation.mod` (line 1043)
   - Close other applications to free RAM

4. **Estimation not converging:**
   - Check that data files are correctly formatted
   - Review Dynare log file for diagnostic messages
   - Pre-computed results are included if estimation is problematic

5. **Figures not generating:**
   - Ensure all prior steps completed successfully
   - Check that output directories exist and are writable

## License

This project is licensed under the MIT License - see the LICENSE file for details.

The views expressed in this paper are solely the responsibility of the authors and should not be interpreted as reflecting the views of the Board of Governors of the Federal Reserve System, the Central Bank of Chile, or Harvard University.

## Contact

**Corresponding Author:**
Juan Guerra-Salas  
Central Bank of Chile  
Email: jguerra@bcentral.cl

**Other Authors:**
- Manuel González-Astudillo: manuel.p.gonzalez-astudillo@frb.gov
- Avi Lipton: alipton@g.harvard.edu

## Acknowledgments

[To be added from paper acknowledgments section]

## Updates and Errata

Any updates or corrections to this replication package will be posted here:
- [Date]: [Description of update]

---

**Last updated:** April 27, 2026  
**Version:** 1.0
