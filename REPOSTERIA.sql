create database REPOSTERIA;
use REPOSTERIA;
SELECT * FROM ComprasPankes;
DROP TABLE IF EXISTS ComprasPankes;


--------------------TABLAS------------------------

CREATE TABLE Pankes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Tipo VARCHAR(50),
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Insertar registros en la tabla Pankes
INSERT INTO Pankes (Nombre, Tipo, Precio, Stock) VALUES
('Panke de Fresa', 'Dulce', 11.99, 35),
('Panke de Blueberry', 'Dulce', 12.49, 45),
('Panke de Almendra', 'Salado', 13.99, 25),
('Panke de Plátano', 'Dulce', 10.49, 50),
('Panke de Avena', 'Salado', 12.99, 30),
('Panke de Coco', 'Dulce', 11.49, 40),
('Panke de Naranja', 'Dulce', 10.99, 55),
('Panke de Limón', 'Dulce', 10.49, 60),
('Panke de Matcha', 'Salado', 14.99, 20),
('Panke de Calabaza', 'Salado', 13.49, 25);

CREATE TABLE MarcasPankes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100)
);

-- Insertar registros en la tabla MarcasPankes
INSERT INTO MarcasPankes (Nombre) VALUES
('Marca C'),
('Marca D'),
('Marca E'),
('Marca F'),
('Marca G'),
('Marca H'),
('Marca I'),
('Marca J'),
('Marca K'),
('Marca L');

CREATE TABLE CategoriasPankes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50)
);

-- Insertar registros en la tabla CategoriasPankes
INSERT INTO CategoriasPankes (Nombre) VALUES
('Merienda'),
('Cena'),
('Snack'),
('Brunch'),
('Comida'),
('Energético'),
('Dieta'),
('Light'),
('Gourmet'),
('Clásico');

CREATE TABLE Empleados3 (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Puesto VARCHAR(50)
);

-- Insertar registros en la tabla Empleados3
INSERT INTO Empleados3 (Nombre, Puesto) VALUES
('Carlos Ramirez', 'Repostero'),
('Ana Martinez', 'Cajera'),
('Luis Hernandez', 'Gerente'),
('Paula Gonzalez', 'Vendedora'),
('Miguel Torres', 'Repostero'),
('Laura Sanchez', 'Cajera'),
('Pedro Gomez', 'Encargado de almacén'),
('Lucia Diaz', 'Vendedora'),
('Fernando Alvarez', 'Repostero'),
('Elena Fernandez', 'Gerente');

CREATE TABLE ProveedoresPankes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(20)
);

-- Insertar registros en la tabla ProveedoresPankes
INSERT INTO ProveedoresPankes (Nombre, Direccion, Telefono) VALUES
('Proveedor C', 'Calle Nueva 321', '555555555'),
('Proveedor D', 'Boulevard Central 987', '444444444'),
('Proveedor E', 'Calle Larga 654', '333333333'),
('Proveedor F', 'Avenida Principal 852', '222222222'),
('Proveedor G', 'Camino Viejo 147', '111111111'),
('Proveedor H', 'Ruta 66', '000000000'),
('Proveedor I', 'Calle Estrecha 369', '999999999'),
('Proveedor J', 'Avenida Ancha 258', '888888888'),
('Proveedor K', 'Camino Nuevo 147', '777777777'),
('Proveedor L', 'Ruta 68', '666666666');

CREATE TABLE ComprasPankes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    PankeID INT,
    ProveedorID INT,
    FechaCompra DATE,
    CantidadComprada INT,
    PrecioTotal DECIMAL(10, 2),
    FOREIGN KEY (PankeID) REFERENCES Pankes(ID),
    FOREIGN KEY (ProveedorID) REFERENCES ProveedoresPankes(ID)
);

-- Insertar registros en la tabla ComprasPankes
INSERT INTO ComprasPankes (PankeID, ProveedorID, FechaCompra, CantidadComprada, PrecioTotal) VALUES
(4, 3, '2024-06-01', 100, 500.00),
(5, 4, '2024-06-05', 200, 1200.00),
(6, 3, '2024-06-10', 150, 750.00),
(7, 5, '2024-06-15', 250, 2000.00),
(8, 4, '2024-06-20', 300, 1500.00);

CREATE TABLE VentasPankes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    PankeID INT,
    EmpleadoID INT,
    FechaVenta DATE,
    CantidadVendida INT,
    FOREIGN KEY (PankeID) REFERENCES Pankes(ID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados3(ID)
);

-- Insertar registros en la tabla VentasPankes
INSERT INTO VentasPankes (PankeID, EmpleadoID, FechaVenta, CantidadVendida) VALUES
(4, 3, '2024-01-03', 15),
(5, 4, '2024-01-04', 25),
(6, 5, '2024-01-05', 10),
(7, 6, '2024-01-06', 20),
(8, 7, '2024-01-07', 18),
(9, 8, '2024-01-08', 22),
(10, 9, '2024-01-09', 30),
(11, 10, '2024-01-10', 12),
(12, 11, '2024-01-11', 25),
(13, 12, '2024-01-12', 14);

CREATE TABLE ComentariosPankes (
    ID INT PRIMARY KEY,
    PankeID INT,
    Comentario TEXT,
    FOREIGN KEY (PankeID) REFERENCES Pankes(ID)
);

INSERT INTO ComentariosPankes (ID, PankeID, Comentario) VALUES
(3, 6, 'Excelente sabor!'),
(4, 7, 'Perfecto para el desayuno.'),
(5, 8, 'Muy saludable.'),
(6, 9, 'Recomendado.'),
(7, 10, 'Ideal para merendar.'),
(8, 11, 'Me encanta!'),
(9, 12, 'Delicioso y nutritivo.'),
(10, 13, 'Muy bueno para los niños.'),
(11, 4, 'Sabor increíble.'),
(12, 5, 'Perfecto para cualquier ocasión.');

CREATE TABLE UbicacionesTiendas (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NombreTienda VARCHAR(100),
    Direccion VARCHAR(200)
);

-- Insertar registros en la tabla UbicacionesTiendas
INSERT INTO UbicacionesTiendas (NombreTienda, Direccion) VALUES
('Tienda Sur', 'Sur 789'),
('Tienda Este', 'Este 101'),
('Tienda Oeste', 'Oeste 202'),
('Tienda Centro 2', 'Centro 345'),
('Tienda Norte 2', 'Norte 567'),
('Tienda Sur 2', 'Sur 890'),
('Tienda Este 2', 'Este 112'),
('Tienda Oeste 2', 'Oeste 223'),
('Tienda Nueva', 'Nueva 334'),
('Tienda Principal', 'Principal 445');


----------------PROCESOS----------------------

CREATE PROCEDURE InsertarPanke
    @Nombre VARCHAR(100),
    @Tipo VARCHAR(50),
    @Precio DECIMAL(10, 2),
    @Stock INT
AS
BEGIN
    INSERT INTO Pankes (Nombre, Tipo, Precio, Stock)
    VALUES (@Nombre, @Tipo, @Precio, @Stock);
END;

CREATE PROCEDURE ActualizarPanke
    @ID INT,
    @Nombre VARCHAR(100),
    @Tipo VARCHAR(50),
    @Precio DECIMAL(10, 2),
    @Stock INT
AS
BEGIN
    UPDATE Pankes
    SET Nombre = @Nombre, Tipo = @Tipo, Precio = @Precio, Stock = @Stock
    WHERE ID = @ID;
END;

CREATE PROCEDURE EliminarPanke
    @ID INT
AS
BEGIN
    DELETE FROM Pankes WHERE ID = @ID;
END;

CREATE PROCEDURE BuscarPankePorID
    @ID INT
AS
BEGIN
    SELECT * FROM Pankes WHERE ID = @ID;
END;

CREATE PROCEDURE ListarPankes
AS
BEGIN
    SELECT * FROM Pankes;
END;

CREATE PROCEDURE InsertarProveedor
    @Nombre VARCHAR(100),
    @Direccion VARCHAR(200),
    @Telefono VARCHAR(20)
AS
BEGIN
    INSERT INTO ProveedoresPankes (Nombre, Direccion, Telefono)
    VALUES (@Nombre, @Direccion, @Telefono);
END;

CREATE PROCEDURE ActualizarProveedor
    @ID INT,
    @Nombre VARCHAR(100),
    @Direccion VARCHAR(200),
    @Telefono VARCHAR(20)
AS
BEGIN
    UPDATE ProveedoresPankes
    SET Nombre = @Nombre, Direccion = @Direccion, Telefono = @Telefono
    WHERE ID = @ID;
END;

CREATE PROCEDURE EliminarProveedor
    @ID INT
AS
BEGIN
    DELETE FROM ProveedoresPankes WHERE ID = @ID;
END;

CREATE PROCEDURE BuscarProveedorPorID
    @ID INT
AS
BEGIN
    SELECT * FROM ProveedoresPankes WHERE ID = @ID;
END;

CREATE PROCEDURE ListarProveedores
AS
BEGIN
    SELECT * FROM ProveedoresPankes;
END;

CREATE PROCEDURE InsertarEmpleado
    @Nombre VARCHAR(100),
    @Puesto VARCHAR(50)
AS
BEGIN
    INSERT INTO Empleados3 (Nombre, Puesto)
    VALUES (@Nombre, @Puesto);
END;

CREATE PROCEDURE ActualizarEmpleado
    @ID INT,
    @Nombre VARCHAR(100),
    @Puesto VARCHAR(50)
AS
BEGIN
    UPDATE Empleados3
    SET Nombre = @Nombre, Puesto = @Puesto
    WHERE ID = @ID;
END;

CREATE PROCEDURE EliminarEmpleado
    @ID INT
AS
BEGIN
    DELETE FROM Empleados3 WHERE ID = @ID;
END;

CREATE PROCEDURE BuscarEmpleadoPorID
    @ID INT
AS
BEGIN
    SELECT * FROM Empleados3 WHERE ID = @ID;
END;

CREATE PROCEDURE ListarEmpleados
AS
BEGIN
    SELECT * FROM Empleados3;
END;

CREATE PROCEDURE BuscarVentasPorFecha
    @FechaVenta DATE
AS
BEGIN
    SELECT * FROM VentasPankes
    WHERE FechaVenta = @FechaVenta;
END;
