-- Showing Table for bike_share_yr_0
SELECT * FROM bike_share_yr_0

-- Showing season column for bike_share_yr_0
SELECT season FROM bike_share_yr_0

-- Showing Table for bike_share_yr_1
SELECT * FROM bike_share_yr_1

-- Showing season column for bike_share_yr_0
SELECT season FROM bike_share_yr_0

-- Combining tables for both bike_share_yr_0 and bike_share_yr_1 (Using union removes duplicated row)
SELECT * from bike_share_yr_0
UNION
SELECT * from bike_share_yr_1

-- Showing table for cost_table
SELECT * FROM cost_table

USE [RoadToDataAnalyst (bike_data)];
GO

;WITH cte AS (
    -- combine both bike_share_yr_0 and bike_share_yr_1 using UNION ALL
    -- (keeps all rows, including duplicates)
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)

-- select columns needed + join cost_table to add price and COGS
SELECT 
    a.dteday,                     -- date of record
    a.season,                     -- season number
    a.yr,                         -- year (join key)
    a.weekday,                    -- weekday number
    a.hr,                         -- hour of day
    a.rider_type,                 -- casual or registered
    a.riders,                     -- number of riders
    b.price,                      -- price from cost_table
    b.COGS,                       -- cost of goods sold from cost_table
    riders*price as revenue,      -- Check revenue earned
    riders*price - COGS*riders as profit -- Check total profit earned after deducting cost of goods

FROM cte a
LEFT JOIN dbo.cost_table b
    ON a.yr = b.yr; -- join by year