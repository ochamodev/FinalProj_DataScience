DDL_CREATE_CATEGORIA = '''
CREATE TABLE IF NOT EXISTS categoria (
    idcategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    estado BIT
);
'''

DDL_CREATE_ARTICULO = '''
CREATE TABLE IF NOT EXISTS articulo (
    idarticulo INT PRIMARY KEY AUTO_INCREMENT,
    idcategoria INT,
    codigo VARCHAR(50) NOT NULL,
    nombre VARCHAR(100),
    precio_venta DECIMAL(11, 2),
    stock INT,
    descripcion VARCHAR(255),
    imagen VARCHAR(20),
    estado BIT,
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);
'''

DDL_CREATE_PERSONA = '''
CREATE TABLE IF NOT EXISTS persona (
    idpersona INT PRIMARY KEY AUTO_INCREMENT,
    tipo_persona VARCHAR(20),
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    num_documento VARCHAR(20),
    direccion VARCHAR(70),
    telefono VARCHAR(20),
    email VARCHAR(50)
);
'''

DDL_CREATE_ROL = '''
CREATE TABLE IF NOT EXISTS rol (
    idrol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(255),
    estado BIT
);
'''

DDL_CREATE_USUARIO = '''
CREATE TABLE IF NOT EXISTS usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    idrol INT,
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    num_documento VARCHAR(20),
    direccion VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(50),
    clave VARBINARY(255),
    estado BIT,
    FOREIGN KEY (idrol) REFERENCES rol(idrol)
);
'''

DDL_CREATE_INGRESO = '''
CREATE TABLE IF NOT EXISTS ingreso (
    idingreso INT PRIMARY KEY AUTO_INCREMENT,
    idproveedor INT,
    idusuario INT,
    tipo_comprobante VARCHAR(20),
    serie_comprobante VARCHAR(20),
    num_comprobante VARCHAR(10),
    fecha DATETIME,
    impuesto DECIMAL(4, 2),
    total DECIMAL(11, 2),
    estado VARCHAR(20),
    FOREIGN KEY (idproveedor) REFERENCES persona(idpersona),
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario)
);
'''

DDL_CREATE_VENTA = '''
CREATE TABLE IF NOT EXISTS venta (
    idventa INT PRIMARY KEY AUTO_INCREMENT,
    idcliente INT,
    idusuario INT,
    tipo_comprobante VARCHAR(20),
    serie_comprobante VARCHAR(7),
    num_comprobante VARCHAR(10),
    fecha DATETIME,
    impuesto DECIMAL(4, 2),
    total DECIMAL(11, 2),
    estado VARCHAR(20),
    FOREIGN KEY (idcliente) REFERENCES persona(idpersona),
    FOREIGN KEY (idusuario) REFERENCES usuario(idusuario)
);
'''

DDL_CREATE_DETALLE_VENTA = '''
CREATE TABLE IF NOT EXISTS detalle_venta (
    iddetalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    idventa INT,
    idarticulo INT,
    cantidad INT,
    precio DECIMAL(11, 2),
    descuento DECIMAL(11, 2),
    FOREIGN KEY (idventa) REFERENCES venta(idventa)
);
'''

DDL_CREATE_DETALLE_INGRESO = '''
CREATE TABLE IF NOT EXISTS detalle_ingreso (
    iddetalle_ingreso INT PRIMARY KEY AUTO_INCREMENT,
    idingreso INT,
    idarticulo INT,
    cantidad INT,
    precio DECIMAL(11, 2),
    FOREIGN KEY (idingreso) REFERENCES ingreso(idingreso)
);
'''
# SELECT queries
SELECT_CATEGORIA = "SELECT * FROM categoria;"
SELECT_ARTICULO = "SELECT * FROM articulo;"
SELECT_PERSONA = "SELECT * FROM persona;"
SELECT_ROL = "SELECT * FROM rol;"
SELECT_USUARIO = "SELECT * FROM usuario;"
SELECT_INGRESO = "SELECT * FROM ingreso;"
SELECT_VENTA = "SELECT * FROM venta;"
SELECT_DETALLE_VENTA = "SELECT * FROM detalle_venta;"
SELECT_DETALLE_INGRESO = "SELECT * FROM detalle_ingreso;"
