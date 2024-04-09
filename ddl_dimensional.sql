-- TODO Use postgres or Mysql?
drop database if exists pj_final_dimensional;
create database pj_final_dimensional;
use pj_final_dimensional;

create table if not exists dimArticulo (
	idarticulo int primary key auto_increment,
    categoria varchar(50),
    codigo varchar(50) not null, 
    nombre varchar(100),
    precio_venta decimal(11, 2),
    campo_timestamp timestamp default now ()
);

create table if not exists dimPersona(
	idpersona int primary key auto_increment, 
    nombre varchar(100),
    num_documento varchar(20),
    email varchar(50),
    campo_timestamp timestamp default now ()
);

create table if not exists dimVenta(
	idventa int primary key auto_increment, 
    nombreCliente varchar(100),
    idarticulo,
    cantidad,
    precio,
    descuento,
    fecha datetime, 
    total decimal(11, 2),
    campo_timestamp timestamp default now ()
);

create table dimFechas(
    idFecha INT PRIMARY KEY,
    fecha_completa DATE,
    dia_semana TINYINT,
    num_dia_mes TINYINT,
    dia_num_total INT,
    dia_nombre VARCHAR(9),
    dia_abrev CHAR(3),
    semana_bandera CHAR(7),
    num_semana_anio TINYINT,
    num_semana_total INT,
    fecha_inicio_semana DATE,
    fecha_inicio_semana_llave INT,
    mes TINYINT,
    mes_num_total INT,
    mes_nombre VARCHAR(9),
    month_abrev VARCHAR(3),
    cuarto TINYINT,
    anio INT,
    anio_mes INT,
    mes_fiscal TINYINT,
    cuarto_fiscal TINYINT,
    anio_fiscal INT,
    ultimo_dia_mes_bandera ENUM('No fin de mes', 'Fin de mes'),
    mismo_dia_anio_anterior_fecha DATE,
    campo_timestamp timestamp default now ()
);


create table hechos(
    idArticulo int,
    idPersona int,
    idvVenta int,
    idFecha int,
    primary key (idArticulo, idPersona, idVenta, idFecha)
)
