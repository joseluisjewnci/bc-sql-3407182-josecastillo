# Proyecto Semana 05 — Operadores y Filtros

## Descripción
Este proyecto implementa consultas SQL usando operadores de filtrado sobre una base de datos de una tienda de bicicletas.

Se aplicaron filtros con:

- BETWEEN
- IN
- LIKE
- filtros combinados usando AND

El proyecto fue desarrollado en SQLite siguiendo los requisitos de la Semana 05.

---

## Dominio trabajado
Tienda de bicicletas


---

## Estructura de la base de datos

El proyecto contiene las siguientes tablas:

- bikes
- parts
- sales
- repairs

---

## Datos utilizados

Se insertaron:

- 30 registros en bikes
- 10 registros en parts
- 10 registros en sales
- 10 registros en repairs

Con modelos reales de bicicletas de marcas reconocidas como:

- Trek
- Specialized
- Scott
- Giant
- Cannondale
- Orbea
- BMC
- Pinarello

---

## Consultas implementadas

### 1. Filtro con BETWEEN
Consulta de bicicletas dentro de un rango de precios.

### 2. Filtro con IN
Consulta de bicicletas pertenecientes a marcas específicas.

### 3. Filtro con LIKE
Búsqueda de modelos que contienen un patrón de texto.

### 4. Filtro combinado
Consulta utilizando BETWEEN, IN, LIKE y AND.

---

## Ejecución del proyecto

Ejecutar el archivo SQL con bash

sqlite3 tienda_bicicletas.db < proyecto5.sql
sqlite3 tienda_bicicletas.db
.read proyecto5.sql
--- 
### Autor

Jose Luis Castillo Cañas 