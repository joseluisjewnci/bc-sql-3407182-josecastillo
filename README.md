# Proyecto Semana 04 — Consultas SELECT

## Descripción
Este proyecto corresponde a la Semana 04 del bootcamp SQL.

El objetivo fue realizar consultas SQL utilizando:

- SELECT
- WHERE
- ORDER BY
- LIMIT
- OFFSET
- Alias descriptivos

El dominio trabajado fue una tienda de bicicletas con información de bicicletas, repuestos, ventas y reparaciones.

---

# Estructura de la base de datos

## Tabla bikes
Almacena información de bicicletas.

Columnas:
- id
- brand
- model
- price
- stock

## Tabla parts
Almacena repuestos de bicicletas.

Columnas:
- id
- name
- price
- stock

## Tabla sales
Registra ventas realizadas.

Columnas:
- id
- bike_id
- quantity
- total
- date

## Tabla repairs
Registra reparaciones de bicicletas.

Columnas:
- id
- bike_id
- description
- cost
- date

---

# Funcionalidades implementadas

## Uso de alias
Se utilizaron alias descriptivos en español para mejorar la legibilidad.

Ejemplo:
- marca
- modelo
- precio
- inventario

## Filtros con WHERE
Se aplicaron filtros simples y combinados usando:
- `>`
- `<`
- `AND`

## Ordenamiento
Se implementaron consultas usando:
- `ORDER BY ASC`
- `ORDER BY DESC`

## Paginación
Se utilizaron:
- `LIMIT`
- `OFFSET`

para mostrar resultados paginados.

---

# Datos utilizados

La base de datos contiene:

- 30 bicicletas
- 10 repuestos
- 10 ventas
- 10 reparaciones

Se utilizaron modelos reales de marcas reconocidas como:
- Specialized
- Trek
- Giant
- Scott
- Cannondale
- Orbea
- Canyon
- Pinarello
- BMC

---

# Ejecución del proyecto

## Crear y ejecutar la base de datos en bash:

sqlite3 mi_dominio.db < proyecto4.sql
sqlite3 mi_dominio.db
---

### Autor

José Luis Castillo