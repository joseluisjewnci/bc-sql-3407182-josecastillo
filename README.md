# Proyecto Semana 06 — Funciones de Agregación

## 📌 Descripción
Este proyecto corresponde a la Semana 06 del bootcamp de SQL.

El objetivo es practicar funciones de agregación en SQLite usando un dominio de tienda de bicicletas.

Se implementaron consultas utilizando:

- COUNT
- SUM
- AVG
- MIN
- MAX
- GROUP BY
- HAVING

---

# 🗂️ Estructura del proyecto

El proyecto contiene las siguientes tablas:

- bikes
- parts
- sales
- repairs

---

# 🚴 Dominio

Sistema de gestión para una tienda de bicicletas.

El sistema permite almacenar:

- bicicletas
- repuestos
- ventas
- reparaciones

---

# ⚙️ Tecnologías utilizadas

- SQLite3
- SQL

---

# ▶️ Cómo ejecutar el proyecto

## 1. Abrir la terminal

Ubicarse en la carpeta donde está el archivo:

```bash
cd Documents/sql
```

## 2. Ejecutar el archivo SQL

```bash
sqlite3 tienda_bicicletas.db < proyecto6.sql
```

## 3. Abrir la base de datos

```bash
sqlite3 tienda_bicicletas.db
```

## 4. Ver las tablas

```sql
.tables
```

---

# 📊 Consultas implementadas

## Reporte 1 — Totales globales

- Total de bicicletas
- Suma total de precios
- Promedio de precios

## Reporte 2 — Valores extremos

- Precio mínimo
- Precio máximo

## Reporte 3 — GROUP BY

Agrupación de bicicletas por marca calculando:

- cantidad de modelos
- promedio de precios

## Reporte 4 — HAVING

Filtra marcas que tienen más de 2 modelos registrados.

---

# 👨‍💻 Autor

José Luis Castillo Cañas