--DATA CLEANING AND EXPLORATION  

SELECT TOP 20 *
FROM dbo.Housing;

--begin tran 
--commit 
--select @@trancount 
--rollback 




--DATA TYPE CHANGE FOR SALESDATE FROM DATETIME TO TIME FORMAT 

ALTER TABLE	dbo.Housing	
ADD SalesDateConverted DATE; 

-- CONVERT SET THE VALUES IN THE SALESDATE COLUMN TO THE NEW COLUMN AND USE ITS DEFAULT DATATYPE 
UPDATE dbo.Housing
SET  SalesDateConverted = CONVERT(Date, SaleDate); 

ALTER TABLE dbo.Housing
DROP COLUMN SaleDate;

--RENAMING SalesDateConverted

EXEC sp_rename 'dbo.Housing.SalesDateConverted', 'SalesDate', 'COLUMN';


--HANDLING INCONSISTENT ENTRIES 

UPDATE dbo.Housing
SET SoldAsVacant =
    CASE
        WHEN SoldAsVacant = 'Y' THEN 'Yes'
        WHEN SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
    END
FROM covid..Housing; 


-- SUSBTRINGS 

SELECT SUBSTRING(propertyAddress, 1, CHARINDEX(',', propertyAddress) - 1) as address 
FROM dbo.Housing;

SELECT SUBSTRING(propertyAddress, CHARINDEX(',', propertyAddress)+ 1, LEN(propertyAddress))  as address 
FROM dbo.Housing;


-- REMOVING ISNULL 

SELECT a.PropertyAddress, b.PropertyAddress, a.ParcelID, b.ParcelID, ISNULL(a.ParcelID, b.ParcelID)
FROM covid..Housing a 
JOIN covid..Housing b 
     ON a.ParcelID = b.ParcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.ParcelID is null; 

UPDATE a 
SET a.PropertyAddress = ISNULL(a.ParcelID, b.ParcelID)
FROM covid..Housing a 
JOIN covid..Housing b 
     ON a.ParcelID = b.ParcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.ParcelID is null; 




-- HANDLING DUPLICATE USING ROW_NUMBER()

WITH ROWNUMCTE AS (
    SELECT *,
           ROW_NUMBER() OVER (
		   PARTITION BY ParcelID, 
		                PropertyAddress, 
						SalePrice,  
						LegalReference
                        ORDER BY UniqueID) row_num
    FROM covid..Housing )
SELECT * 
FROM ROWNUMCTE
WHERE row_num > 1 








