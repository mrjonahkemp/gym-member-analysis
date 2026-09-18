# Gym Member Analysis

## Overview

An end-to-end data analytics project analysing 4,000 gym members to identify patterns in member demographics, contract length, engagement and additional spending.

The project demonstrates a complete analytics workflow from raw data preparation through SQL analysis and interactive Power BI reporting.

## Business Objective

The objective of this analysis is to understand the characteristics of the gym's member base and identify relationships between:

- Member demographics
- Contract length
- Contract time remaining
- Group visit participation
- Partner membership
- Friend promotions
- Additional spending

These findings can help inform membership, engagement and commercial decisions.

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

The dataset does not contain a churn outcome, so churn or retention rates are not calculated in this project.

## Tools Used

- Google Sheets — Data exploration and preparation
- Google BigQuery — SQL analysis
- SQL — Data validation, aggregation and analysis
- Power BI — Data visualisation and dashboard development
- GitHub — Project documentation and portfolio presentation

## Key Findings

### Member Profile

- Total members: 4,000
- Average age: 29.18 years
- Average additional spending: 146.94
- The largest age groups are 25–29 and 30–34.

### Contract Length

1-month contracts account for 55.17% of all members.

Average additional spending increases across contract groups:

| Contract | Average Additional Spending |
|---|---:|
| 1 month | 137.93 |
| 6 months | 151.65 |
| 12 months | 163.59 |

This indicates an association between longer contracts and higher average additional spending. The analysis does not establish causation.

### Group Visits

Members participating in group visits have an average contract length of 5.60 months compared with 4.03 months for members who do not participate.

They also have slightly higher average additional spending:

- Group visits: 150.63
- No group visits: 144.36

### Contract Time Remaining

55.17% of members have approximately 1 month remaining on their contract.

The distribution is heavily concentrated around the 1-month category.

### Age Distribution

Members aged 25–34 represent the largest proportion of the dataset, accounting for approximately 87.65% of all members.

## Dashboard

The Power BI dashboard provides an interactive overview of:

- Total members
- Average age
- Average additional spending
- Members by contract length
- Average contract length by group visits
- Members by age group
- Members by contract time remaining

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
