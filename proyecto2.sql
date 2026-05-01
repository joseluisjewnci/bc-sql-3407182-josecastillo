-- ============================================
-- PROYECTO SEMANA 02 — DDL
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
-- TABLA 1: bikes (tabla principal)
-- ============================================

CREATE TABLE IF NOT EXISTS bikes (
    id INTEGER PRIMARY KEY,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    price REAL NOT NULL CHECK (price > 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    UNIQUE(brand, model)
);

-- ============================================
-- TABLA 2: parts
-- ============================================

CREATE TABLE IF NOT EXISTS parts (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price REAL NOT NULL CHECK (price > 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

-- ============================================
-- TABLA 3: sales
-- ============================================

CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY,
    bike_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    total REAL NOT NULL CHECK (total > 0),
    date TEXT NOT NULL,
    FOREIGN KEY (bike_id) REFERENCES bikes(id)
);

-- ============================================
-- TABLA 4: repairs
-- ============================================

CREATE TABLE IF NOT EXISTS repairs (
    id INTEGER PRIMARY KEY,
    bike_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    cost REAL NOT NULL CHECK (cost > 0),
    date TEXT NOT NULL,
    FOREIGN KEY (bike_id) REFERENCES bikes(id)
);

-- ============================================
-- DATOS DE PRUEBA
-- ============================================

-- bikes (15 registros)
INSERT INTO bikes (brand, model, price, stock) VALUES
('Orbea', 'Orca M30', 9990000, 6),
('Specialized','Tarmac SL8 Expert', 22990000, 4),
('Specialized','Rockhopper Expert 29', 4390000, 5),
('Giant' ,'Talon 29 1 2023' , 3042000 , 3),
('Scott','Scale 980 2024',3669990 , 3),
('Pinarello', 'GAN Ultegra', 12900000, 4),
('Bianchi', 'Sprint Disc 105 2025', 9333441 , 3),
('BMC', 'Teammachine SLR SIX',11999000 , 2),
('Liv', 'Tempt 3 29 2023',1690000 ,7),
('KTM', 'Scarp Elite AXS',26298000 ,4),
('Cannondale', 'Trail 5',2949860 ,8),
('Canyon', 'Ultimate CF SL 7',4719411 ,4),
('Orbea', 'Alma H30 2023',4299000 , 4),
('Giant', 'Talon 29 2 2023',1890000 ,5),
('Specialized', 'Rockhopper Comp',3490000 ,5);

-- parts (5 registros)
INSERT INTO parts (name, price, stock) VALUES
('Llanta',50000, 25),
('Cadena', 20000, 20),
('Frenos', 85000,27),
('Pedales', 150000, 12),
('Manubrios', 16000, 30);

-- sales (5 registros)
INSERT INTO sales (bike_id, quantity, total, date) VALUES
(1, 1, 9990000, '2026-04-02'),
(2, 2, 45980000, '2026-04-05'),
(3, 1, 4390000, '2026-04-08'),
(4, 1, 3042000, '2026-04-09'),
(5, 1, 3669990, '2026-04-12');

-- repairs (5 registros)
INSERT INTO repairs (bike_id, description, cost, date) VALUES
(1,'Cambio de llanta', 50000, '2026-04-13'),
(2,'Cambio de cadena', 35000, '2026-04-13'),
(3,'Cambio de frenos', 30000, '2026-04-15'),
(4,'Cambio de pedales', 25000, '2026-04-17'),
(5,'Mantenimiento general', 65000, '2026-04-19');   