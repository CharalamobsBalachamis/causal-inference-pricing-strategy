# Causal Impact Analysis: Marketing ROI via Difference-in-Differences

An applied causal inference project isolating the true incremental revenue of a localized marketing intervention from natural seasonality and macroeconomic trends. 

##  Data Source
* Built using the **Olist Brazilian E-Commerce Dataset** (Kaggle). 
* *Note: While the underlying transaction data is real, the specific "Free Shipping" intervention is a hypothetical scenario designed to demonstrate causal inference methodology in a commercial environment.*

## Methods & Tech Stack

* **Econometrics (Causal Inference):** Implemented a Difference-in-Differences (DiD) regression framework. Evaluated a treatment region (São Paulo) against highly correlated control regions (Rio de Janeiro, Minas Gerais) to filter out time-based shocks and baseline regional differences under the Parallel Trends assumption.
* **ROI Decomposition:** Quantified the exact mathematical gap between naive revenue attribution (simple before-and-after comparisons) and true causal impact.
* **Stack:** R (`tidyverse`, `fixest`, `ggplot2`).

---

## Core Findings

* **True Uplift:** Identified a statistically significant ($p < 0.05$) true incremental revenue increase of ~104,500 BRL per month.
* **Total Value:** Calculated a total incremental revenue generation of ~836,400 BRL over the 8-month post-intervention period.
* **Prevented Misattribution:** Demonstrated that standard descriptive analytics (naive before-and-after comparison) failed to account for underlying trends, falsely attributing an extra ~82,000 BRL/month to the campaign and severely inflating perceived ROI.

---

##  Econometric Specification

To isolate the net effect of the intervention from background market noise, the causal impact estimator relies on the standard DiD equation:

$$ \text{Revenue}_{it} = \alpha + \beta_1 \text{Treat}_i + \beta_2 \text{Post}_t + \delta (\text{Treat}_i \times \text{Post}_t) + \varepsilon_{it} $$

Where:
* $\text{Treat}_i$: A dummy variable equal to $1$ for the treatment region (São Paulo) and $0$ for the control regions.
* $\text{Post}_t$: A dummy variable equal to $1$ for the post-intervention period.
* $\delta$: The Difference-in-Differences estimator (the interaction term) capturing the true causal, incremental effect of the marketing campaign.
* $\alpha, \beta_1, \beta_2$: Baseline intercepts and main effects for group and time.



