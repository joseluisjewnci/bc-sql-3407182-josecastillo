# Semana 09 - INNER JOIN y LEFT JOIN

## Descripción

Este proyecto corresponde a la semana 9 del curso de SQL. El ejercicio modela una tienda de bicicletas y demuestra el uso de `INNER JOIN`, `LEFT JOIN` y consultas con múltiples tablas.

## Estructura del modelo

Se crean tres tablas principales:

- `categories`: categorías de bicicletas (Montaña, Ruta, Urbana).
- `bikes`: información de las bicicletas, incluyendo marca, modelo, precio, stock y categoría.
- `sales`: registro de ventas por bicicleta.

## Relación entre tablas

- `bikes.category_id` referencia a `categories.id`.
- `sales.bike_id` referencia a `bikes.id`.

## Contenido del script `proyecto9.sql`

1. Limpieza de tablas existentes.
2. Creación de las tablas `categories`, `bikes` y `sales`.
3. Inserción de datos de ejemplo para categorías, bicicletas y ventas.
4. Cinco consultas que ilustran el uso de joins:
   - Consulta 1: `INNER JOIN` entre `bikes` y `sales` para listar bicicletas con ventas.
   - Consulta 2: `INNER JOIN` entre `bikes`, `categories` y `sales` para mostrar categoría y venta.
   - Consulta 3: `LEFT JOIN` para listar todas las bicicletas, con o sin ventas.
   - Consulta 4: bicicleta sin ventas usando `LEFT JOIN` con filtro `WHERE s.id IS NULL`.
   - Consulta 5: reporte agregado de ventas por bicicleta usando `GROUP BY`.

## Cómo ejecutar

Con SQLite instalado, puede ejecutar el script desde la terminal:

```bash
sqlite3 proyecto9.db < proyecto9.sql
```

O bien, abrir `proyecto9.sql` en un cliente SQLite y ejecutar todo el script.

## Notas

- La base de datos se basa en el dominio de una tienda de bicicletas.
- El script activa `PRAGMA foreign_keys = ON` para asegurar la integridad referencial.
- Los valores de precio y cantidad tienen restricciones para validar datos correctos.

---

Archivo clave:

- `proyecto9.sql` - definición de tablas, inserción de datos y consultas de la semana 9.