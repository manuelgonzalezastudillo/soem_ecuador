EViews Workfiles Documentation
================================

IMPORTANT: These EViews files are provided for DOCUMENTATION and TRANSPARENCY purposes only.
You DO NOT need to run them or have EViews installed to replicate the paper's results.
All outputs from these workfiles are already included in the data files.

================================================================================

1. frequency_conversion_IMF_consolidation.WF1
---------------------------------------------

PURPOSE:
Documents the temporal disaggregation methodology used to convert IMF annual fiscal
projections (2020-2026) to quarterly frequency.

INPUT:
- Annual growth rates for Government Consumption, Government Investment, Transfers,
  and Oil Revenue from IMF Article IV Consultation Reports (2020-2026)

OUTPUT:
- The "quarterly_gr" sheet in ../data/IMF_consolidation.xlsx
- This sheet contains quarterly growth rates for the four fiscal variables

METHOD:
- Temporal disaggregation assuming constant quarterly growth rates within each year
- If annual growth is g_annual, quarterly growth is: g_quarterly = (1 + g_annual)^(1/4) - 1
- This preserves the annual cumulative growth while distributing it evenly across quarters

USAGE IN REPLICATION:
- NOT REQUIRED. The "quarterly_gr" sheet is already present in IMF_consolidation.xlsx
- Used by step5_imf_simulations.m (lines 690, 845, 934, 1048, 1148)

PROVENANCE:
- Created by co-authors to process IMF projections for the policy simulation exercises
- EViews version: 11 or later


================================================================================

2. embi_interestrate.wf1
-------------------------

PURPOSE:
Documents the linear regression used to estimate the interest rate pass-through
parameter μ (mu) for the capital controls counterfactual scenario in the appendix.

INPUT:
- ../data/embi_interestrate.xlsx containing:
  * EMBI spread (Ecuador country risk)
  * Domestic passive interest rate (deposit rate)
  * Domestic active interest rate (lending rate)
  * U.S. Federal Funds Rate
- Sample period: Quarterly data (exact period documented in workfile)

OUTPUT:
- Estimate of μ = 0.15
- This parameter measures the pass-through from foreign interest rates and risk spreads
  to domestic interest rates under capital controls

INTERPRETATION:
- μ = 1 (baseline model): Full pass-through, consistent with dollarized economy
- μ = 0.15 (capital controls scenario): Only 15% of external rate changes transmit
  to domestic rates, representing financial market segmentation under capital controls

ECONOMETRIC SPECIFICATION:
The regression estimates how domestic interest rates respond to:
1. Changes in the U.S. Federal Funds Rate
2. Changes in Ecuador's EMBI spread

The estimated coefficient represents the degree of financial integration.

USAGE IN REPLICATION:
- NOT REQUIRED. The parameter μ = 0.15 is hardcoded in the simulation scripts
- Used in step5_imf_simulations.m (line 926): set_param_value('mu', 0.15)
- Only affects the capital controls scenario shown in the appendix
- Main paper results use μ = 1 (full pass-through, baseline calibration)

REFERENCE IN PAPER:
- Discussed in Section [X] and Appendix [Y]
- Used to construct the counterfactual "What if Ecuador had capital controls?" scenario

PROVENANCE:
- Estimated by co-authors using Vector Autoregression (VAR) analysis
- EViews version: 11 or later


================================================================================

WHY ARE THESE FILES INCLUDED?

Academic transparency and replicability standards require documenting ALL steps of the
analysis, including auxiliary calculations. While the MATLAB/Dynare workflow is fully
self-contained, these EViews files allow interested researchers to:

1. Verify the temporal disaggregation methodology
2. Understand the econometric basis for the μ = 0.15 parameter
3. Re-estimate these parameters using updated data or alternative methods
4. Audit the complete research workflow

However, for the purposes of replicating the paper's main results, these files are
not necessary - all their outputs are already incorporated into the data files and
MATLAB scripts.

================================================================================

CONTACT:

For questions about these workfiles:
Juan Guerra-Salas (jguerra@bcentral.cl)
Manuel González-Astudillo (manuel.p.gonzalez-astudillo@frb.gov)

================================================================================
