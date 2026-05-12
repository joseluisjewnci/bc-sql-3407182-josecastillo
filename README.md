# Proyecto Semana 03 — DML: Manipulación de Datos

## Dominio
Sistema de gestión para una tienda de bicicletas.

## Entidades principales
- bikes: bicicletas disponibles en la tienda
- parts: repuestos de bicicletas
- sales: ventas realizadas
- repairs: reparaciones realizadas

## Descripción
En este proyecto se aplicaron operaciones DML sobre una base de datos relacional en SQLite.

Se realizaron:
- inserciones masivas de datos con INSERT INTO
- actualizaciones de registros con UPDATE
- eliminación segura de registros con DELETE
- consultas de verificación con SELECT

También se mantuvieron las relaciones entre tablas mediante claves foraaneas y constraints definidos en la Semana 02.

## Requisitos implementados
- 15 registros en la tabla bikes
- 15 registros en la tabla parts
- 5 registros en sales
- 5 registros en repairs
- UPDATE seguros usando WHERE
- UPDATE condicional sobre múltiples filas
- DELETE seguro precedido por SELECT de verificación

## Cómo ejecutar en bash


sqlite3 tienda_bicicletas.db < proyecto3.sql
sqlite3 tienda_bicicletas.db