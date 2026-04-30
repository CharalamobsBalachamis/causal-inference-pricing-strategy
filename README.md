Causal Impact Analysis: Pricing Strategy Evaluation

An analytical project that applies econometric modeling to quantify the causal impact of a localized marketing campaign. This implementation uses a Difference-in-Differences (DiD) framework to isolate true revenue uplift from underlying market trends.

Objective

Naive before-and-after comparisons of sales performance often overestimate the effectiveness of marketing interventions by failing to account for seasonality and macroeconomic growth.

This project replaces simple comparisons with a causal inference approach, enabling accurate estimation of incremental revenue attributable to a campaign while mitigating analytical bias.

Tech Stack
Language: Python / R (adjust depending on your actual code)
Libraries: pandas, statsmodels / tidyverse (adjust as needed)
Methodology: Difference-in-Differences (DiD), Two-Way Fixed Effects (TWFE)
Logic & Features
Causal Impact Estimator:
Implements a Difference-in-Differences model comparing a treatment group (São Paulo) against control regions (Rio de Janeiro, Minas Gerais), isolating the net effect of the intervention.
Trend & Seasonality Control:
Uses a Two-Way Fixed Effects framework to remove time-based shocks and region-specific baseline differences, ensuring robustness under the Parallel Trends assumption.
ROI Decomposition:
Quantifies the gap between naive revenue attribution and true causal impact, demonstrating how traditional methods can mislead business decisions.
Results
Identified a statistically significant ($p < 0.05$) incremental revenue increase of ~104,500 BRL per month.
Demonstrated that naive analysis would have misattributed ~82,000 BRL/month to the campaign.
Estimated total incremental revenue of ~836,400 BRL over the 8-month post-intervention period.
Files in this Repository
causal_analysis_script.*: Core data processing and econometric modeling logic.
analysis_report.*: Report containing methodology, results, and visualizations.
Data Source & Notes
Dataset: Olist Brazilian E-Commerce Dataset (Kaggle)
Note: The campaign scenario is hypothetical and designed to demonstrate causal inference techniques on real-world transactional data.
