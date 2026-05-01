# Proyecto Semana 02 — DDL: Tienda de bicicletas

## Dominio
Sistema de gestión para una tienda de bicicletas.

## Objetivo
Diseñar el esquema de base de datos utilizando DDL en SQLite, aplicando tipos de datos adecuados, constraints (NOT NULL, DEFAULT, UNIQUE, CHECK), relaciones entree tablas y un script idempotente que pueda ejecutarse varias veces sin errores.

## Entidades principales
- bikes: bicicletas disponibles en la tienda
- parts: repuestos de bicicletas
- sales: ventas realizadas
- repairs: reparaciones realizadas

## Descripción del diseño
Se crearon cuatro tablas principales:

Tabla bikes:
Contiene la información de las bicicletas. Las columnas brand y model son obligatorias (NOT NULL), el price tiene validación (CHECK > 0), el stock tiene valor por defecto (DEFAULT 0) y la combinación de brand y model es única (UNIQUE).

Tabla parts:
Contiene los repuestos. El nombre es único (UNIQUE), el precio tiene validación (CHECK > 0) y el stock tiene valor por defecto (DEFAULT 0).

Tabla sales:
Registra las ventas. Tiene relación con bikes mediante FOREIGN KEY, la cantidad y el total tienen validaciones (CHECK > 0) y la fecha es obligatoria.

Tabla repairs:
Registra las reparaciones realizadas a las bicicletas. Tiene relación con bikes mediante FOREIGN KEY, la descripción y la fecha son obligatorias, y el costo tiene validación (CHECK > 0).

## Cómo ejecutar

1. Crear la base de datos y ejecutar el script:
    sqlite3 mi_dominio.db < proyecto2.sql

2. Abrir la base de datos:
    sqlite3 mi_dominio.db

3. Ver las tablas:
.tables

4. Ver la estructura de una tabla:
PRAGMA table_info(bikes);

## Notas
El script utiliza DROP TABLE IF EXISTS para evitar errores al ejecutarlo varias veces y CREATE TABLE IF NOT EXISTS para hacerlo seguro e idempotente. También se incluyen datos de prueba para validar el funcionamiento.