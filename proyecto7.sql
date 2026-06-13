-- ============================================
-- PROYECTO SEMANA 07 — NULL y Constraints
-- Semana 07 — NOT NULL, UNIQUE, CHECK, FK
-- Dominio: Tienda de bicicletas
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

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
    color TEXT,
    price REAL NOT NULL CHECK(price > 0),
    stock INTEGER NOT NULL CHECK(stock >= 0),
    is_active INTEGER NOT NULL DEFAULT 1,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES categories(id)
        ON DELETE RESTRICT
);

-- ============================================
-- INSERT INTO categories
-- ============================================

INSERT INTO categories (id, name) VALUES
(1, 'Montaña'),
(2, 'Ruta'),
(3, 'Urbana');

-- ============================================
-- INSERT INTO bikes (30 registros)
-- 3 registros con color NULL
-- ============================================

INSERT INTO bikes
(serial_number, brand, model, color, price, stock, category_id)
VALUES
('SN001','Specialized','Tarmac SL8 Expert','Rojo',22990000,4,2),
('SN002','Specialized','Rockhopper Comp','Negro',3490000,6,1),
('SN003','Specialized','Rockhopper Elite',NULL,4890000,5,1),
('SN004','Trek','Marlin 5 Gen 3','Azul',2890000,7,1),
('SN005','Trek','Domane AL 2','Blanco',5200000,3,2),
('SN006','Trek','Fuel EX 8','Negro',15900000,2,1),
('SN007','Giant','Talon 1','Verde',3400000,5,1),
('SN008','Giant','Defy Advanced 2','Rojo',9800000,4,2),
('SN009','Giant','Anthem Advanced Pro 29',NULL,17500000,2,1),
('SN010','Scott','Scale 980','Negro',3669990,5,1),
('SN011','Scott','Spark 970','Azul',12800000,3,1),
('SN012','Scott','Aspect 950','Gris',3100000,8,1),
('SN013','Cannondale','Trail 5','Negro',2949860,7   ,1),
('SN014','Cannondale','Scalpel Carbon 3','Verde',19800000,2,1),
('SN015','Cannondale','Quick 4','Blanco',4200000,6,3),
('SN016','Orbea','Orca M30','Rojo',9990000,4,2),
('SN017','Orbea','Alma H30','Negro',4299000,5,1),
('SN018','Orbea','Occam H20','Azul',13800000,3,1),
('SN019','BMC','Teammachine SLR SIX','Gris',11999000,2,2),
('SN020','BMC','Roadmachine Five',NULL,14500000,2,2),
('SN021','Pinarello','GAN Ultegra','Negro',12900000,3,2),
('SN022','Pinarello','Dogma F','Rojo',38900000,1,2),
('SN023','Canyon','Ultimate CF SL 7','Blanco',4719411,5,2),
('SN024','Canyon','Neuron 6','Azul',9700000,4,1),
('SN025','KTM','Scarp Elite AXS','Naranja',26298000,2,1),
('SN026','Liv','Tempt 3 29','Morado',1690000,9,1),
('SN027','Liv','Avail AR 3','Blanco',6200000,4,2),
('SN028','Bianchi','Sprint Disc 105','Celeste',9333441,3,2),
('SN029','Santa Cruz','Hightower CC','Negro',25400000,2,1),
('SN030','Merida','Big Nine 300','Verde',3800000,6,1);

-- ============================================
-- CONSULTA 1: IS NULL
-- Bicicletas sin color registrado
-- ============================================

SELECT id, brand, model, color
FROM bikes
WHERE color IS NULL;

-- ============================================
-- CONSULTA 2: COALESCE
-- Reemplazar NULL por texto
-- ============================================

SELECT brand, model,
    COALESCE(color, 'Sin color registrado') AS color_mostrado
FROM bikes;

-- ============================================
-- CONSULTA 3: Verificar FK
-- ============================================

SELECT b.id, b.brand, b.model, 
    c.name AS categoria
FROM bikes b
JOIN categories c
ON b.category_id = c.id;

-- ============================================
-- CONSULTA 4: Verificar UNIQUE
-- ============================================

SELECT serial_number, brand, model
FROM bikes
ORDER BY serial_number;