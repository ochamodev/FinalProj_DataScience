-- TODO Use postgres or Mysql?
drop database if exists pj_final_dimensional;
create database pj_final_dimensional;
use pj_final_dimensional;

create table if not exists dimArticulo (
	idarticulo serial primary key,
    categoria varchar(50),
    codigo varchar(50) not null, 
    nombre varchar(100),
    precio_venta decimal(11, 2),
    campo_timestamp timestamp default now ()
);

create table if not exists dimPersona(
	idpersona serial primary key, 
    nombre varchar(100),
    num_documento varchar(20),
    email varchar(50),
    campo_timestamp timestamp default now ()
);

create table if not exists dimVenta(
	idventa serial primary key, 
    nombreCliente varchar(100),
    idarticulo int,
    cantidad int,
    precio decimal(11, 2),
    descuento decimal(11,2),
    fecha timestamp, 
    total decimal(11, 2),
    campo_timestamp timestamp default now ()
);

-- create type if not exists bandera_ultimo_dia_mes as ENUM('No fin de mes', 'Fin de mes');

create table if not exists dimFechas(
    idFecha INT PRIMARY KEY,
    fecha_completa DATE,
    dia_semana INT,
    num_dia_mes INT,
    dia_num_total INT,
    dia_nombre VARCHAR(9),
    dia_abrev CHAR(3),
    semana_bandera CHAR(7),
    num_semana_anio INT,
    num_semana_total INT,
    fecha_inicio_semana DATE,
    fecha_inicio_semana_llave INT,
    mes INT,
    mes_num_total INT,
    mes_nombre VARCHAR(9),
    month_abrev VARCHAR(3),
    cuarto INT,
    anio INT,
    anio_mes INT,
    mes_fiscal INT,
    cuarto_fiscal INT,
    anio_fiscal INT,
    ultimo_dia_mes_bandera bandera_ultimo_dia_mes,
    mismo_dia_anio_anterior_fecha DATE,
    campo_timestamp timestamp default now ()
);


create table if not exists hechos(
    idArticulo int,
    idPersona int,
    idVenta int,
    idFecha int,
    total decimal(11, 2),
    descuento decimal(11, 2),
    ganancia decimal(11, 2),
    primary key (idArticulo, idPersona, idVenta, idFecha)
);