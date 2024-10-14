
CREATE TABLE Estado_usuario_Subcripcion (
    id_estado BIGINT PRIMARY KEY,
    estado VARCHAR(255),
    pago MONEY
);

CREATE TABLE Usuarios (
    id_usuario BIGINT PRIMARY KEY,
    id_estado BIGINT,
    nombre VARCHAR(255),
    correo NVARCHAR(255),
    clave NVARCHAR(255),
    creado DATETIME,
    FOREIGN KEY (id_estado) REFERENCES Estado_usuario_Subcripcion(id_estado)
);

CREATE TABLE Categorias (
    id_categoria BIGINT PRIMARY KEY,
    nombre VARCHAR(255)
);


CREATE TABLE Productos (
    id_producto BIGINT PRIMARY KEY,
    id_categoria BIGINT,
    nombre NVARCHAR(255),
    descripcion nvarchar(300),
	empresa_tienda nvarchar(250),
    prod_celiaco BIT,
    codigo_barras VARCHAR(255),
    creado DATETIME,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Tiendas (
    id_tienda BIGINT PRIMARY KEY,
    nombre NVARCHAR(255),
    direccion NVARCHAR(255),
    longitud NVARCHAR(50),
    latitud NVARCHAR(50),
    creado DATETIME
);



CREATE TABLE Favoritos (
    id_favoritos BIGINT PRIMARY KEY,
    id_us BIGINT,
    id_prod BIGINT,
    creado DATETIME,
    FOREIGN KEY (id_us) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_prod) REFERENCES Productos(id_producto)
);

CREATE TABLE EscaneoProducto (
    id_escaneo BIGINT PRIMARY KEY,
    id_usuario BIGINT,
    id_producto BIGINT,
    imagen NVARCHAR(255),
    fecha DATETIME,
    es_seguro bit,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE EvaluacionProducto (
    id_evaluacion BIGINT PRIMARY KEY,
    id_usuario BIGINT,
    id_producto BIGINT,
    id_tienda BIGINT,
    rating INT,
    recomendacion nvarchar(250),
    fecha DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_tienda) REFERENCES Tiendas(id_tienda)
);

CREATE TABLE SolicitudProductoTienda (
    id_solicitud BIGINT PRIMARY KEY,
    id_usuario BIGINT,
    tipo_solicitud VARCHAR(20) CHECK (tipo_solicitud in ('Producto', 'Tienda')),
    nombre VARCHAR(255),
    descripcion TEXT,
    img VARCHAR(255),
    fecha DATETIME DEFAULT GETDATE(), 
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE producto_tienda (
    id_producto_tienda BIGINT PRIMARY KEY,
    id_producto BIGINT,
    id_tienda BIGINT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_tienda) REFERENCES Tiendas(id_tienda)
);

