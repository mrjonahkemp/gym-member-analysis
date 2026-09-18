-- ============================================================
-- GYM MEMBER ANALYSIS
-- SQL Analysis
-- Dataset: gym_members
-- Project: Gym Member Analysis
-- ============================================================


-- ============================================================
-- 1. DATA VALIDATION
-- ============================================================

-- Total number of members
SELECT COUNT(*) AS total_members
FROM `gym-member-analysis.gym_dataset.gym_members`;


-- Check for missing values
SELECT
    COUNTIF(gender IS NULL) AS gender_nulls,
    COUNTIF(Near_Location IS NULL) AS near_location_nulls,
    COUNTIF(Partner IS NULL) AS partner_nulls,
    COUNTIF(Promo_friends IS NULL) AS promo_friends_nulls,
    COUNTIF(Phone IS NULL) AS phone_nulls,
    COUNTIF(Contract_period IS NULL) AS contract_period_nulls,
    COUNTIF(Group_visits IS NULL) AS group_visits_nulls,
    COUNTIF(Age IS NULL) AS age_nulls,
    COUNTIF(Avg_additional_charges_total IS NULL) AS spending_nulls,
    COUNTIF(Month_to_end_contract IS NULL) AS months_remaining_nulls
FROM `gym-member-analysis.gym_dataset.gym_members`;


-- ============================================================
-- 2. MEMBER PROFILE
-- ============================================================

SELECT
    COUNT(*) AS total_members,
    ROUND(AVG(Age), 1) AS average_age,
    MIN(Age) AS youngest_member,
    MAX(Age) AS oldest_member,
    ROUND(AVG(Contract_period), 1) AS average_contract_months,
    ROUND(AVG(Avg_additional_charges_total), 2)
        AS average_additional_spending,
    ROUND(AVG(Month_to_end_contract), 1)
        AS average_months_remaining
FROM `gym-member-analysis.gym_dataset.gym_members`;


-- ============================================================
-- 3. CONTRACT DISTRIBUTION
-- ============================================================

SELECT
    Contract_period,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Contract_period
ORDER BY Contract_period;


-- ============================================================
-- 4. CONTRACT LENGTH VS ADDITIONAL SPENDING
-- ============================================================

SELECT
    Contract_period,
    COUNT(*) AS members,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Contract_period
ORDER BY Contract_period;


-- ============================================================
-- 5. CONTRACT LENGTH VS AGE AND SPENDING
-- ============================================================

SELECT
    Contract_period,
    COUNT(*) AS members,
    ROUND(AVG(Age), 1) AS average_age,
    MIN(Age) AS youngest_member,
    MAX(Age) AS oldest_member,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Contract_period
ORDER BY Contract_period;


-- ============================================================
-- 6. GROUP VISITS ANALYSIS
-- ============================================================

SELECT
    Group_visits,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(AVG(Age), 1)
        AS average_age,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Group_visits
ORDER BY Group_visits DESC;


-- ============================================================
-- 7. FRIEND PROMOTION ANALYSIS
-- ============================================================

SELECT
    Promo_friends,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(AVG(Age), 1)
        AS average_age,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Promo_friends
ORDER BY Promo_friends DESC;


-- ============================================================
-- 8. PARTNER MEMBERSHIP ANALYSIS
-- ============================================================

SELECT
    Partner,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(AVG(Age), 1)
        AS average_age,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Partner
ORDER BY Partner DESC;


-- ============================================================
-- 9. LOCATION ANALYSIS
-- ============================================================

SELECT
    Near_Location,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(AVG(Age), 1)
        AS average_age,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY Near_Location
ORDER BY Near_Location DESC;


-- ============================================================
-- 10. CONTRACT TIME REMAINING
-- ============================================================

SELECT
    ROUND(AVG(Month_to_end_contract), 2)
        AS average_months_remaining,
    MIN(Month_to_end_contract)
        AS minimum_months_remaining,
    MAX(Month_to_end_contract)
        AS maximum_months_remaining,
    ROUND(
        APPROX_QUANTILES(
            Month_to_end_contract,
            100
        )[OFFSET(25)],
        2
    ) AS percentile_25,
    ROUND(
        APPROX_QUANTILES(
            Month_to_end_contract,
            100
        )[OFFSET(50)],
        2
    ) AS median_months_remaining,
    ROUND(
        APPROX_QUANTILES(
            Month_to_end_contract,
            100
        )[OFFSET(75)],
        2
    ) AS percentile_75
FROM `gym-member-analysis.gym_dataset.gym_members`;


-- ============================================================
-- 11. CONTRACT TIME REMAINING BANDS
-- ============================================================

SELECT
    CASE
        WHEN Month_to_end_contract <= 1
            THEN '1 month'
        WHEN Month_to_end_contract <= 3
            THEN '2–3 months'
        WHEN Month_to_end_contract <= 6
            THEN '4–6 months'
        ELSE '7–12 months'
    END AS contract_time_remaining,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY contract_time_remaining
ORDER BY MIN(Month_to_end_contract);


-- ============================================================
-- 12. AGE SEGMENTATION
-- ============================================================

SELECT
    CASE
        WHEN Age < 25 THEN '18–24'
        WHEN Age < 30 THEN '25–29'
        WHEN Age < 35 THEN '30–34'
        ELSE '35–41'
    END AS age_group,
    COUNT(*) AS members,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_members,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY age_group
ORDER BY MIN(Age);


-- ============================================================
-- 13. MULTI-VARIABLE ENGAGEMENT ANALYSIS
-- ============================================================

SELECT
    Group_visits,
    Partner,
    Promo_friends,
    COUNT(*) AS members,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(AVG(Age), 1)
        AS average_age,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM `gym-member-analysis.gym_dataset.gym_members`
GROUP BY
    Group_visits,
    Partner,
    Promo_friends
ORDER BY average_additional_spending DESC;


-- ============================================================
-- 14. CORRELATION ANALYSIS
-- ============================================================

SELECT
    ROUND(
        CORR(
            Age,
            Avg_additional_charges_total
        ),
        3
    ) AS age_spending_correlation,

    ROUND(
        CORR(
            Contract_period,
            Avg_additional_charges_total
        ),
        3
    ) AS contract_spending_correlation,

    ROUND(
        CORR(
            Month_to_end_contract,
            Avg_additional_charges_total
        ),
        3
    ) AS remaining_time_spending_correlation

FROM `gym-member-analysis.gym_dataset.gym_members`;


-- ============================================================
-- 15. SPENDING QUARTILES
-- ============================================================

WITH spending_groups AS (
    SELECT
        *,
        NTILE(4) OVER (
            ORDER BY Avg_additional_charges_total
        ) AS spending_quartile
    FROM `gym-member-analysis.gym_dataset.gym_members`
)

SELECT
    spending_quartile,
    COUNT(*) AS members,
    ROUND(AVG(Age), 1)
        AS average_age,
    ROUND(AVG(Contract_period), 2)
        AS average_contract_months,
    ROUND(
        AVG(Month_to_end_contract),
        2
    ) AS average_months_remaining,
    ROUND(AVG(Group_visits), 3)
        AS group_visit_rate,
    ROUND(AVG(Partner), 3)
        AS partner_rate,
    ROUND(AVG(Promo_friends), 3)
        AS promo_friends_rate,
    ROUND(AVG(Near_Location), 3)
        AS near_location_rate,
    ROUND(
        AVG(Avg_additional_charges_total),
        2
    ) AS average_additional_spending
FROM spending_groups
GROUP BY spending_quartile
ORDER BY spending_quartile;


-- ============================================================
-- 16. FINAL ANALYTICAL DATASET
-- ============================================================

SELECT
    gender,
    Near_Location,
    Partner,
    Promo_friends,
    Phone,
    Contract_period,
    Group_visits,
    Age,
    Avg_additional_charges_total,
    Month_to_end_contract,

    CASE
        WHEN Age < 25 THEN '18–24'
        WHEN Age < 30 THEN '25–29'
        WHEN Age < 35 THEN '30–34'
        ELSE '35–41'
    END AS age_group,

    CASE
        WHEN Contract_period = 1
            THEN '1 month'
        WHEN Contract_period = 6
            THEN '6 months'
        WHEN Contract_period = 12
            THEN '12 months'
        ELSE 'Other'
    END AS contract_group,

    CASE
        WHEN Month_to_end_contract <= 1
            THEN '1 month'
        WHEN Month_to_end_contract <= 3
            THEN '2–3 months'
        WHEN Month_to_end_contract <= 6
            THEN '4–6 months'
        ELSE '7–12 months'
    END AS contract_time_remaining

FROM `gym-member-analysis.gym_dataset.gym_members`;


-- ============================================================
-- 17. CREATE FINAL ANALYSIS TABLE
-- ============================================================

CREATE OR REPLACE TABLE
`gym-member-analysis.gym_dataset.gym_members_analysis` AS

SELECT
    gender,
    Near_Location,
    Partner,
    Promo_friends,
    Phone,
    Contract_period,
    Group_visits,
    Age,
    Avg_additional_charges_total,
    Month_to_end_contract,

    CASE
        WHEN Age < 25 THEN '18–24'
        WHEN Age < 30 THEN '25–29'
        WHEN Age < 35 THEN '30–34'
        ELSE '35–41'
    END AS age_group,

    CASE
        WHEN Contract_period = 1
            THEN '1 month'
        WHEN Contract_period = 6
            THEN '6 months'
        WHEN Contract_period = 12
            THEN '12 months'
        ELSE 'Other'
    END AS contract_group,

    CASE
        WHEN Month_to_end_contract <= 1
            THEN '1 month'
        WHEN Month_to_end_contract <= 3
            THEN '2–3 months'
        WHEN Month_to_end_contract <= 6
            THEN '4–6 months'
        ELSE '7–12 months'
    END AS contract_time_remaining

FROM `gym-member-analysis.gym_dataset.gym_members`;
