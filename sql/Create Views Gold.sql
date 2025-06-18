DROP VIEW IF EXISTS gold.calender;
GO
CREATE VIEW gold.calender AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
) AS Q1;
GO

DROP VIEW IF EXISTS gold.customers;
GO
CREATE VIEW gold.customers AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
) AS Q2;
GO

DROP VIEW IF EXISTS gold.prosubcat;
GO
CREATE VIEW gold.prosubcat AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_ProductSubcategory/',
    FORMAT = 'PARQUET'
) AS Q3;
GO

DROP VIEW IF EXISTS gold.products;
GO
CREATE VIEW gold.products AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
) AS Q3;
GO

DROP VIEW IF EXISTS gold.retur;
GO
CREATE VIEW gold.retur AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) AS Q3;
GO

DROP VIEW IF EXISTS gold.sales;
GO
CREATE VIEW gold.sales AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
) AS Q3;
GO

DROP VIEW IF EXISTS gold.territory;
GO
CREATE VIEW gold.territory AS
SELECT * FROM OPENROWSET(
    BULK 'https://awsstoragedatalakea.blob.core.windows.net/silver/AdventureWorks_Territory/',
    FORMAT = 'PARQUET'
) AS Q3;
GO
