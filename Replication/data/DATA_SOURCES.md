# Data Sources Documentation

This document provides detailed information about all raw data sources used in this project.

## Overview

The model uses quarterly data for Ecuador from 2000Q1 to 2019Q4, supplemented with foreign variables and IMF projections for 2020-2026. All data are from publicly available sources.

## Raw Data Files

### Ecuadorian Macroeconomic Data

**File:** `OperSPNF_Historico.xlsx`
- **Source:** Central Bank of Ecuador (Banco Central del Ecuador)
- **URL:** https://www.bce.fin.ec/
- **Variables:** Government operations (consumption, investment, transfers, revenues, debt)
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Download Date:** [To be specified]
- **Access:** Public
- **Notes:** Non-Financial Public Sector (SPNF) operations data

**File:** `FBKFweb.xlsx`
- **Source:** Central Bank of Ecuador
- **URL:** https://www.bce.fin.ec/
- **Variables:** Gross Fixed Capital Formation (FBKF), private and public investment
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Download Date:** [To be specified]
- **Access:** Public
- **Notes:** National accounts data

**File:** Additional Ecuador data files in `/data/processed/data.xlsx`
- **Source:** Central Bank of Ecuador
- **Variables:** 
  - Non-oil GDP
  - Private consumption
  - Total investment
  - Oil GDP
  - Trade balance
  - GDP deflator
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Access:** Public via Central Bank statistical portal

### Labor Market Data

**File:** `Horas de trabajo promedio.xlsx`
- **Source:** Instituto Nacional de Estadística y Censos (INEC), Ecuador
- **URL:** https://www.ecuadorencifras.gob.ec/
- **Variables:** 
  - Average weekly hours worked
  - Unemployment rate
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Download Date:** [To be specified]
- **Access:** Public
- **Notes:** Labor force survey (Encuesta Nacional de Empleo, Desempleo y Subempleo - ENEMDU)

### Oil Market Data

**File:** Oil price and production data (incorporated in `data.xlsx`)
- **Source:** U.S. Energy Information Administration (EIA)
- **URL:** https://www.eia.gov/
- **Variables:** 
  - World oil prices (WTI or Brent crude)
  - Ecuador oil production (barrels)
- **Frequency:** Monthly, converted to quarterly
- **Period:** 2000M1-2019M12
- **Access:** Public via EIA API or data downloads
- **Notes:** Prices in USD per barrel

**File:** `oil_revenues_sd.xlsx`
- **Source:** Central Bank of Ecuador / Ministry of Finance
- **Variables:** Government oil revenues
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Access:** Public

### Foreign Variables

**File:** `embi_interestrate.xlsx` / `EMBI TS.xlsx`
- **Source:** J.P. Morgan
- **URL:** Available through financial data providers
- **Variables:** Ecuador EMBI (Emerging Markets Bond Index) spread
- **Frequency:** Daily, converted to quarterly averages
- **Period:** 2000Q1-2019Q4
- **Access:** Subscription required for real-time data, historical data publicly available
- **Notes:** Basis points over U.S. Treasury yields

**File:** Foreign interest rate data
- **Source:** Federal Reserve Economic Data (FRED)
- **URL:** https://fred.stlouisfed.org/
- **Variables:** U.S. Federal Funds Rate or 3-month Treasury Bill rate
- **Frequency:** Monthly/Quarterly
- **Period:** 2000Q1-2019Q4
- **Access:** Public
- **Notes:** Used as proxy for world risk-free rate

**File:** `API_NE.GDI.TOTL.ZS_DS2_en_excel_v2_4546338.xls`
- **Source:** World Bank World Development Indicators (WDI)
- **URL:** https://databank.worldbank.org/source/world-development-indicators
- **Variables:** World GDP growth (quarterly)
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Access:** Public
- **Notes:** Used to construct foreign GDP index

**File:** U.S. GDP Deflator (incorporated in `data.xlsx`)
- **Source:** U.S. Bureau of Economic Analysis (BEA)
- **URL:** https://www.bea.gov/
- **Variables:** U.S. GDP implicit price deflator
- **Frequency:** Quarterly
- **Period:** 2000Q1-2019Q4
- **Access:** Public
- **Notes:** Used to deflate nominal variables to U.S. goods

### Debt Data

**Files:** Public and private debt data (incorporated in `data.xlsx`)
- **Source:** Central Bank of Ecuador
- **Variables:**
  - Public external debt
  - Public internal debt
  - Private external debt
- **Frequency:** Quarterly/Annual
- **Period:** 2000Q1-2019Q4
- **Access:** Public
- **Notes:** Debt stocks in millions of USD

### IMF Projections

**File:** `51135-2021-07-economicprojections.xlsx`
- **Source:** International Monetary Fund
- **URL:** IMF Ecuador Article IV Consultation Reports
- **Variables:** Government fiscal projections (2020-2026)
  - Government consumption (wages and salaries, goods and services)
  - Government investment (fixed capital spending)
  - Government transfers (other spending)
- **Frequency:** Annual projections, converted to quarterly
- **Period:** 2020-2026
- **Access:** Public (IMF website)
- **Notes:** Used for counterfactual policy simulations

**File:** `IMF_US_Inflation.xlsx`
- **Source:** International Monetary Fund
- **Variables:** U.S. inflation projections
- **Frequency:** Annual, converted to quarterly
- **Period:** 2020-2026
- **Access:** Public (IMF World Economic Outlook)
- **Notes:** Used to deflate IMF nominal fiscal projections

**File:** `IMF_spending.xlsx`
- **Source:** Processed IMF data
- **Variables:** Consolidated IMF spending projections
- **Notes:** Created by `data_processing1.m` from IMF raw data

## Data Processing

### Transformations Applied

1. **Deflation:** All nominal variables (except quantities) are deflated using the U.S. GDP deflator to express values in terms of U.S. goods (the numeraire).

2. **Growth Rates:** Many variables are expressed as quarter-over-quarter growth rates (e.g., GDP growth, consumption growth).

3. **HP Filtering:** Some variables (oil production, world GDP, government consumption) are HP-filtered with smoothing parameter λ=1600 to extract cyclical components.

4. **Frequency Conversion:** 
   - Monthly data are converted to quarterly using 3-month moving averages for flow variables
   - Annual data are converted to quarterly assuming uniform quarterly growth

5. **Demeaning:** All observables used in estimation are demeaned (mean removed) to match the model's stationary deviations from steady state.

### Missing Data

- **Hours worked:** Some missing observations are filled using forward-fill method (previous quarter's value)
- **Transfers:** Government transfers exclude social security payments to focus on discretionary transfers

## Data Validation

### Consistency Checks

1. National accounts identities verified in original sources
2. Debt flow/stock consistency checked
3. Cross-source validation for overlapping variables

### Known Issues

- [To be specified if any]

## Data Updates

This dataset covers the period up to 2019Q4, before the COVID-19 pandemic. Users interested in extending the analysis should note that:
- Structural breaks may exist due to the pandemic (2020+)
- Ecuador adopted additional fiscal reforms post-2019
- Oil market dynamics changed significantly in 2020

## Replication Notes

To fully replicate the data processing:
1. Download raw data files from sources listed above
2. Place files in `/data/raw/` directory
3. Ensure file names match those referenced in `data_processing1.m`
4. Run `data_processing1.m` to reproduce processed data files

## Contact for Data Questions

For questions about data sources or processing:
- Manuel González-Astudillo: manuel.p.gonzalez-astudillo@frb.gov
- Juan Guerra-Salas: jguerra@bcentral.cl

---

**Last Updated:** April 27, 2026
