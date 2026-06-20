-- ============================================
-- Semana 09 — INNER JOIN y LEFT JOIN
-- Dominio: Tienda de bicicletas
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS bikes;
DROP TABLE IF EXISTS categories;

-- ============================================
-- TABLA categories
-- ============================================

CREATE TABLE categories (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- ============================================
-- TABLA bikes
-- ============================================

CREATE TABLE bikes (
    id INTEGER PRIMARY KEY,
    serial_number TEXT NOT NULL UNIQUE,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    stock INTEGER NOT NULL CHECK(stock >= 0),
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES categories(id)
);

-- ============================================
-- TABLA sales
-- ============================================

CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    sale_date TEXT NOT NULL,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    total REAL NOT NULL CHECK(total > 0),
    bike_id INTEGER NOT NULL,
    FOREIGN KEY (bike_id)
        REFERENCES bikes(id)
);

-- ============================================
-- CATEGORÍAS
-- ============================================

INSERT INTO categories (id, name) VALUES
(1,'Montaña'),
(2,'Ruta'),
(3,'Urbana');

-- ============================================
-- BICICLETAS
-- ============================================

INSERT INTO bikes
(serial_number, brand, model, price, stock, category_id)
VALUES
('SN001','Specialized','Tarmac SL8 Expert',22990000,4,2),
('SN002','Specialized','Rockhopper Comp',3490000,6,1),
('SN003','Specialized','Rockhopper Elite',4890000,5,1),
('SN004','Trek','Marlin 5 Gen 3',2890000,7,1),
('SN005','Trek','Domane AL 2',5200000,3,2),
('SN006','Trek','Fuel EX 8',15900000,2,1),
('SN007','Giant','Talon 1',3400000,5,1),
('SN008','Giant','Defy Advanced 2',9800000,4,2),
('SN009','Giant','Anthem Advanced Pro 29',17500000,2,1),
('SN010','Scott','Scale 980',3669990,5,1),
('SN011','Scott','Spark 970',12800000,3,1),
('SN012','Scott','Aspect 950',3100000,8,1),
('SN013','Cannondale','Trail 5',2949860,7,1),
('SN014','Cannondale','Scalpel Carbon 3',19800000,2,1),
('SN015','Cannondale','Quick 4',4200000,6,3),
('SN016','Orbea','Orca M30',9990000,4,2),
('SN017','Orbea','Alma H30',4299000,5,1),
('SN018','Orbea','Occam H20',13800000,3,1),
('SN019','BMC','Teammachine SLR SIX',11999000,2,2),
('SN020','BMC','Roadmachine Five',14500000,2,2);

-- ============================================
-- VENTAS
-- ============================================

INSERT INTO sales
(sale_date, quantity, total, bike_id)
VALUES
('2026-06-01',1,22990000,1),
('2026-06-02',2,6980000,2),
('2026-06-03',1,4890000,3),
('2026-06-04',1,2890000,4),
('2026-06-05',1,5200000,5),
('2026-06-06',1,15900000,6),
('2026-06-07',1,3400000,7),
('2026-06-08',1,9800000,8),
('2026-06-09',1,17500000,9),
('2026-06-10',1,3669990,10);

-- ============================================
-- CONSULTA 1: INNER JOIN
-- Bicicletas que tienen ventas
-- ============================================

SELECT
    b.brand AS marca,
    b.model AS modelo,
    s.sale_date AS fecha_venta,
    s.total AS total_venta
FROM bikes b
INNER JOIN sales s
ON b.id = s.bike_id;

-- ============================================
-- CONSULTA 2: JOIN DE TRES TABLAS
-- Bicicleta + categoría + venta
-- ============================================

SELECT
    b.brand AS marca,
    b.model AS modelo,
    c.name AS categoria,
    s.sale_date AS fecha_venta,
    s.total AS total_venta
FROM bikes b
INNER JOIN categories c
ON b.category_id = c.id
INNER JOIN sales s
ON b.id = s.bike_id;

-- ============================================
-- CONSULTA 3: LEFT JOIN
-- Todas las bicicletas tengan o no ventas
-- ============================================

SELECT
    b.brand AS marca,
    b.model AS modelo,
    s.sale_date AS fecha_venta
FROM bikes b
LEFT JOIN sales s
ON b.id = s.bike_id;

-- ============================================
-- CONSULTA 4: HUÉRFANOS
-- Bicicletas sin ventas
-- ============================================

SELECT
    b.brand AS marca,
    b.model AS modelo
FROM bikes b
LEFT JOIN sales s
ON b.id = s.bike_id
WHERE s.id IS NULL;

-- ============================================
-- CONSULTA 5: REPORTE AGREGADO
-- Cantidad de ventas por bicicleta
-- ============================================

SELECT
    b.brand AS marca,
    b.model AS modelo,
    COUNT(s.id) AS total_ventas
FROM bikes b
LEFT JOIN sales s
ON b.id = s.bike_id
GROUP BY b.id, b.brand, b.model
ORDER BY total_ventas DESC