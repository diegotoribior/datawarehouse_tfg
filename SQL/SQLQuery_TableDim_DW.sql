
-------------------- Creación de cada una de las tablas Dim ----------------------------

----------------------- Tabla DimIslas -------------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimIslas] FROM [Datamart1].[dbo].[DimIslas];
ALTER TABLE [DWTFG2021].[dbo].[DimIslas]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla DimNUTS1 ------------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimNUTS1] FROM [Datamart1].[dbo].[DimNUTS1];
ALTER TABLE [DWTFG2021].[dbo].[DimNUTS1]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Periodos ---------------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimPeriodos] FROM [Datamart2].[dbo].[DimPeriodos];
ALTER TABLE [DWTFG2021].[dbo].[DimPeriodos]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Tipos de Alojamiento ---------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimTiposAlojamiento] FROM [Datamart2].[dbo].[DimTiposAlojamiento];
ALTER TABLE [DWTFG2021].[dbo].[DimTiposAlojamiento]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Niveles Ingresos --------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimNivelesIngresos] FROM [Datamart2].[dbo].[DimNivelesIngresos];
ALTER TABLE [DWTFG2021].[dbo].[DimNivelesIngresos]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Personas Acompañantes ---------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimPersonasAcomp] FROM [Datamart1].[dbo].[DimPersonasAcomp];
ALTER TABLE [DWTFG2021].[dbo].[DimPersonasAcomp]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Edades -----------------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimEdades] FROM [Datamart3].[dbo].[DimEdades];
ALTER TABLE [DWTFG2021].[dbo].[DimEdades]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Nacionalidades ---------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimNacionalidades] FROM [Datamart3].[dbo].[DimNacionalidades];
ALTER TABLE [DWTFG2021].[dbo].[DimNacionalidades]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Sexos ------------------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimSexos] FROM [Datamart3].[dbo].[DimSexos];
ALTER TABLE [DWTFG2021].[dbo].[DimSexos]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Países de residencia ---------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimPaisesResidencia] FROM [Datamart7].[dbo].[DimPaisesResidencia];
ALTER TABLE [DWTFG2021].[dbo].[DimPaisesResidencia]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Situaciones laborales ---------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimSituacionesLaborales] FROM [Datamart7].[dbo].[DimSituacionesLaborales];
ALTER TABLE [DWTFG2021].[dbo].[DimSituacionesLaborales]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Canales de Información ---------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimCanalesInformacion] FROM [Datamart10].[dbo].[DimCanalesInformacion];
ALTER TABLE [DWTFG2021].[dbo].[DimCanalesInformacion]
	ADD PRIMARY KEY (Codes);

----------------------- Tabla Municipios --------------------------------------------------
SELECT * INTO [DWTFG2021].[dbo].[DimMunicipios] FROM [Datamart10].[dbo].[DimMunicipios];
ALTER TABLE [DWTFG2021].[dbo].[DimMunicipios]
	ADD PRIMARY KEY (Codes);
