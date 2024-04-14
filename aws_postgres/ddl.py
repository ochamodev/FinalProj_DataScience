DDL_QUERY =  '''

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


create table if not exists dimFechas(
    idFecha INT PRIMARY KEY,
    fecha_completa DATE,
    dia_semana INT,
    num_dia_mes INT,
    dia_nombre VARCHAR(9),
    dia_abrev CHAR(3),
    semana_bandera CHAR(7),
    mes INT,
    mes_nombre VARCHAR(9),
    cuarto INT,
    anio INT,
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
'''