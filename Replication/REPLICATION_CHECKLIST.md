# Journal Replication Package Checklist

This document maps each requirement from the journal's replication package checklist to its location in this replication package. Use this as a quick reference to verify compliance.

---

## README Requirements

### ✓ Title and Overview

- [x] **Paper title included** → `README.md` lines 3-5
  - Title: "Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective"
  
- [x] **Authors' names included** → `README.md` lines 3-5
  - Manuel González-Astudillo (Federal Reserve Board & ESPOL Ecuador)
  - Juan Guerra-Salas (Central Bank of Chile) - Corresponding author
  - Avi Lipton (Harvard University)

- [x] **Brief overview of replication package** → `README.md` lines 26-40
  - 6-step replication process described
  - Automated and manual execution methods
  - Estimated completion time provided

### ✓ Data Information

- [x] **Public availability status indicated** → `README.md` Section "Data Availability Statement" (lines 155-179)
  - Explicit statement: "All data used in this replication package are publicly available"
  - Statement that no proprietary or restricted data are used
  - No special permissions required

- [x] **Detailed information on each data source** → `data/DATA_SOURCES.md`
  - Ecuadorian macroeconomic data (Central Bank of Ecuador)
  - Oil market data (U.S. EIA)
  - Labor market data (INEC Ecuador)
  - Foreign variables (World Bank, FRED, J.P. Morgan, BEA)
  - IMF projections (IMF Article IV Reports)
  - Each source includes: URL, variables, frequency, period, access method

### ✓ Instructions to Replicators

- [x] **List of required dependencies** → `README.md` lines 43-72
  - MATLAB R2016a or later
  - Dynare 4.5+ (4.6+ recommended)
  - Required toolboxes: Statistics and Machine Learning, Optimization
  - Installation steps provided
  - Hardware requirements specified (lines 75-115)

- [x] **Step-by-step replication instructions** → `README.md` lines 181-380
  - **Automated method:** Single command `run_replication()` (lines 181-223)
  - **Manual method:** Six detailed steps with inputs/outputs for each (lines 225-380)
  - Additional documentation:
    - `code/RUN_REPLICATION_GUIDE.md` - Detailed usage guide
    - `code/TESTING_SUMMARY.md` - Testing documentation

### ✓ List of Tables and Programs

- [x] **List of all tables and figures** → `README.md` lines 414-466
  - Tables 1-5 mapped to generating scripts
  - Figures 1-10 mapped to generating scripts
  - Additional outputs documented (oil/risk IRFs)

- [x] **Summary table with programs and output files** → `README.md` lines 414-466
  - Each table shows: Description, Script name, Output format, Runtime
  - Each figure shows: Description, Script name, File name, Format, Runtime
  - Output locations specified

---

## Data Sharing Requirements

### ✓ Raw Data

- [x] **Raw data included** → `archive/raw/` directory
  - 47 raw data files from original public sources
  - Files include:
    - `OperSPNF_Historico.xlsx` (Ecuador government operations)
    - `FBKFweb.xlsx` (Investment data)
    - `Horas de trabajo promedio.xlsx` (Labor market)
    - `EMBI TS.xlsx` (Country risk)
    - `API_NE.GDI.TOTL.ZS_DS2_en_excel_v2_4546338.xls` (World Bank)
    - `51135-2021-07-economicprojections.xlsx` (IMF projections)
    - And 41 more files
  - All files from publicly available sources

### ✓ Analysis Data

- [x] **Analysis data provided** → `data/` directory
  - `data.xlsx` - Master quarterly dataset (2000Q1-2019Q4)
  - `estim_data.xlsx` - Estimation dataset (2004Q1-2019Q4, 18 observables)
  - `IMF_consolidation.xlsx` - IMF fiscal scenarios (2020-2026)
  - `oil_revenues.xlsx` - Oil revenue data
  - `IMF_spending.xlsx` - Processed IMF data
  - Pre-computed MCMC results:
    - `code/SOE_Estimation_*.mat` (6 files, ~200MB)
    - `code/SOE_Decomposition_results.mat` (2.1MB)

### ✓ Non-Public Data

- [x] **Not applicable** - All data are publicly available
  - Explicit statement in Data Availability Statement (lines 155-179)
  - No synthetic or pseudo-data needed
  - All data sources documented with public URLs

---

## Code Sharing Requirements

### ✓ Data Management Code

- [x] **Code to clean, merge, and transform raw data** → `code/step1_data_processing.m`
  - Loads raw quarterly, monthly, and annual data
  - Converts monthly to quarterly (3-month averages)
  - Deflates nominal variables (U.S. GDP deflator)
  - Computes growth rates and ratios
  - Applies HP-filter for cyclical components
  - Demeans observables for estimation
  - Creates `estim_data.xlsx` (analysis dataset)
  - 270 lines, well-commented

### ✓ Analysis Code

- [x] **Programs that produce all computational results** → `code/` directory
  - `step2_estimation.mod` - Bayesian MCMC estimation (1067 lines)
  - `step3_decomposition.mod` - Historical shock decomposition (1078 lines)
  - `step4_process_results.m` - Tables and statistics (260 lines)
  - `step5_imf_simulations.m/.mod` - Policy simulations (837+726 lines)
  - `step6_oil_risk_irf.m` - Oil price IRFs (82 lines)
  - `run_replication.m` - Master orchestration script (708 lines)

### ✓ Format Requirements

- [x] **Well-commented code** → See `README.md` Section "Code Documentation and Format"
  - All `.m` files include header comments
  - All `.mod` files include inline variable documentation
  - Average 15-20% of lines are comments
  - Complex algorithms explained step-by-step

- [x] **Executable source format** → All code in `.m` and `.mod` format
  - No compiled or binary-only code
  - Can be executed directly in MATLAB with Dynare
  - No manual modifications required
  - Environment validation built into master script

- [x] **Interpretable/Compilable by appropriate software** → MATLAB/Dynare
  - Tested on MATLAB R2020b, R2021a, R2022a
  - Tested on Dynare 4.5.6, 4.6.1, 4.6.4
  - Tested on Linux, Windows, macOS
  - Automatic Dynare path detection

---

## Additional Documentation

Beyond the minimum requirements, this package includes:

- [x] `RUN_REPLICATION_GUIDE.md` - Comprehensive usage guide for automated script
- [x] `TESTING_SUMMARY.md` - Testing documentation and validation results
- [x] `DATA_SOURCES.md` - Complete data source documentation
- [x] `CITATION.cff` - Machine-readable citation metadata
- [x] `LICENSE` - MIT License
- [x] `eviews/README.txt` - Documentation of optional EViews files
- [x] Pre-computed results to skip 8-hour estimation
- [x] Automated environment validation
- [x] Real-time progress tracking
- [x] Comprehensive troubleshooting guide

---

## Compliance Summary

| Category | Requirements | Met | Location |
|----------|-------------|-----|----------|
| **README** | Title, authors, overview | ✓ | `README.md` lines 3-40 |
| **README** | Data information | ✓ | `README.md` lines 120-179 |
| **README** | Dependencies | ✓ | `README.md` lines 43-115 |
| **README** | Instructions | ✓ | `README.md` lines 181-380 |
| **README** | Table/figure list | ✓ | `README.md` lines 414-466 |
| **Data** | Raw data | ✓ | `archive/raw/` (47 files) |
| **Data** | Analysis data | ✓ | `data/` (5 main files) |
| **Data** | Non-public handling | ✓ | N/A - all public |
| **Code** | Data management | ✓ | `code/step1_data_processing.m` |
| **Code** | Analysis code | ✓ | `code/step2-step6` (6 files) |
| **Code** | Well-commented | ✓ | All `.m` and `.mod` files |
| **Code** | Executable format | ✓ | MATLAB/Dynare source code |

**Result: 12/12 requirements met (100%)**

---

## For Journal Editors and Reviewers

This replication package has been prepared following best practices for computational reproducibility:

1. **Complete transparency:** All data sources documented with public URLs
2. **Full replication:** Raw data → analysis data → results, all code provided
3. **User-friendly:** Automated single-command execution with validation
4. **Tested:** Verified on multiple operating systems and software versions
5. **Time-efficient:** ~15 minutes to replicate all results (using pre-computed MCMC)
6. **Well-documented:** 5 markdown documentation files + inline code comments
7. **Version-controlled:** Available on GitHub with tagged releases

**Total package size:** ~300MB (code + data + pre-computed results)

**Estimated replication time:**
- Quick verification: 5 minutes (check environment + run subset)
- Complete replication (without re-estimation): 15 minutes
- Complete replication (with full MCMC): 8.25 hours

---

## Contact for Replication Questions

**Corresponding Author:**  
Juan Guerra-Salas  
Central Bank of Chile  
Email: jguerra@bcentral.cl

**Other Authors:**
- Manuel González-Astudillo: manuel.p.gonzalez-astudillo@frb.gov
- Avi Lipton: alipton@g.harvard.edu

---

**Last Updated:** May 20, 2026  
**Package Version:** 1.2
