-- ============================================
-- PROYECTO SEMANA 05 — Operadores y Filtros
-- Semana 05 — BETWEEN, IN, LIKE
-- Dominio: Tienda de bicicletas
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS repairs;
DROP TABLE IF EXISTS parts;
DROP TABLE IF EXISTS bikes;

-- ============================================
-- TABLA bikes
-- ============================================

CREATE TABLE bikes (
    id INTEGER PRIMARY KEY,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    stock INTEGER NOT NULL CHECK(stock >= 0)
);

-- ============================================
-- TABLA parts
-- ============================================

CREATE TABLE parts (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    stock INTEGER NOT NULL CHECK(stock >= 0)
);

-- ============================================
-- TABLA sales
-- ============================================

CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    bike_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    total REAL NOT NULL,
    date TEXT NOT NULL,
    FOREIGN KEY (bike_id) REFERENCES bikes(id)
);

-- ============================================
-- TABLA repairs
-- ============================================

CREATE TABLE repairs (
    id INTEGER PRIMARY KEY,
    bike_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    cost REAL NOT NULL,
    date TEXT NOT NULL,
    FOREIGN KEY (bike_id) REFERENCES bikes(id)
);

-- ============================================
-- INSERT INTO bikes (30 registros)
-- Bicicletas reales
-- ============================================

INSERT INTO bikes (brand, model, price, stock) VALUES
('Specialized','Tarmac SL8 Expert',22990000,4),
('Specialized','Rockhopper Comp',3490000,6),
('Specialized','Rockhopper Elite',4890000,5),
('Trek','Marlin 5 Gen 3',2890000,7),
('Trek','Domane AL 2',5200000,3),
('Trek','Fuel EX 8',15900000,2),
('Giant','Talon 1',3400000,5),
('Giant','Defy Advanced 2',9800000,4),
('Giant','Anthem Advanced Pro 29',17500000,2),
('Scott','Scale 980',3669990,5),
('Scott','Spark 970',12800000,3),
('Scott','Aspect 950',3100000,8),
('Cannondale','Trail 5',2949860,7),
('Cannondale','Scalpel Carbon 3',19800000,2),
('Cannondale','Quick 4',4200000,6),
('Orbea','Orca M30',9990000,4),
('Orbea','Alma H30',4299000,5),
('Orbea','Occam H20',13800000,3),
('BMC','Teammachine SLR SIX',11999000,2),
('BMC','Roadmachine Five',14500000,2),
('Pinarello','GAN Ultegra',12900000,3),
('Pinarello','Dogma F',38900000,1),
('Canyon','Ultimate CF SL 7',4719411,5),
('Canyon','Neuron 6',9700000,4),
('KTM','Scarp Elite AXS',26298000,2),
('Liv','Tempt 3 29',1690000,9),
('Liv','Avail AR 3',6200000,4),
('Bianchi','Sprint Disc 105',9333441,3),
('Santa Cruz','Hightower CC',25400000,2),
('Merida','Big Nine 300',3800000,6);

-- ============================================
-- INSERT INTO parts (10 registros)
-- ============================================

INSERT INTO parts (name, price, stock) VALUES
('Llanta Maxxis',180000,15),
('Cadena Shimano',85000,20),
('Frenos Hidraulicos',350000,10),
('Pedales MTB',120000,18),
('Manubrio Aluminio',95000,14),
('Sillin Pro',160000,8),
('Cassette SRAM',450000,5),
('Suspension Fox',2100000,3),
('Luz LED',45000,25),
('Portacaramañola',30000,17);

-- ============================================
-- INSERT INTO sales (10 registros)
-- ============================================

INSERT INTO sales (bike_id, quantity, total, date) VALUES
(1,1,22990000,'2026-05-01'),
(2,2,6980000,'2026-05-02'),
(4,1,2890000,'2026-05-03'),
(5,1,5200000,'2026-05-04'),
(7,1,3400000,'2026-05-05'),
(10,1,3669990,'2026-05-06'),
(13,2,5899720,'2026-05-07'),
(16,1,9990000,'2026-05-08'),
(22,1,38900000,'2026-05-09'),
(30,1,3800000,'2026-05-10');

-- ============================================
-- INSERT INTO repairs (10 registros)
-- ============================================

INSERT INTO repairs (bike_id, description, cost, date) VALUES
(1,'Cambio de cadena',90000,'2026-05-01'),
(2,'Mantenimiento general',150000,'2026-05-02'),
(3,'Cambio de frenos',120000,'2026-05-03'),
(4,'Ajuste de suspension',180000,'2026-05-04'),
(5,'Cambio de llanta',200000,'2026-05-05'),
(6,'Lubricacion completa',70000,'2026-05-06'),
(7,'Cambio de pedales',95000,'2026-05-07'),
(8,'Revision de cambios',85000,'2026-05-08'),
(9,'Alineacion de rin',60000,'2026-05-09'),
(10,'Mantenimiento avanzado',250000,'2026-05-10');

-- ============================================
-- CONSULTA 1: BETWEEN
-- ============================================
SELECT 
    id AS codigo, 
    brand AS marca, 
    model AS modelo,
    price AS precio
FROM bikes
WHERE price BETWEEN 3000000 AND 10000000;

-- ============================================
-- CONSULTA 2: IN
-- ============================================
SELECT 
    id AS codigo, 
    brand AS marca, 
    model AS modelo,
    stock AS inventario
FROM bikes 
WHERE brand IN ('Specialized', 'Trek', 'Scott');

-- ============================================
-- CONSULTA 3: LIKE
-- ============================================

SELECT 
    id AS codigo,
    brand AS marca, 
    model AS modelo, 
    price AS precio
FROM bikes 
WHERE model LIKE '%29%';  

-- ============================================
-- CONSULTA 4: FILTRO COMBINADO
-- ============================================

SELECT 
     id AS codigo,
     brand AS marca,
     model AS modelo,  
     price AS precio, 
     stock AS inventario
FROM bikes
WHERE price BETWEEN 3000000 AND 15000000
AND brand IN ('Specialized','Trek','Scott') 
AND model LIKE '%Comp%'
ORDER BY price ASC;