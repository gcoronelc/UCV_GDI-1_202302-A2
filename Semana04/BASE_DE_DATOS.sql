USE ACADEMICO;
GO

CREATE TABLE CURSO(
CUR_ID INT IDENTITY,
CUR_NOMBRE VARCHAR(100) NOT NULL,
CUR_VACANTES INT NOT NULL,
CUR_MATRICULADOS INT NOT NULL,
CUR_PROFESOR VARCHAR(100) NULL,
CUR_PRECIO MONEY NOT NULL,
CONSTRAINT PK_CURSO PRIMARY KEY( CUR_ID )
);
GO

CREATE TABLE ALUMNO(
ALU_ID INT IDENTITY,
ALU_NOMBRE VARCHAR(100) NOT NULL,
ALU_DIRECCION VARCHAR(100) NOT NULL,
ALU_TELEFONO VARCHAR(20) NULL,
ALU_EMAIL VARCHAR(50) NULL,
CONSTRAINT PK_ALUMNO PRIMARY KEY( ALU_ID )
);
GO


CREATE TABLE MATRICULA(
CUR_ID INT NOT NULL,
ALU_ID INT NOT NULL,
MAT_FECHA DATETIME NOT NULL,
MAT_PRECIO MONEY NOT NULL,
MAT_CUOTAS INT NOT NULL,
MAT_NOTA INT NULL,
CONSTRAINT PK_MATRICULA PRIMARY KEY(CUR_ID,ALU_ID),
CONSTRAINT FK_MATRICULA_CURSO
	FOREIGN KEY(CUR_ID) REFERENCES CURSO,
CONSTRAINT FK_MATRICULA_ALUMNO
	FOREIGN KEY(ALU_ID) REFERENCES ALUMNO
);
GO


CREATE TABLE PAGO(
CUR_ID INT NOT NULL,
ALU_ID INT NOT NULL,
PAG_CUOTA INT NOT NULL,
PAG_FECHA DATETIME NOT NULL,
PAG_IMPORTE MONEY NOT NULL,
CONSTRAINT PK_PAGO PRIMARY KEY(CUR_ID,ALU_ID,PAG_CUOTA),
CONSTRAINT FK_PAGO_MATRICULA
	FOREIGN KEY(CUR_ID,ALU_ID) REFERENCES MATRICULA
);
GO






