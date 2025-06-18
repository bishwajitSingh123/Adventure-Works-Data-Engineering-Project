CREATE DATABASE SCOPED CREDENTIAL cred_shahil
WITH
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awsstoragedatalakea.blob.core.windows.net/silver',
    CREDENTIAL = cred_shahil
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awsstoragedatalakea.blob.core.windows.net/gold',
    CREDENTIAL = cred_shahil
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL TABLE gold.extsales_v2
WITH (
    LOCATION = 'extsales_v2/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales;

CREATE EXTERNAL TABLE gold.extcalendertest
WITH (
    LOCATION = 'extcalendertest/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calender;

CREATE EXTERNAL TABLE gold.extcustomerstest
WITH (
    LOCATION = 'extcustomerstest/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers;

CREATE EXTERNAL TABLE gold.extproductstest
WITH (
    LOCATION = 'extproductstest/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products;


CREATE EXTERNAL TABLE gold.extprosubcat
WITH (
    LOCATION = 'extprosubcat/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.prosubcat;

CREATE EXTERNAL TABLE gold.extretur
WITH (
    LOCATION = 'extretur/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.retur;

CREATE EXTERNAL TABLE gold.extteritory
WITH (
    LOCATION = 'extteritory/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.territory;

SELECT *
FROM OPENROWSET(
    BULK 'extcustomers/',
    DATA_SOURCE = 'source_gold',
    FORMAT = 'PARQUET'
) AS rows;
