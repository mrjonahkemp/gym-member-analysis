# Gym Member Analysis

## Overview

An end-to-end data analytics project analysing 4,000 gym members to identify patterns in member demographics, contract characteristics, engagement and additional spending.

The project demonstrates a complete analytics workflow from data preparation and exploration through SQL analysis, Power BI visualisation and business-focused findings.

## Business Objective

The objective of this analysis is to understand the characteristics of the gym's member base and identify relationships between:

- Member demographics
- Contract length
- Contract time remaining
- Group visit participation
- Partner membership
- Friend promotions
- Additional spending

The analysis is designed to demonstrate how data can be used to identify patterns that may support membership, engagement and commercial decision-making.

## Dataset

The dataset contains 4,000 gym member records and includes:

- Gender
- Age
- Location proximity
- Partner membership
- Friend promotion
- Phone availability
- Contract period
- Group visit participation
- Average additional spending
- Months remaining on contract

The dataset does not contain a churn, cancellation or retention outcome. Therefore, this project does not calculate churn rates, predict churn probability or directly measure retention.

## Tools & Technologies

- **Google Sheets** — Data exploration and preparation
- **Google BigQuery** — Data storage and SQL analysis
- **SQL** — Data validation, aggregation and analysis
- **Power BI** — Data visualisation and dashboard development
- **GitHub** — Version control and portfolio documentation

## Project Workflow

```text
Raw Dataset
     ↓
Google Sheets
     ↓
Data Cleaning & Exploration
     ↓
BigQuery
     ↓
SQL Analysis
     ↓
Power BI
     ↓
Dashboard & Findings
     ↓
GitHub Portfolio
```

## Analysis

The analysis examined:

- Overall member demographics
- Contract length distribution
- Contract length and additional spending
- Group visit participation
- Partner membership
- Friend promotions
- Contract time remaining
- Age segmentation
- Relationships between multiple engagement factors
- Correlations between age, contract characteristics and spending

## Key Findings

### 1. Short-term contracts dominate the member base

2,207 of 4,000 members (55.17%) are on 1-month contracts.

By comparison:

- 960 members (24.00%) are on 12-month contracts
- 833 members (20.82%) are on 6-month contracts

The member base is therefore concentrated in short-term contracts.

### 2. Longer contracts are associated with higher additional spending

Average additional spending increases across contract groups:

| Contract | Members | Average Additional Spending |
|---|---:|---:|
| 1 month | 2,207 | 137.93 |
| 6 months | 833 | 151.65 |
| 12 months | 960 | 163.59 |

Members on 12-month contracts have the highest average additional spending.

This demonstrates an association between longer contract length and higher average additional spending. The analysis does not establish that contract length causes higher spending.

### 3. Group-visit members have longer average contracts

Members participating in group visits have an average contract length of **5.60 months**, compared with **4.03 months** for members who do not participate.

Average additional spending is also slightly higher:

- Group visits: **150.63**
- No group visits: **144.36**

These results indicate an association between group participation, contract length and additional spending.

### 4. The member base is concentrated among ages 25–34

Members aged 25–29 account for **45.60%** of the dataset, while members aged 30–34 account for **42.05%**.

Combined, these groups represent **87.65% of all members**.

The 18–24 and 35–41 age groups are comparatively small.

### 5. Multiple engagement factors are associated with stronger contract commitment

Members with group visits, partner membership and friend promotions all enabled have an average contract length of **7.59 months**.

Members with none of these three factors have an average contract length of **2.77 months**.

The same group also has the highest average additional spending at **157.48**.

These results indicate an association between multiple engagement/referral factors, longer contracts and higher additional spending. They should not be interpreted as causal effects.

### 6. Contract time remaining is concentrated around one month

2,207 members, or **55.17%**, have approximately one month remaining on their contract.

The remaining membership is distributed across longer contract-time categories, with only 37 members in the 2–3 month category.

## Power BI Dashboard

The Power BI dashboard presents the analysis through:

- Total members
- Average age
- Average additional spending
- Members by contract length
- Average contract length by group visits
- Members by age group
- Members by contract time remaining
- Additional spending by contract group

A dashboard screenshot is available in:

`powerbi/dashboard.png`

## SQL Analysis

The SQL analysis includes queries for:

- Data validation
- Null checks
- Member profiling
- Contract analysis
- Age segmentation
- Engagement analysis
- Spending analysis
- Multi-variable analysis
- Correlation analysis

The SQL scripts are available in:

`sql/gym_member_analysis.sql`

## Key Limitations

The dataset contains 4,000 member records but does not include a churn, cancellation or retention outcome.

Therefore, this analysis cannot:

- Determine which members churned
- Calculate a churn rate
- Predict churn probability
- Measure retention directly

The findings describe observed patterns and associations within the available data and should not be interpreted as causal relationships.

Some segments are relatively small, particularly the 2–3 month contract-time-remaining group and the 35–41 age group. Results for these groups should therefore be interpreted with appropriate caution.

## Repository Structure

```text
gym-member-analysis/
│
├── data/
│   └── gym_members.csv
│
├── findings/
│   └── key_findings.png
│
├── powerbi/
│   └── dashboard.png
│
├── sql/
│   └── gym_member_analysis.sql
│
└── README.md
```

## Conclusion

This project demonstrates an end-to-end analytics workflow using spreadsheet analysis, SQL, BigQuery, Power BI and GitHub.

The analysis identifies patterns in contract structure, member demographics, engagement factors and additional spending while maintaining appropriate limitations around causality and the absence of a churn outcome.
