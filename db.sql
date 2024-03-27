drop database if exists pj_final;
create database pj_final;
use pj_final;

create table categoria (
	idcategoria int primary key auto_increment,
    nombre varchar(50) not null,
    descripcion varchar(255), 
    estado bit
);

create table articulo (
	idarticulo int primary key auto_increment,
    idcategoria int,
    codigo varchar(50) not null, 
    nombre varchar(100),
    precio_venta decimal(11, 2),
    stock int, 
    descripcion varchar(255),
    imagen varchar(20),
    estado bit,
    foreign key (idcategoria) references categoria(idcategoria)
);

create table persona(
	idpersona int primary key auto_increment, 
    tipo_persona varchar(20), 
    nombre varchar(100),
    tipo_documento varchar(20), 
    num_documento varchar(20),
    direccion varchar(70), 
    telefono varchar(20),
    email varchar(50)
);

create table rol(
	idrol int primary key auto_increment, 
	nombre varchar(30) not null, 
    descripcion varchar(255),
    estado bit
);

create table usuario(
	idusuario int primary key auto_increment, 
    idrol int, 
    nombre varchar(100), 
    tipo_documento varchar(20),
    num_documento varchar(20), 
    direccion varchar(20), 
    telefono varchar(20), 
    email varchar(50), 
    clave varbinary(255),
    estado bit,
    foreign key (idrol) references rol(idrol)
);

create table ingreso(
    idingreso int primary key auto_increment, 
    idproveedor int,
    idusuario int, 
    tipo_comprobante varchar(20), 
    serie_comprobante varchar(20), 
    num_comprobante varchar(10), 
    fecha datetime, 
    impuesto decimal(4, 2), 
    total decimal(11, 2), 
    estado varchar(20), 
    foreign key (idproveedor) references persona(idpersona),
    foreign key (idusuario) references usuario(idusuario)
);

create table venta(
	idventa int primary key auto_increment, 
    idcliente int, 
    idusuario int, 
    tipo_comprobante varchar(20), 
    serie_comprobante varchar(7), 
    num_comprobante varchar(10), 
    fecha datetime, 
    impuesto decimal(4, 2), 
    total decimal(11, 2), 
    estado varchar(20), 
    foreign key (idcliente) references persona(idpersona),
    foreign key (idusuario) references usuario(idusuario)
);

create table detalle_venta(
	iddetalle_venta int primary key auto_increment,
    idventa int,
    idarticulo int, 
    cantidad int, 
    precio decimal(11, 2), 
    descuento decimal(11, 2), 
    foreign key (idventa) references venta(idventa)
);

create table detalle_ingreso(
	iddetalle_ingreso int, 
    idingreso int, 
    idarticulo int, 
    cantidad int, 
    precio decimal(11, 2),
    foreign key (idingreso) references ingreso(idingreso)
);