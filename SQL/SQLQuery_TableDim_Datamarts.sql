
----------------- Creación de las tablas Dim desde los datos de los archivos JSON de Datos Abiertos  --------------------

USE [Datamart10]

-- Se almacena los datos del archivo json en la variable @json.
DECLARE @json nvarchar(max);
SELECT @json = BulkColumn FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos10.json',
	SINGLE_CLOB) AS [Json];

--  Comprueba si el archivo json está bien formateado.
IF ISJSON(@json) = 1

BEGIN

	-- Crea la tabla provisional ProvDim1.
	CREATE TABLE ProvDim1 (
		ID INT IDENTITY(1,1),
		Codes nvarchar(10) NOT NULL PRIMARY KEY)  -- nvarchar: 10, 50, 200

	-- Inserta los valores Codes del json en la tabla ProvDim1.
	INSERT INTO ProvDim1(Codes)
	SELECT [value] 
	FROM OPENJSON(@json, '$.categories[3].codes')	-- El índice [n] nos permite elegir los datos de la tabla 
													-- dimensión en el array "categories" del json.

	-- Crea la tabla provisional ProvDim2.
	CREATE TABLE ProvDim2 (
		ID INT IDENTITY(1,1),
		Labels nvarchar(200))

	-- Inserta los valores Codes del json en la tabla ProvDim2.
	INSERT INTO ProvDim2(Labels)
	SELECT [value]
	FROM OPENJSON(@json, '$.categories[3].labels')  -- El índice [n] nos permite elegir los datos de la tabla 
													-- dimensión en el array "categories" del json.

	--  Combina las tablas provisionales y crea la tabla dimensión correspondiente.
	SELECT ProvDim1.Codes, ProvDim2.Labels INTO DimPeriodos  -- Nombre de la tabla Dim a crear: Dim_______
	FROM ProvDim1
	INNER JOIN ProvDim2
	ON ProvDim1.ID = ProvDim2.ID;

	-- Establece los valores de la columna Codes como primary keys.
	ALTER TABLE DimPeriodos  -- Nombre de la tabla Dim a crear: Dim_______
	ADD PRIMARY KEY (Codes);
	
	-- Borrar las tablas provisionales.
	DROP TABLE ProvDim1, ProvDim2;

END



