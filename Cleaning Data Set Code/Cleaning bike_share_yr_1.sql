-- Count how many rows have NULL humidity values
SELECT COUNT(*) AS NullCount
FROM dbo.bike_share_yr_1
WHERE hum IS NULL;

-- See the actual rows that were not imported properly
SELECT *
FROM dbo.bike_share_yr_1
WHERE hum IS NULL;

-- Remove all rows where humidity (hum) was not imported
DELETE FROM dbo.bike_share_yr_1
WHERE hum IS NULL;

-- Confirm that there are no more NULL humidity values
SELECT COUNT(*) AS NullCount
FROM dbo.bike_share_yr_1
WHERE hum IS NULL;

-- Double-check by displaying results (should return 0 rows)
SELECT *
FROM dbo.bike_share_yr_1
WHERE hum IS NULL;