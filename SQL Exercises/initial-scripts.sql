Drop Table if EXISTS TRANSACCION;
Drop Table if EXISTS USUARIO;
Drop Table if EXISTS CAMPANYA;
Drop PROCEDURE if EXISTS SP_FilterTransactionStats;

CREATE TABLE USUARIO (
    idUsuario int NOT NULL PRIMARY KEY,
    nombre varchar(255),
    login varchar(255)
);

CREATE TABLE CAMPANYA (
    idCampanya int NOT NULL PRIMARY KEY,
    nombre varchar(255)
);

CREATE TABLE TRANSACCION (
    idTransaccion int NOT NULL PRIMARY KEY,
    idUsuario int NOT NULL FOREIGN KEY REFERENCES USUARIO(idUsuario),
  	idCampanya int NOT NULL FOREIGN KEY REFERENCES CAMPANYA(idCampanya),
  	tInicio DATETIME,
  	tFinal DATETIME,
);


INSERT INTO USUARIO(idUsuario, nombre, login)
VALUES (1, 'Daniel', 'Daniel Logged'),
(2, 'Laura', 'Laura Logged'),
(3, 'Matias', 'Matias Logged'),
(4, 'Juan', 'Juan Logged');

INSERT INTO CAMPANYA(idCampanya, nombre)
VALUES (1, 'Campana 1'),
(2, 'Campana 2'),
(3, 'Campana 3'),
(4, 'Campana 4');


INSERT INTO TRANSACCION(idTransaccion, idUsuario, idCampanya, tInicio, tFinal)
VALUES (100, 1, 1, '2020-01-01 12:00', '2020-01-01 14:00'),
(200, 1, 1,'2020-01-01 11:00', '2020-01-01 19:00'),
(300, 2, 3,'2019-12-31 23:00', '2020-01-01 10:00'),
(400, 2, 4,'2020-01-01 10:00', '2020-01-01 14:00'),
(500, 2, 4,'2020-01-01 12:00', '2020-01-01 13:55'),
(600, 3, 4,'2020-01-01 13:00', '2020-01-01 14:55'),
(700, 4, 2,'2020-01-01 14:00', '2020-01-01 21:00'),
(800, 4, 2,'2020-01-01 12:00', '2020-01-01 16:00');