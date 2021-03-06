-- Our location asset contains a field for the support person for that building
-- This report shows computers and includes the location and the liaison
SELECT MACHINE.NAME,
LOCATION.NAME as "Building",
LIAISON.FULL_NAME as "Liaison",
LIAISON.EMAIL as "Liaison Email"
FROM MACHINE
JOIN ASSET on ASSET.MAPPED_ID = MACHINE.ID and ASSET.ASSET_TYPE_ID = 5
JOIN ASSET_DATA_5 ASSET_DATA on ASSET_DATA.ID = ASSET.ASSET_DATA_ID
JOIN ASSET LOCATION on LOCATION.ID = ASSET.LOCATION_ID and LOCATION.ASSET_TYPE_ID = 1
JOIN ASSET_DATA_1 LOCATION_DATA on LOCATION_DATA.ID = LOCATION.ASSET_DATA_ID
JOIN USER LIAISON on LIAISON.ID = LOCATION_DATA.FIELD_10021
