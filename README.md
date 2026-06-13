# Proyecto Semana 07 — NULL y Constraints

## 📌 Descripción

Este proyecto corresponde a la Semana 07 del bootcamp de SQL.

El objetivo es aplicar restricciones de integridad y manejo de valores NULL en SQLite mediante el uso de:

- NOT NULL
- UNIQUE
- CHECK
- DEFAULT
- FOREIGN KEY
- IS NULL
- COALESCE

---

# 🗂️ Estructura del proyecto

El proyecto contiene las siguientes tablas:

- categories
- bikes

---

# 🚴 Dominio

Sistema de gestión para una tienda de bicicletas.

El sistema permite almacenar:

- categorías de bicicletas
- bicicletas
- precios
- inventario
- colores opcionales

---

# ⚙️ Tecnologías utilizadas

- SQLite3

---

# ▶️ Cómo ejecutar el proyecto

## 1. Abrir la terminal

Ubicarse en la carpeta donde está el archivo:

## 2. Ejecutar el archivo SQL

```bash
sqlite3 tienda_bicicletas.db < proyecto7.sql
```

## 3. Abrir la base de datos

```bash
sqlite3 tienda_bicicletas.db
```

## 4. Ejecutar nuevamente el script dentro de SQLite

```sql
.read proyecto7.sql
```

## 5. Ver las tablas

```sql
.tables
```

---

# 📊 Restricciones implementadas

## NOT NULL

Se utiliza para garantizar que los campos obligatorios siempre tengan un valor.

Columnas:

- categories.name
- bikes.brand
- bikes.model
- bikes.serial_number
- bikes.price
- bikes.stock
- bikes.category_id
- bikes.is_active

---

## UNIQUE

Se utiliza para evitar valores duplicados.

Columnas:

- categories.name
- bikes.serial_number

---

## CHECK

Se utiliza para validar reglas de negocio.

Validaciones:

```sql
CHECK(price > 0)
CHECK(stock >= 0)
```

---

## DEFAULT

Se asigna un valor por defecto al estado de la bicicleta.

```sql
is`

---

## FOREIGN KEY

Se implementa una relación entre bicicletas y categorías.

```sql
FOREIGN KEY (category_id)
REFERENCES categories(id)
ON DELETE RESTRICT
```

---

# 🔎 Consultas implementadas

## Consulta 1 — IS NULL

Muestra las bicicletas que no tienen color registrado.

```sql
SELECT id, brand, model
FROM bikes
WHERE color IS NULL;
```

---
_active INTEGER NOT NULL DEFAULT 1
``
## Consulta 2 — COALESCE

Reemplaza los valores NULL por un texto descriptivo.

```sql
SELECT
    brand,
    model,
    COALESCE(color, 'Sin color registrado') AS color_mostrado
FROM bikes;
```

---

# 📈 Datos de prueba

El proyecto incluye:

- 3 categorías
- 30 bicicletas
- 3 bicicletas con valor NULL en la columna color

---

# 👨‍💻 Autor

José Luis Castillo Cañas


