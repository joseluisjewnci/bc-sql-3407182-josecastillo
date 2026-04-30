-- Proyecto Semana 01
-- Dominio: Tienda de bicicletas

--tablas de mi dominio

create table bikes (
id integer primary key,
brand text not null,
model text not null,
price real,
stock integer
);

create table parts (
id integer primary key, 
nombre text not null, 
price real, 
stock integer 
);

create table sales (
    id integer  primary key,
    bike_id integer,
    quantity integer,
    total real,
    date text,
    foreign key (bike_id) references bikes (id)
);

create table repairs(
id integer primary key, 
bike_id integer,
descripcion text, 
cost real,
date text,
foreign key (bike_id) references bikes (id)
);

--inserts de mi dominio
-- bikes
INSERT INTO bikes (brand, model, price, stock) VALUES ('Orbea', 'Orca M30', 9990000, 6 );
INSERT INTO bikes (brand, model, price, stock) VALUES ('Specialized','Tarmac SL8 Expert', 22990000, 4);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Specialized','Rockhopper Expert 29', 4390000, 5);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Giant' ,'Talon 29 1 2023' , 3042000 , 3);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Scott','Scale 980 2024',3669990 , 3);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Pinarello', 'GAN Ultegra', 12900000, 4);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Bianchi', 'Sprint Disc 105 2025', 9333441 , 3);
INSERT INTO bikes (brand, model, price, stock) VALUES ('BMC', 'Teammachine SLR SIX',11999000 , 2);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Liv', 'Tempt 3 29 2023',1690000 ,7);
INSERT INTO bikes (brand, model, price, stock) VALUES ('KTM', 'Scarp Elite AXS',26298000 ,4);
INSERT INTO bikes (brand, model, price, stock) VALUES ('Cannondale', 'Trail 5',2949860 ,8 );
INSERT INTO bikes (brand, model, price, stock) VALUES ('Canyon', 'Ultimate CF SL 7',4719411 ,4 );
INSERT INTO bikes (brand, model, price, stock) VALUES ('Orbea', 'Alma H30 2023',4299000 , 4 );
INSERT INTO bikes (brand, model, price, stock) VALUES ('Giant', 'Talon 29 2 2023',1890000 ,5 );
INSERT INTO bikes (brand, model, price, stock) VALUES ('Specialized', 'Rockhopper Comp',3490000 ,5);

--parts 
INSERT INTO parts (nombre, price, stock) VALUES ('Llanta',50000, 25 );
INSERT INTO parts (nombre, price, stock) VALUES ('Cadena', 20000, 20);
INSERT INTO parts (nombre, price, stock) VALUES ('Frenos', 85000,27);
INSERT INTO parts (nombre, price, stock) VALUES ('Pedales', 150000, 12);
INSERT INTO parts (nombre, price, stock) VALUES ('Manubrios', 16000, 30);

--sales
INSERT INTO sales (bike_id, quantity, total, date) VALUES (1, 1, 9990000, '2026-04-02');
INSERT INTO sales (bike_id, quantity, total, date) VALUES (2, 2, 45980000, '2026-04-05');
INSERT INTO sales (bike_id, quantity, total, date) VALUES (3, 1, 4390000, '2026-04-08');
INSERT INTO sales (bike_id, quantity, total, date) VALUES (4, 1, 3042000, '2026-04-09');
INSERT INTO sales (bike_id, quantity, total, date) VALUES (5, 1, 3669990, '2026-04-12');

--repairs
INSERT INTO repairs (bike_id, descripcion, cost, date) VALUES (1,'Cambio de llanta', 50000, '2026-04-13');
INSERT INTO repairs (bike_id, descripcion, cost, date) VALUES (2,'Cambio de cadena', 35000, '2026-04-13');
INSERT INTO repairs (bike_id, descripcion, cost, date) VALUES (3,'Cambio de frenos', 30000, '2026-04-15');
INSERT INTO repairs (bike_id, descripcion, cost, date) VALUES (4,'Cambio de pedales', 25000, '2026-04-17');
INSERT INTO repairs (bike_id, descripcion, cost, date) VALUES (5,'Mantenimiento general', 65000, '2026-04-19');

SELECT id, brand, model, price, stock FROM bikes;

SELECT brand, model FROM bikes ORDER BY brand;

SELECT COUNT(id) AS total_bikes FROM bikes;