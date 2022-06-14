/* Cleaaning Data using SQL Queries */

select *
from ProjectPortfolio.dbo.NashvilleHousing;



-- Standardize Date Format

select SaleDate, CONVERT(Date, SaleDate)
from ProjectPortfolio.dbo.NashvilleHousing;

alter table ProjectPortfolio.dbo.NashvilleHousing
add SaleDateConverted Date;

update ProjectPortfolio.dbo.NashvilleHousing
set SaleDateConverted = CONVERT(Date, SaleDate);

select SaleDateConverted, CONVERT(Date, SaleDate)
from ProjectPortfolio.dbo.NashvilleHousing;



-- Populate Property Address Data

select *
from ProjectPortfolio.dbo.NashvilleHousing
--where PropertyAddress is null
order by ParcelID;

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from ProjectPortfolio.dbo.NashvilleHousing a
join ProjectPortfolio.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null;

update a 
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from ProjectPortfolio.dbo.NashvilleHousing a
join ProjectPortfolio.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null;



-- Breaking out Address into Individual Columns (Address, City, State)

select PropertyAddress
from ProjectPortfolio.dbo.NashvilleHousing

select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as City
from ProjectPortfolio.dbo.NashvilleHousing;

alter table ProjectPortfolio.dbo.NashvilleHousing
add PropertySplitAddress Nvarchar(255);

update ProjectPortfolio.dbo.NashvilleHousing
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 );

alter table ProjectPortfolio.dbo.NashvilleHousing
add PropertySplitCity Nvarchar(255);

update ProjectPortfolio.dbo.NashvilleHousing
set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress));



select * 
from ProjectPortfolio.dbo.NashvilleHousing;





select OwnerAddress 
from ProjectPortfolio.dbo.NashvilleHousing;

select 
PARSENAME(REPLACE(OwnerAddress, ',', '.'),3) as Address
,PARSENAME(REPLACE(OwnerAddress, ',', '.'),2) as City
,PARSENAME(REPLACE(OwnerAddress, ',', '.'),1) as State
from ProjectPortfolio.dbo.NashvilleHousing 
where OwnerAddress is not null
-- 

alter table ProjectPortfolio.dbo.NashvilleHousing
add OwnerSplitAddress Nvarchar(255);

update ProjectPortfolio.dbo.NashvilleHousing
set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'),3);

alter table ProjectPortfolio.dbo.NashvilleHousing
add OwnerSplitCity Nvarchar(255);

update ProjectPortfolio.dbo.NashvilleHousing
set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'),2);

alter table ProjectPortfolio.dbo.NashvilleHousing
add OwnerSplitState Nvarchar(255);

update ProjectPortfolio.dbo.NashvilleHousing
set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'),1);


select * 
from ProjectPortfolio.dbo.NashvilleHousing;



-- Change Y and N to Yes and No in "Sold as Vacant" field

select DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
from ProjectPortfolio.dbo.NashvilleHousing
group by SoldAsVacant
order by 2

select SoldAsVacant
, case when SoldAsVacant = 'Y' then 'Yes'
	   when SoldAsVacant = 'N' then 'No'
	   else soldasvacant 
	   end
from ProjectPortfolio.dbo.NashvilleHousing;

update ProjectPortfolio.dbo.NashvilleHousing
set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	   when SoldAsVacant = 'N' then 'No'
	   else soldasvacant 
	   end;



-- Remove Duplicates 

with RowNumCTE AS(
select *,
	row_number() over (
	partition by ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate, 
				 LegalReference
				 order by 
					uniqueid
					) row_num
from ProjectPortfolio.dbo.NashvilleHousing
)
delete
from RowNumCTE
where row_num > 1



-- Delete Unused Columns

alter table ProjectPortfolio.dbo.NashvilleHousing
drop column OwnerAddress, PropertyAddress, TaxDistrict, SaleDate

select * 
from ProjectPortfolio.dbo.NashvilleHousing;