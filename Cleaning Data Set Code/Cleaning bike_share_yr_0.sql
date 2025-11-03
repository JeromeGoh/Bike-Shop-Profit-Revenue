-- Check how many rows have been dropped
SELECT COUNT(*) AS NullCount
FROM dbo.bike_share_yr_0
WHERE atemp IS NULL;

-- display the exact rows where atemp value was dropped
SELECT *
FROM dbo.bike_share_yr_0
WHERE atemp IS NULL;

-- Remove Rows with NULL in atemp
DELETE FROM dbo.bike_share_yr_0
WHERE atemp IS NULL;

-- Verification of deletion
SELECT COUNT(*) AS NullCount
FROM dbo.bike_share_yr_0
WHERE atemp IS NULL;