----------------- Creación de las tablas Fact desde los datos de los archivos JSON de Datos Abiertos  ------------------
-- nvarchar: 10, 50, 200

--------- Creación de la tabla fact de Datos1.json en Datamart1.  ------------------------------------------------------
USE [Datamart1]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos1 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos1.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            PersonasAcomp_Code nvarchar(10) '$.dimCodes[0]',
			NUTS1_Code nvarchar(10) '$.dimCodes[1]',
			Periodo_Code nvarchar(10) '$.dimCodes[2]',
			Isla_Code nvarchar(50) '$.dimCodes[3]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos1 
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (PersonasAcomp_Code) REFERENCES DimPersonasAcomp(Codes),
		FOREIGN KEY (NUTS1_Code) REFERENCES DimNUTS1(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes),
		FOREIGN KEY (Isla_Code) REFERENCES DimIslas(Codes);   



--------- Creación de la tabla fact de Datos2.json en Datamart2. ------------------------------------------------------
USE [Datamart2]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos2 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos2.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            NivelIngresos_Code nvarchar(10) '$.dimCodes[0]',
			TipoAlojamiento_Code nvarchar(10) '$.dimCodes[1]',
			Periodo_Code nvarchar(10) '$.dimCodes[2]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos2 
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (NivelIngresos_Code) REFERENCES DimNivelesIngresos(Codes),
		FOREIGN KEY (TipoAlojamiento_Code) REFERENCES DimTiposAlojamiento(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);  



--------- Creación de la tabla fact de Datos3.json en Datamart3. ------------------------------------------------------
USE [Datamart3]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos3 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos3.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            Sexo_Code nvarchar(10) '$.dimCodes[0]',
			Edad_Code nvarchar(10) '$.dimCodes[1]',
			Nacionalidad_Code nvarchar(50) '$.dimCodes[2]',
			Periodo_Code nvarchar(10) '$.dimCodes[3]'
        ) AS [data] 


-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos3 
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,  
		FOREIGN KEY (Sexo_Code) REFERENCES DimSexos(Codes),
		FOREIGN KEY (Edad_Code) REFERENCES DimEdades(Codes),
		FOREIGN KEY (Nacionalidad_Code) REFERENCES DimNacionalidades(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);  


--------- Creación de la tabla fact de Datos4.json en Datamart4.  ------------------------------------------------------
USE [Datamart4]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos4 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos4.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            Sexo_Code nvarchar(10) '$.dimCodes[0]',
			NUTS1_Code nvarchar(10) '$.dimCodes[1]',
			Periodo_Code nvarchar(10) '$.dimCodes[2]',
			Isla_Code nvarchar(50) '$.dimCodes[3]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos4
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (Sexo_Code) REFERENCES DimSexos(Codes),
		FOREIGN KEY (NUTS1_Code) REFERENCES DimNUTS1(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes),
		FOREIGN KEY (Isla_Code) REFERENCES DimIslas(Codes);   



--------- Creación de la tabla fact de Datos5.json en Datamart5.  ------------------------------------------------------
USE [Datamart5]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos5 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos5.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            Sexo_Code nvarchar(10) '$.dimCodes[0]',
			Edad_Code nvarchar(10) '$.dimCodes[1]',
			TipoAlojamiento_Code nvarchar(10) '$.dimCodes[2]',
			Periodo_Code nvarchar(10) '$.dimCodes[3]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos5
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (Sexo_Code) REFERENCES DimSexos(Codes),
		FOREIGN KEY (Edad_Code) REFERENCES DimEdades(Codes),
		FOREIGN KEY (TipoAlojamiento_Code) REFERENCES DimTiposAlojamiento(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);   



--------- Creación de la tabla fact de Datos6.json en Datamart6.  ------------------------------------------------------
USE [Datamart6]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos6 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos6.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            NivelIngresos_Code nvarchar(10) '$.dimCodes[0]',
			TipoAlojamiento_Code nvarchar(10) '$.dimCodes[1]',
			Isla_Code nvarchar(50) '$.dimCodes[2]',
			Periodo_Code nvarchar(10) '$.dimCodes[3]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos6
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (NivelIngresos_Code) REFERENCES DimNivelesIngresos(Codes),
		FOREIGN KEY (TipoAlojamiento_Code) REFERENCES DimTiposAlojamiento(Codes),
		FOREIGN KEY (Isla_Code) REFERENCES DimIslas(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);   



--------- Creación de la tabla fact de Datos7.json en Datamart7.  ------------------------------------------------------
USE [Datamart7]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos7 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos7.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            SituacionLaboral_Code nvarchar(10) '$.dimCodes[0]',
			PaisResidencia_Code nvarchar(50) '$.dimCodes[1]',
			Periodo_Code nvarchar(10) '$.dimCodes[2]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos7
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (SituacionLaboral_Code) REFERENCES DimSituacionesLaborales(Codes),
		FOREIGN KEY (PaisResidencia_Code) REFERENCES DimPaisesResidencia(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);   



--------- Creación de la tabla fact de Datos8.json en Datamart8.  ------------------------------------------------------
USE [Datamart8]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos8 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos8.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            NivelIngresos_Code nvarchar(10) '$.dimCodes[0]',
			PaisResidencia_Code nvarchar(50) '$.dimCodes[1]',
			Isla_Code nvarchar(50) '$.dimCodes[2]',
			Periodo_Code nvarchar(10) '$.dimCodes[3]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos8
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (NivelIngresos_Code) REFERENCES DimNivelesIngresos(Codes),
		FOREIGN KEY (PaisResidencia_Code) REFERENCES DimPaisesResidencia(Codes),
		FOREIGN KEY (Isla_Code) REFERENCES DimIslas(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);   




--------- Creación de la tabla fact de Datos9.json en Datamart9.  ------------------------------------------------------
USE [Datamart9]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos9 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos9.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            Edad_Code nvarchar(10) '$.dimCodes[0]',
			Sexo_Code nvarchar(10) '$.dimCodes[1]',
			Nacionalidad_Code nvarchar(50) '$.dimCodes[2]',
			Isla_Code nvarchar(10) '$.dimCodes[3]',
			Periodo_Code nvarchar(10) '$.dimCodes[4]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos9
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (Edad_Code) REFERENCES DimEdades(Codes),
		FOREIGN KEY (Sexo_Code) REFERENCES DimSexos(Codes),
		FOREIGN KEY (Nacionalidad_Code) REFERENCES DimNacionalidades(Codes),
		FOREIGN KEY (Isla_Code) REFERENCES DimIslas(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);   



--------- Creación de la tabla fact de Datos10.json en Datamart10.  ------------------------------------------------------
USE [Datamart10]

---- Crea la tabla fact con los valores del archivo json, insertados en su columna correspondiente.
SELECT data.* INTO FactDatos10 FROM OPENROWSET (
    BULK  'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JSON_DatosAbiertosCanarias\Datos10.json',
    SINGLE_CLOB) AS [Json]
    CROSS APPLY OPENJSON ( BulkColumn, '$.data' )
    WITH  (
			NTuristas nvarchar(200) '$.Valor',  
            CanalInformacion_Code nvarchar(10) '$.dimCodes[0]',
			PaisResidencia_Code nvarchar(50) '$.dimCodes[1]',
			Municipio_Code nvarchar(50) '$.dimCodes[2]',
			Periodo_Code nvarchar(10) '$.dimCodes[3]'
        ) AS [data] 

-- Se añade la columna con el valor autogenerado IDFact como clave primaria 
-- y se establece el resto de campos como claves ajenas.
ALTER TABLE dbo.FactDatos10
	ADD IDFact INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
		FOREIGN KEY (CanalInformacion_Code) REFERENCES DimCanalesInformacion(Codes),
		FOREIGN KEY (PaisResidencia_Code) REFERENCES DimPaisesResidencia(Codes),
		FOREIGN KEY (Municipio_Code) REFERENCES DimMunicipios(Codes),
		FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes);   
