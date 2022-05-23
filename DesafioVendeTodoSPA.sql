create table EMPLEADOS(
	id int not null auto_increment primary key,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	fechaNacimiento date,
	direccion varchar(50),
	ciudad varchar(50),
    region varchar(50),
	pais varchar(50),
	telefono varchar (20),
	cargo varchar(50)
);

create table CLIENTES(
	id int not null auto_increment primary key,
	nombre varchar (50) not null,
	nombreContacto varchar (50), 
	email varchar (50),
	direccion varchar (50),
	ciudad varchar (50),
	region varchar (50),
	pais varchar (50),
	codigoPostal int,
	telefono varchar (50)
);

create table DESPACHADORES(
	id int not null auto_increment primary key,
	nombre varchar (50),
	telefono varchar (50),
	nombreContacto varchar (50)
);

create table CATEGORIAS(
	id int not null auto_increment primary key,
	nombreCategoria varchar (50) not null
);

CREATE TABLE PROVEEDORES (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    nombreContacto varchar(50) not null,
    direccion varchar(50),
    ciudad varchar(50),
    region varchar(50),
    telefono varchar(50) not null
);

create table PRODUCTOS(
	id int not null auto_increment primary key,
	categoria_id int not null,
	proveedor_id int not null,
    nombreProducto varchar (50),
	precio int not null,
	stock int check(stock>= 0),
	descontinuado boolean default false,
	foreign key (categoria_id) references CATEGORIAS (id),
	foreign key (proveedor_id) references PROVEEDORES (id)
);

create table ORDENESCOMPRA(
	id int not null auto_increment primary key,
	empleado_id int not null,
	cliente_id int not null,
	fechaRequerimiento date not null,
    totalProductosOC int not null,
    totalDescuentoAplicarOC int not null,
    valorTotalOC int not null,
	foreign key (empleado_id) references EMPLEADOS (id),
	foreign key (cliente_id) references CLIENTES (id)	
);

create table DETALLEENVIO(
    id int not null auto_increment primary key,
    ordenCompra_id int not null,
    despachador_id int not null,
    fechaEnvio date not null,
	nombre varchar (50) not null,
	direccion varchar (50) not null,
	codigoPostal int,
	ciudad varchar (50) not null,
	region varchar (50) not null,
	pais varchar (50) not null,
	viaEnvio varchar (50) not null,
    foreign key (ordenCompra_id) references ORDENESCOMPRA (id),
    foreign key (despachador_id) references DESPACHADORES (id)
);

create table DETALLEORDENESCOMPRA(
	id int not null auto_increment primary key,
	ordenCompra_id int not null,
	producto_id int not null,
	cantidadProductoSolicitado int not null,
	foreign key (ordenCompra_id) references ORDENESCOMPRA (id),
	foreign key (producto_id) references PRODUCTOS (id)
);

-- 3. Realizar 5 inserciones a cada tabla, para ejecutar consultas sobre el modelo.

insert into EMPLEADOS (nombre, apellido, fechaNacimiento, direccion, ciudad, region, pais, telefono, cargo)
value ('nombreEmpleado01', 'apellidoEmpleado01', '1971-01-01', 'direccionEmpleado01', 'ciudadEmpleado01', 'regionEmpleado01','paisEmpleado01', 'telefonoEmpleado01', 'cargoEmpleado01')
;

insert into EMPLEADOS (nombre, apellido, fechaNacimiento, direccion, ciudad, region, pais, telefono, cargo)
value ('nombreEmpleado02', 'apellidoEmpleado02', '1972-01-01', 'direccionEmpleado02', 'ciudadEmpleado02', 'regionEmpleado02','paisEmpleado02', 'telefonoEmpleado02', 'cargoEmpleado02')
;

insert into EMPLEADOS (nombre, apellido, fechaNacimiento, direccion, ciudad, region, pais, telefono, cargo)
value ('nombreEmpleado03', 'apellidoEmpleado03', '1973-01-01', 'direccionEmpleado03', 'ciudadEmpleado03', 'regionEmpleado03','paisEmpleado03', 'telefonoEmpleado03', 'cargoEmpleado03')
;

insert into EMPLEADOS (nombre, apellido, fechaNacimiento, direccion, ciudad, region, pais, telefono, cargo)
value ('nombreEmpleado04', 'apellidoEmpleado04', '1974-01-01', 'direccionEmpleado04', 'ciudadEmpleado04', 'regionEmpleado04','paisEmpleado04', 'telefonoEmpleado04', 'cargoEmpleado04')
;

insert into EMPLEADOS (nombre, apellido, fechaNacimiento, direccion, ciudad, region, pais, telefono, cargo)
value ('nombreEmpleado05', 'apellidoEmpleado05', '1975-01-01', 'direccionEmpleado05', 'ciudadEmpleado05', 'regionEmpleado05','paisEmpleado05', 'telefonoEmpleado05', 'cargoEmpleado05')
;

select * from EMPLEADOS;


insert into CLIENTES (nombre, nombreContacto, email, direccion, ciudad, region, pais, codigoPostal, telefono)
value ('nombreCliente01', 'nombreContacto01', 'emailCliente01', 'direccionCliente01', 'Concepción', 'regionCliente01','paisCliente01', '1','telefonoCliente01')
;

insert into CLIENTES (nombre, nombreContacto, email, direccion, ciudad, region, pais, codigoPostal, telefono)
value ('nombreCliente02', 'nombreContacto02', 'emailCliente02', 'direccionCliente02', 'Concepción', 'regionCliente02','paisCliente02', '2','telefonoCliente02')
;

insert into CLIENTES (nombre, nombreContacto, email, direccion, ciudad, region, pais, codigoPostal, telefono)
value ('nombreCliente03', 'nombreContacto03', 'emailCliente03', 'direccionCliente03', 'Santiago', 'regionCliente03','paisCliente03', '3','telefonoCliente03')
;

insert into CLIENTES (nombre, nombreContacto, email, direccion, ciudad, region, pais, codigoPostal, telefono)
value ('nombreCliente04', 'nombreContacto04', 'emailCliente04', 'direccionCliente04', 'Santiago', 'regionCliente04','paisCliente04', '4','telefonoCliente04')
;

insert into CLIENTES (nombre, nombreContacto, email, direccion, ciudad, region, pais, codigoPostal, telefono)
value ('nombreCliente05', 'nombreContacto05', 'emailCliente05', 'direccionCliente04', 'Concepción', 'regionCliente05','paisCliente05', '5','telefonoCliente05')
;

select * from CLIENTES;


insert into DESPACHADORES (nombre, telefono, nombreContacto)
value ('nombreDespachador01', 'telefonoDespachador01', 'nombreContacto01')
;

insert into DESPACHADORES (nombre, telefono, nombreContacto)
value ('nombreDespachador02', 'telefonoDespachador02', 'nombreContacto02')
;

insert into DESPACHADORES (nombre, telefono, nombreContacto)
value ('nombreDespachador03', 'telefonoDespachador03', 'nombreContacto03')
;

insert into DESPACHADORES (nombre, telefono, nombreContacto)
value ('nombreDespachador04', 'telefonoDespachador04', 'nombreContacto04')
;

insert into DESPACHADORES (nombre, telefono, nombreContacto)
value ('nombreDespachador05', 'telefonoDespachador05', 'nombreContacto05')
;

select * from DESPACHADORES;


insert into CATEGORIAS (nombreCategoria)
value ('nombreCategoria01')
;

insert into CATEGORIAS (nombreCategoria)
value ('nombreCategoria02')
;

insert into CATEGORIAS (nombreCategoria)
value ('nombreCategoria03')
;

insert into CATEGORIAS (nombreCategoria)
value ('nombreCategoria04')
;

insert into CATEGORIAS (nombreCategoria)
value ('nombreCategoria05')
;

select * from CATEGORIAS;


insert into PROVEEDORES (nombre, nombreContacto, direccion, ciudad, region, telefono)
value ('nombreProveedor01', 'nombreContactoProveedor01', 'direccionProveedor01', 'ciudadProveedor01', 'regionProveedor01', 'telefonoProveedor01')
;

insert into PROVEEDORES (nombre, nombreContacto, direccion, ciudad, region, telefono)
value ('nombreProveedor02', 'nombreContactoProveedor02', 'direccionProveedor02', 'ciudadProveedor02', 'regionProveedor02', 'telefonoProveedor02')
;

insert into PROVEEDORES (nombre, nombreContacto, direccion, ciudad, region, telefono)
value ('nombreProveedor03', 'nombreContactoProveedor03', 'direccionProveedor03', 'ciudadProveedor03', 'regionProveedor03', 'telefonoProveedor03')
;

insert into PROVEEDORES (nombre, nombreContacto, direccion, ciudad, region, telefono)
value ('nombreProveedor04', 'nombreContactoProveedor04', 'direccionProveedor04', 'ciudadProveedor04', 'regionProveedor04', 'telefonoProveedor04')
;

insert into PROVEEDORES (nombre, nombreContacto, direccion, ciudad, region, telefono)
value ('nombreProveedor05', 'nombreContactoProveedor05', 'direccionProveedor05', 'ciudadProveedor05', 'regionProveedor05', 'telefonoProveedor05')
;

select * from PROVEEDORES;


insert into PRODUCTOS (categoria_id, proveedor_id, nombreProducto, precio, stock, descontinuado)
value (1, 1, 'nombreProducto01', '1000', '10', false)
;

insert into PRODUCTOS (categoria_id, proveedor_id, nombreProducto, precio, stock, descontinuado)
value (2, 2, 'nombreProducto02', '2000', '20', false)
;

insert into PRODUCTOS (categoria_id, proveedor_id, nombreProducto, precio, stock, descontinuado)
value (3, 3, 'nombreProducto03', '3000', '30', false)
;

insert into PRODUCTOS (categoria_id, proveedor_id, nombreProducto, precio, stock, descontinuado)
value (4, 4, 'nombreProducto04', '4000', '40', false)
;

insert into PRODUCTOS (categoria_id, proveedor_id, nombreProducto, precio, stock, descontinuado)
value (5, 5, 'nombreProducto05', '5000', '0', true)
;

select * from PRODUCTOS;


insert into ORDENESCOMPRA (empleado_id, cliente_id, fechaRequerimiento, totalProductosOC, totalDescuentoAplicarOC, valorTotalOC)
value (1, 1, '2022-02-12', 5, 0, 7000)
;

insert into ORDENESCOMPRA (empleado_id, cliente_id, fechaRequerimiento, totalProductosOC, totalDescuentoAplicarOC, valorTotalOC)
value (2, 1, '2022-02-13', 2, 500, 4500)
;

insert into ORDENESCOMPRA (empleado_id, cliente_id, fechaRequerimiento, totalProductosOC, totalDescuentoAplicarOC, valorTotalOC)
value (3, 2, '2022-02-14', 2, 1000, 5000)
;

insert into ORDENESCOMPRA (empleado_id, cliente_id, fechaRequerimiento, totalProductosOC, totalDescuentoAplicarOC, valorTotalOC)
value (1, 5, '2022-02-14', 4, 0, 13000)
;

insert into ORDENESCOMPRA (empleado_id, cliente_id, fechaRequerimiento, totalProductosOC, totalDescuentoAplicarOC, valorTotalOC)
value (1, 5, '2022-02-15', 3, 1000, 9000)
;

select * from ORDENESCOMPRA;


insert into DETALLEENVIO (ordenCompra_id, despachador_id, fechaEnvio, nombre, direccion, codigoPostal,ciudad,region,pais,viaEnvio)
value (1, 1, '2022-02-16', 'nombreEnvio01', 'direccionEnvio01',1, 'Concepcion','BioBio', 'Chile', 'Delivery')
;

insert into DETALLEENVIO (ordenCompra_id, despachador_id, fechaEnvio, nombre, direccion, codigoPostal,ciudad,region,pais,viaEnvio)
value (2, 1, '2022-02-16', 'nombreEnvio02', 'direccionEnvio02',1, 'Concepcion','BioBio', 'Chile', 'Delivery')
;

insert into DETALLEENVIO (ordenCompra_id, despachador_id, fechaEnvio, nombre, direccion, codigoPostal,ciudad,region,pais,viaEnvio)
value (3, 1, '2022-02-16', 'nombreEnvio03', 'direccionEnvio03',1, 'Santiago','Metropolitana', 'Chile', 'Chilexpress')
;

insert into DETALLEENVIO (ordenCompra_id, despachador_id, fechaEnvio, nombre, direccion, codigoPostal,ciudad,region,pais,viaEnvio)
value (4, 1, '2022-02-17', 'nombreEnvio04', 'direccionEnvio04',1, 'Santiago','Metropolitana', 'Chile', 'Chilexpress')
;

insert into DETALLEENVIO (ordenCompra_id, despachador_id, fechaEnvio, nombre, direccion, codigoPostal,ciudad,region,pais,viaEnvio)
value (5, 1, '2022-02-17', 'nombreEnvio05', 'direccionEnvio05',1, 'Concepcion','BioBio', 'Chile', 'Delivery')
;

select * from DETALLEENVIO;


insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (1, 1, 3)
;
update PRODUCTOS set stock = stock - 3 where id = 1;


insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (1, 2, 2)
;
update PRODUCTOS set stock = stock - 2 where id = 2;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (2, 1, 1)
;
update PRODUCTOS set stock = stock - 1 where id = 1;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (2, 4, 1)
;
update PRODUCTOS set stock = stock - 1 where id = 4;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (3, 3, 2)
;
update PRODUCTOS set stock = stock - 2 where id = 3;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (4, 4, 2)
;
update PRODUCTOS set stock = stock - 2 where id = 4;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (4, 3, 1)
;
update PRODUCTOS set stock = stock - 1 where id = 3;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (4, 2, 1)
;
update PRODUCTOS set stock = stock - 1 where id = 2;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (5, 4, 2)
;
update PRODUCTOS set stock = stock - 2 where id = 4;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (5, 2, 1)
;
update PRODUCTOS set stock = stock - 1 where id = 2;

insert into DETALLEORDENESCOMPRA (ordenCompra_id, producto_id, cantidadProductoSolicitado)
value (5, 2, 1)
;
update PRODUCTOS set stock = stock - 1 where id = 2;


-- Revisión de tablas para responder la primera consulta
select * from CLIENTES;
select * from ORDENESCOMPRA;
select * from DETALLEORDENESCOMPRA;

-- 4. Formular y ejecutar las consultas que correspondan, para obtener la siguiente información:
-- a. Determinar cuál o cuáles son los clientes con las compras más altas y a qué
-- ciudad corresponden los mismos. Esto permitirá en un futuro que VendeTodo
-- SPA pueda buscar convenios con algunas empresas despachadoras.

select CLIENTES.nombre as nombre_cliente, 
	   CLIENTES.ciudad as ciudad_cliente
from CLIENTES
where CLIENTES.id in (
	select ORDENESCOMPRA.cliente_id
    from ORDENESCOMPRA
    where ORDENESCOMPRA.valorTotalOC in (
		select max(ORDENESCOMPRA.valorTotalOC)
        from ORDENESCOMPRA
        )
);


-- Revisión de tablas para responder la segunda consulta
select * from PROVEEDORES;
select * from PRODUCTOS;
select * from DETALLEORDENESCOMPRA;

-- b. Se necesita saber los nombre de los distribuidores de los productos más
-- vendidos, esto permitirá evaluar comprar por volumen. Solo es necesario que
-- se listen los nombres de todos los registros que cumplan con la solicitud.

select PROVEEDORES.nombre as Nombre_Proveedor,
	PRODUCTOS.id as ID_Producto, 
    PRODUCTOS.nombreProducto as Nombre_Producto, 
	sum(DETALLEORDENESCOMPRA.cantidadProductoSolicitado) as Cantidad_Productos_Vendidos 
from DETALLEORDENESCOMPRA
inner join PRODUCTOS on PRODUCTOS.id = DETALLEORDENESCOMPRA.producto_id
inner join PROVEEDORES on PROVEEDORES.id = PRODUCTOS.proveedor_id
group by DETALLEORDENESCOMPRA.producto_id, PROVEEDORES.nombre
order by Cantidad_Productos_Vendidos desc
;
