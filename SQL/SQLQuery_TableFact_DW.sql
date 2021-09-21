-------------------- Creación de la tabla Fact del turista ------------------

USE [DWTFG2021]

-- CREAR LA TABLA FACT CON FK DE TODAS LAS TABLAS DIM

CREATE TABLE FactTurista (
	IDFactTurista INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Periodo_Code nvarchar(10),
	NTuristas nvarchar(200),
	Isla_Code nvarchar(50),
	Municipio_Code nvarchar(50),
	Nacionalidad_Code nvarchar(50),
	PaisResidencia_Code nvarchar(50),
	NUTS1_Code nvarchar(10),
	Sexo_Code nvarchar(10),
	Edad_Code nvarchar(10),
	NivelIngresos_Code nvarchar(10),
	SituacionLaboral_Code nvarchar(10),
	PersonasAcomp_Code nvarchar(10),
	TipoAlojamiento_Code nvarchar(10),
	CanalInformacion_Code nvarchar(10),

	FOREIGN KEY (Periodo_Code) REFERENCES DimPeriodos(Codes),
	FOREIGN KEY (Isla_Code) REFERENCES DimIslas(Codes),
	FOREIGN KEY (Municipio_Code) REFERENCES DimMunicipios(Codes),
	FOREIGN KEY (Nacionalidad_Code) REFERENCES DimNacionalidades(Codes),
	FOREIGN KEY (PaisResidencia_Code) REFERENCES DimPaisesResidencia(Codes),
	FOREIGN KEY (NUTS1_Code) REFERENCES DimNUTS1(Codes),
	FOREIGN KEY (Sexo_Code) REFERENCES DimSexos(Codes),
	FOREIGN KEY (Edad_Code) REFERENCES DimEdades(Codes),
	FOREIGN KEY (NivelIngresos_Code) REFERENCES DimNivelesIngresos(Codes),
	FOREIGN KEY (SituacionLaboral_Code) REFERENCES DimSituacionesLaborales(Codes),
	FOREIGN KEY (PersonasAcomp_Code) REFERENCES DimPersonasAcomp(Codes),
	FOREIGN KEY (TipoAlojamiento_Code) REFERENCES DimTiposAlojamiento(Codes),
	FOREIGN KEY (CanalInformacion_Code) REFERENCES DimCanalesInformacion(Codes),

);
