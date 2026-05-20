# Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective

**Authors:** Manuel González-Astudillo, Juan Guerra-Salas, Avi Lipton

**Affiliations:**
- Manuel González-Astudillo: Board of Governors of the Federal Reserve System and Escuela Superior Politécnica del Litoral
- Juan Guerra-Salas: Central Bank of Chile (Corresponding author)
- Avi Lipton: Harvard University

**Publication:** Economic Modelling (2026)

**DOI:** [To be added upon publication]

---

## 📦 Replication Package

**The complete replication package is located in the [`Replication/`](Replication/) directory.**

This package contains all code and data necessary to replicate the tables and figures in the published paper. 

### Documentation

- **[`Replication/README.md`](Replication/README.md)** - Complete replication instructions
- **[`Replication/REPLICATION_CHECKLIST.md`](Replication/REPLICATION_CHECKLIST.md)** - Journal requirements compliance checklist
- **[`Replication/data/DATA_SOURCES.md`](Replication/data/DATA_SOURCES.md)** - Data sources documentation

### Quick Start

```bash
cd Replication/
# See Replication/README.md for complete instructions
```

---

## Overview

This repository contains the replication materials for "Fiscal Consolidations in Commodity-Exporting Countries: A Small Open Economy DSGE Perspective." 

The paper evaluates the macroeconomic effects of different fiscal consolidation strategies in commodity-exporting small open economies, with application to Ecuador. Using a small open economy DSGE model estimated with Bayesian methods on Ecuadorian data (2004Q1-2019Q4), we simulate the 2020-2025 IMF fiscal consolidation under different oil revenue scenarios.

### Key Findings

- Oil revenue volatility creates asymmetric fiscal consolidation outcomes
- Spending-based consolidations are less contractionary than tax-based ones
- Government investment cuts have larger multipliers than consumption cuts
- Capital controls can partially insulate domestic rates from external shocks

---

## Repository Structure

```
soem_ecuador/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── CITATION.cff                 # Citation metadata
├── Replication/                 # 📦 COMPLETE REPLICATION PACKAGE
│   ├── README.md                # Detailed replication instructions
│   ├── code/                    # MATLAB/Dynare scripts (step1-step6)
│   ├── data/                    # All data files
│   └── eviews/                  # EViews documentation (optional)
└── archive/                     # Archived development materials
```

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

## Software Requirements

- **MATLAB** R2016a or later
- **Dynare** 4.6 or later (free DSGE modeling software)

See [`Replication/README.md`](Replication/README.md) for detailed installation instructions.

---

## Data Sources

All data are from publicly available sources:
- Ecuadorian macroeconomic data: Central Bank of Ecuador
- Oil market data: U.S. Energy Information Administration (EIA)
- Foreign variables: World Bank, FRED, J.P. Morgan
- Labor market data: INEC Ecuador
- IMF projections: IMF Article IV Consultation Reports

See [`Replication/data/DATA_SOURCES.md`](Replication/data/DATA_SOURCES.md) for complete documentation.

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

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

The views expressed in this paper are solely the responsibility of the authors and should not be interpreted as reflecting the views of the Board of Governors of the Federal Reserve System, the Central Bank of Chile, or Harvard University.

---

## Archive

Previous development materials, journal correspondence, and literature references have been archived in the `archive/` directory. The `Replication/` directory contains the clean, final replication package for the published paper.

---

**Last Updated:** May 20, 2026  
**Version:** 1.2 (Journal Submission)  
**Repository:** https://github.com/manuelgonzalezastudillo/soem_ecuador
