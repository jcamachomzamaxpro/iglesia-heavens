-- SQLBook: Code
-- Active: 1684843862427@@127.0.0.1@3306@phpmyadmin
-- SQLBook: Code

DROP DATABASE iglesiaHeavensMysqlDB;
CREATE DATABASE iglesiaHeavensMysqlDB;

USE iglesiaHeavensMysqlDB;

CREATE TABLE departamento(
    idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nombreDepartamento VARCHAR(50)
);

CREATE TABLE municipio(
    idMunicipio INT PRIMARY KEY AUTO_INCREMENT,
    nombreMunicipio VARCHAR(50),
    idDepartamento INT,
    FOREIGN KEY(idDepartamento) REFERENCES departamento(idDepartamento)
);

CREATE TABLE comuna(
    idComuna INT PRIMARY KEY AUTO_INCREMENT,
    nombreComuna VARCHAR(50),
    idMunicipio INT,
    FOREIGN KEY(idMunicipio) REFERENCES municipio(idMunicipio)
);

CREATE TABLE barrio(
    idBarrio INT PRIMARY KEY AUTO_INCREMENT,
    nombreBarrio VARCHAR(50),
    idComuna INT,
    FOREIGN KEY(idComuna) REFERENCES comuna(idComuna)
);


CREATE TABLE creyente(
    idIdentificacion INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(50),
    email VARCHAR(50),
    nroCelular INT,
    direccion VARCHAR(50),
    idBarrio INT,
    FOREIGN KEY(idBarrio) REFERENCES barrio(idBarrio)
);
