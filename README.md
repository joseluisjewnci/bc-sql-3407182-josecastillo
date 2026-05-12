# Proyecto Semana 01 — Tienda de bicicletas

## Dominio
Sistema de gestión para una tienda de bicicletas.

## Entidades principales
- **bikes**: bicicletas disponibles en la tienda
- **parts**: repuestos de bicicletas
- **sales**: ventas realizadas
- **repairs**: reparaciones realizadas

## Descripción
Se creó una base de datos relacional utilizando SQLite con las entidades principales del dominio.  
Se insertaron datos de prueba y se realizaron consultas SELECT básicas para visualizar la información.

## Cómo ejecutar

### en bash
sqlite3 tienda_bicicletas.db < proyecto1.sql
sqlite3 tienda_bicicletas.db