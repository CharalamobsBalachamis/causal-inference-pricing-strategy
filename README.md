# Causal Impact Analysis: Evaluating Pricing Strategy via Difference-in-Differences

**[View the Live Executive Report Here](https://charalamobsbalachamis.github.io/causal-inference-pricing-strategy/did_portfolio.html)**

## Overview
When businesses launch promotional campaigns, sales often rise. However, isolating the campaign's actual return on investment (ROI) from natural seasonal market growth is challenging. Naive before-and-after comparisons typically misattribute general market trends to the intervention.

This project evaluates whether a localized marketing campaign in São Paulo drove statistically significant incremental revenue, controlling for macroeconomic trends and regional baseline differences.

## Methodology
To isolate the causal impact, I used a Difference-in-Differences (DiD) estimator on panel data.
* **Treatment Group:** Orders from São Paulo (SP).
* **Control Group:** Orders from neighboring major states (Rio de Janeiro and Minas Gerais).
* **Model:** A Two-Way Fixed Effects (TWFE) model was used to filter out time-trends and seasonal noise, satisfying the fundamental Parallel Trends assumption.

## Results
A standard comparison would have falsely attributed a natural market lift of ~82,000 BRL/month to the campaign. After mathematically stripping away baseline differences and macro trends, the model isolated the true causal impact:
* The campaign generated a statistically significant ($p < 0.05$) increase of ~104,500 BRL per month.
* Over the 8-month post-intervention period, the strategy generated approximately 836,400 BRL in true incremental revenue.

## Context & Data Source
* **Data Source:** The public [Olist Brazilian E-Commerce Dataset via Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
* **Note:** While the underlying financial data, geographic distributions, and time-series trends are authentic, the specific marketing campaign is a hypothetical intervention designed to demonstrate the application of causal inference techniques on observational data.
