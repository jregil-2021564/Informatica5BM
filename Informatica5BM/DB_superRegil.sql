-- drop database if exists DB_supermercadoRegil;
create database DB_supermercadoRegil;
use DB_supermercadoRegil;

create table Proveedores (
    idProveedor int auto_increment,
    nombreProveedor varchar(100) not null,
    contactoProveedor varchar(100),
    telefonoProveedor varchar(15),
    emailProveedor varchar(100),
    constraint pk_Proveedores primary key (idProveedor)
);

create table Productos (
    idProducto int auto_increment,
    nombreProducto varchar(100) not null,
    precioProducto decimal(10,2) not null,
    stockProducto int not null,
    idProveedor int not null,
    tipoProducto varchar(50), -- En lugar de categoría
    constraint pk_Productos primary key (idProducto),
    constraint fk_Productos_Proveedores foreign key (idProveedor)
        references Proveedores(idProveedor)
);

Delimiter //
create procedure sp_AgregarProveedor(
    in nomProv varchar(100),
    in contProv varchar(100),
    in telProv varchar(15),
    in emailProv varchar(100)
)
begin
    insert into Proveedores(nombreProveedor, contactoProveedor, telefonoProveedor, emailProveedor)
    values(nomProv, contProv, telProv, emailProv);
end//
Delimiter ;
call sp_AgregarProveedor('Lácteos del Norte', 'Juan Pérez', '555-1234', 'juan@lacteosnorte.com');
call sp_AgregarProveedor('Bebidas Refrescantes SA', 'María López', '555-5678', 'maria@bebidasrefrescantes.com');
call sp_AgregarProveedor('Productos de Limpieza Clean', 'Carlos Rodríguez', '555-9012', 'carlos@clean.com');
call sp_AgregarProveedor('Carnicería Premium', 'Ana Martínez', '555-3456', 'ana@carnepremium.com');
call sp_AgregarProveedor('Verduras Frescas del Campo', 'Pedro González', '555-7890', 'pedro@verdurasfrescas.com');
call sp_AgregarProveedor('Frutas Tropicales', 'Laura Sánchez', '555-2345', 'laura@frutastropicales.com');
call sp_AgregarProveedor('Panadería Artesanal', 'Miguel Torres', '555-6789', 'miguel@panartesanal.com');
call sp_AgregarProveedor('Snacks Deliciosos', 'Sofía Ramírez', '555-0123', 'sofia@snacksdeliciosos.com');
call sp_AgregarProveedor('Cereales Naturales', 'Diego Herrera', '555-4567', 'diego@cerealesnaturales.com');
call sp_AgregarProveedor('Congelados Express', 'Elena Castro', '555-8901', 'elena@congeladosexpress.com');

Delimiter //
create procedure sp_EditarProveedor(
    in idProv int,
    in nomProv varchar(100),
    in contProv varchar(100),
    in telProv varchar(15),
    in emailProv varchar(100)
)
begin
    update Proveedores
    set nombreProveedor = nomProv,
        contactoProveedor = contProv,
        telefonoProveedor = telProv,
        emailProveedor = emailProv
    where idProveedor = idProv;
end//
Delimiter ;
call sp_EditarProveedor('Lácteos del Norte', 'Juan Pérez', '555-1234', 'juan@lacteosnorte.com')

Delimiter //
create procedure sp_EliminarProveedor(
    in idProv int
)
begin
    delete from Proveedores
    where idProveedor = idProv;
end//
Delimiter ;
-- call sp_EliminarProveedor(6);

Delimiter //
create procedure sp_BuscarProveedor(
    in idProv int
)
begin
    select * from Proveedores
    where idProveedor = idProv;
end//
Delimiter ;
call sp_BuscarProveedor(3);

Delimiter //
create procedure sp_ListarProveedores()
begin
    select * from Proveedores;
end//
Delimiter ;
call sp_ListarProveedores();

Delimiter //
create procedure sp_AgregarProducto(
    in nomPro varchar(100),
    in prePro decimal(10,2),
    in stockPro int,
    in idProv int,
    in tipoPro varchar(50)
)
begin
    insert into Productos(nombreProducto, precioProducto, stockProducto, idProveedor, tipoProducto)
    values(nomPro, prePro, stockPro, idProv, tipoPro);
end//
Delimiter ;

call sp_AgregarProducto('Leche Entera Premium', 12.50, 100, 1, 'Lácteo');
call sp_AgregarProducto('Queso Mozzarella Artesanal', 42.00, 50, 1, 'Lácteo');
call sp_AgregarProducto('Refresco Cola Original', 9.75, 200, 2, 'Bebida');
call sp_AgregarProducto('Agua Mineral Natural', 6.50, 300, 2, 'Bebida');
call sp_AgregarProducto('Detergente Líquido Concentrado', 28.00, 150, 3, 'Limpieza');
call sp_AgregarProducto('Pollo Orgánico Entero', 55.00, 80, 4, 'Carne');
call sp_AgregarProducto('Tomate Cherry Orgánico', 9.00, 120, 5, 'Verdura');
call sp_AgregarProducto('Manzana Gala Premium', 15.00, 90, 6, 'Fruta');
call sp_AgregarProducto('Pan Integral Artesanal', 18.00, 70, 7, 'Panadería');
call sp_AgregarProducto('Papas Fritas Naturales', 8.50, 200, 8, 'Snack');
call sp_AgregarProducto('Cereal de Avena con Miel', 22.00, 40, 9, 'Cereal');
call sp_AgregarProducto('Medallones de Pollo Orgánico', 25.00, 30, 10, 'Congelado');

Delimiter //
create procedure sp_EditarProducto(
    in idProd int,
    in nomPro varchar(100),
    in prePro decimal(10,2),
    in stockPro int,
    in idProv int,
    in tipoPro varchar(50)
)
begin
    update Productos
    set nombreProducto = nomPro,
        precioProducto = prePro,
        stockProducto = stockPro,
        idProveedor = idProv,
        tipoProducto = tipoPro
    where idProducto = idProd;
end//
Delimiter ;
call sp_EditarProducto(1,'Leche Entera Premium', 12.50, 100, 1, 'Lácteo');

Delimiter //
create procedure sp_EliminarProducto(
    in idProd int
)
begin
    delete from Productos
    where idProducto = idProd;
end//
Delimiter ;
-- call sp_EliminarProducto(2);

Delimiter //
create procedure sp_BuscarProducto(
    in idProd int
)
begin
    select p.idProducto,
           p.nombreProducto,
           p.precioProducto,
           p.stockProducto,
           p.tipoProducto,
           pr.nombreProveedor,
           pr.contactoProveedor
    from Productos p
    inner join Proveedores pr on p.idProveedor = pr.idProveedor
    where p.idProducto = idProd;
end//
Delimiter ;
call sp_BuscarProducto(5);

Delimiter //
create procedure sp_ListarProductos()
begin
    select p.*, pr.nombreProveedor, pr.contactoProveedor
    from Productos p
    inner join Proveedores pr on p.idProveedor = pr.idProveedor;
end//
Delimiter ;
call sp_ListarProductos();



