CREATE DATABASE IGLESIA;
USE IGLESIA;

CREATE TABLE CIUDAD(
ID_CIUDAD INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE_CIUDAD VARCHAR(20) NOT NULL
);

CREATE TABLE ESTADO(
ID_ESTADO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE_ESTADO VARCHAR(20) NOT NULL
);

CREATE TABLE ESTADO_EDAD(
ID_ESTADO_EDAD INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ESTADO_EDAD VARCHAR(8)
);

CREATE TABLE ESTADO_CIVIL(
ID_ESTADO_CIVIL INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ESTADO_CIVIL VARCHAR(12)
);

CREATE TABLE IGLESIA(
ID_IGLESIA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE_IGLESIA VARCHAR(15),
TELEFONO NUMERIC(10)
);

CREATE TABLE MIEMBRO(
ID_MIEMBRO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
AP_PATERNO VARCHAR(12),
AP_MATERNO VARCHAR(12),
NOMBRE     VARCHAR(20),
FECHA_NACIMIENTO DATETIME,
TEL_CASA NUMERIC(10),
TEL_TRABAJO NUMERIC(10),
FIRMA VARCHAR(10),
ID_ESTADO_CIVIL INT NOT NULL,
ID_ESTADO_EDAD INT NOT NULL,
FOREIGN KEY (ID_ESTADO_CIVIL) REFERENCES ESTADO_CIVIL(ID_ESTADO_CIVIL),
FOREIGN KEY (ID_ESTADO_EDAD) REFERENCES ESTADO_EDAD(ID_ESTADO_EDAD)
);

CREATE TABLE HIJO(
ID_HIJO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
AP_PATERNO VARCHAR(12),
AP_MATERNO VARCHAR(12),
NOMBRE     VARCHAR(20),
FECHA_NACIMIENTO DATETIME,
EDAD NUMERIC(2)
);

CREATE TABLE PASTOR(
ID_PASTOR INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
AP_PATERNO VARCHAR(12),
AP_MATERNO VARCHAR(12),
NOMBRE     VARCHAR(20),
FIRMA 	   VARCHAR(10),
ID_IGLESIA INT NOT NULL,
FOREIGN KEY (ID_IGLESIA) REFERENCES IGLESIA(ID_IGLESIA)
);

CREATE TABLE DIRECCION_IGLESIA(
ID_IGLESIA INT NOT NULL,
ID_CIUDAD INT NOT NULL, 
ID_ESTADO INT NOT NULL,
CODIGO_POSTAL INT NOT NULL,
FOREIGN KEY (ID_IGLESIA) REFERENCES IGLESIA(ID_IGLESIA),
FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD),
FOREIGN KEY (ID_ESTADO) REFERENCES ESTADO(ID_ESTADO)
);

CREATE TABLE BAUTIZO(
ID_BAUTIZO VARCHAR(10) PRIMARY KEY,
FECHA DATETIME,
ID_MIEMBRO INT NOT NULL,
ID_IGLESIA INT NOT NULL,
FOREIGN KEY(ID_MIEMBRO) REFERENCES MIEMBRO(ID_MIEMBRO),
FOREIGN KEY (ID_IGLESIA) REFERENCES IGLESIA(ID_IGLESIA)
);

CREATE TABLE ASISTENCIA_ANTERIOR(
ID_MIEMBRO INT NOT NULL,
ID_IGLESIA INT NOT NULL,
FECHA_INICIO DATETIME,
FECHA_FIN DATETIME,
FOREIGN KEY(ID_MIEMBRO) REFERENCES MIEMBRO(ID_MIEMBRO),
FOREIGN KEY (ID_IGLESIA) REFERENCES IGLESIA(ID_IGLESIA)
);

CREATE TABLE DIRECCION_MIEMBRO(
ID_MIEMBRO INT NOT NULL,
ID_CIUDAD INT NOT NULL, 
ID_ESTADO INT NOT NULL,
CODIGO_POSTAL INT NOT NULL,
FOREIGN KEY (ID_MIEMBRO) REFERENCES MIEMBRO(ID_MIEMBRO),
FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD),
FOREIGN KEY (ID_ESTADO) REFERENCES ESTADO(ID_ESTADO)
);

CREATE TABLE MIEMBRO_HIJO(
ID_MIEMBRO INT NOT NULL,
ID_HIJO INT NOT NULL,
FOREIGN KEY (ID_MIEMBRO) REFERENCES MIEMBRO(ID_MIEMBRO),
FOREIGN KEY (ID_HIJO) REFERENCES HIJO(ID_HIJO)
);

CREATE TABLE PREGUNTA_CERRADA(
ID_PREGUNTA_CERRADA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PREGUNTA VARCHAR(50)
);

CREATE TABLE PREGUNTA_ABIERTA(
ID_PREGUNTA_ABIERTA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PREGUNTA VARCHAR(50)
);

CREATE TABLE RESPUESTA(
ID_RESPUESTA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
RESPUESTA VARCHAR (10)
);

CREATE TABLE CUESTIONARIO_ABIERTO(
ID_MIEMBRO INT NOT NULL,
ID_PASTOR INT NOT NULL,
ID_PREGUNTA_ABIERTA INT NOT NULL,
RESPUESTA VARCHAR(100),
FOREIGN KEY (ID_MIEMBRO) REFERENCES MIEMBRO(ID_MIEMBRO),
FOREIGN KEY (ID_PASTOR) REFERENCES PASTOR(ID_PASTOR),
FOREIGN KEY (ID_PREGUNTA_ABIERTA) REFERENCES PREGUNTA_ABIERTA(ID_PREGUNTA_ABIERTA)
);

CREATE TABLE CUESTIONARIO_CERRADO(
ID_MIEMBRO INT NOT NULL,
ID_PASTOR INT NOT NULL,
ID_PREGUNTA_CERRADA INT NOT NULL,
ID_RESPUESTA INT NOT NULL,
FOREIGN KEY (ID_MIEMBRO) REFERENCES MIEMBRO(ID_MIEMBRO),
FOREIGN KEY (ID_PASTOR) REFERENCES PASTOR(ID_PASTOR),
FOREIGN KEY (ID_PREGUNTA_CERRADA) REFERENCES PREGUNTA_CERRADA(ID_PREGUNTA_CERRADA),
FOREIGN KEY (ID_RESPUESTA) REFERENCES RESPUESTA(ID_RESPUESTA)
);