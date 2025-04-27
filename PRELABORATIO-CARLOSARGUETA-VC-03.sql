create database PRELABORATORIO;
use PRELABORATORIO;
/* creacion de tablas*/
create table direccion(
idDireccionfk int primary key,
Direccion varchar(45),
Ciudad varchar(45),
Pais varchar(45)
);
create table categoria(
idCategoriafk int primary key,
Nombre varchar(45)
);
create table cliente(
idClientefk int primary key,
Nombre varchar(45),
Apellido varchar(45),
Edad int, 
Direccion_idDireccion int,
foreign key (Direccion_idDireccion) references Direccion(idDireccionfk)
);
create table peliculas(
id_Peliculas int primary key,
Nombre varchar(45),
Direccion int,
Descripcion TEXT,
Año int,
Categoria_idCategoria int,
foreign key (Categoria_idCategoria) references Categoria(idCategoriafk)
);
create table inventario(
id_CopiasPeliculas int primary key,
Peliculas_idPeliculas int,
foreign key (Peliculas_idPeliculas ) references Peliculas(id_Peliculas),
Disponible tinyint
);
create table renta(
id_Renta int primary key,
Fecha_Renta DATE,
Fecha_Entrega DATE,
Inventario_idCopiasPeliculas int,
foreign key (Inventario_idCopiasPeliculas) references Inventario(id_CopiasPeliculas),
cliente_idCliente int,
foreign key (cliente_idCliente) references cliente(idClientefk)
);
create table Contacto(
Telefono int primary key,
Contacto_Cine int,
Contacto_Proveedor int
);
create table Pago_Pelicula(
id_Pago int primary key,
id_Proveedor int,
Nombre_Pelicula varchar(50),
No_Copias varchar(50)
);
/* Insertar los datos de las tablas*/
INSERT INTO direccion(idDireccionfk,Direccion,Ciudad,Pais) 
VALUES
(1, 'Zona 11', 'GUATEMALA', 'Guatemala'),
(2, 'Zona 12', 'ZACAPA', 'Guatemala'),
(3, 'Zona 13', 'PETEN', 'Guatemala'),
(4, 'Zona 14', 'TOTONICAPAN', 'Guatemala'),
(5, 'Zona 15', 'LA BETANIA', 'Guatemala');
INSERT INTO cliente VALUES
(1, 'CHOMIN', 'CHOMI', 25, 1),
(2, 'DIFF', 'WAWA', 19, 2),
(3, 'WASA', 'WAST', 18, 3),
(4, 'JENSY', 'BLUSS', 17, 4),
(5, 'MAY', 'LORD', 28, 5);
INSERT INTO categoria VALUES
(1, 'Animacion'),
(2, 'Terror'),
(3, 'Romance'),
(4, 'Ciencia Ficcion'),
(5, 'Drama');
INSERT INTO peliculas VALUES
(1, 'POKEMON1', 90, 'Película de MEWTO', 2008, 5),
(2, 'BLADE RUNNER', 140, 'Terror Psicologico', 2017, 1),
(3, '50 SOMBRAS DE GREY', 195, 'Romance Puro', 2017, 2),
(4, 'WARCRAFT', 100, 'MAGICA', 2004, 3),
(5, 'CREPUSCULO', 170, 'AUUUUU', 2021, 4);
INSERT INTO inventario VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 1),
(5, 5, 1);
INSERT INTO renta VALUES
(1, '2025-03-10', '2025-01-11', 2, 1),
(2, '2025-04-01', '2025-02-06', 3, 2),
(3, '2025-05-05', '2025-03-11', 4, 3),
(4, '2025-06-15', '2025-03-19', 5, 4),
(5, '2025-07-01', '2025-04-05', 1, 5);
/* Filtrar los clientes,pelicuas y ordenar de forma ascendente y descendente*/
SELECT * FROM cliente WHERE Nombre = 'carlos';
DELETE FROM peliculas WHERE NomBre = 'POKEMON1';
SELECT * FROM PRELAB3.direccion;
SELECT * FROM categoria ORDER BY Nombre ASC;
SELECT * FROM peliculas ORDER BY Año DESC;
SELECT SUM(cliente.Edad) AS TotalEdad
FROM renta
JOIN cliente ON renta.Cliente_idCliente = cliente.idClientefk;