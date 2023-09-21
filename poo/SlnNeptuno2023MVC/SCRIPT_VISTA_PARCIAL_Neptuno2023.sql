USE Neptuno2023
GO
-- creamos un modelo en asp net mvc con el nombre de:
-- pa_productos_vista_parcial

-- PRODUCTOS Y CATEGORIAS
CREATE OR ALTER PROCEDURE PA_PRODUCTOS_CATEGORIA
@IDCATEGORIA INT
AS
	SELECT P.IdProducto, P.NombreProducto,
			P.PrecioUnidad AS Precio,
			p.UnidadesEnExistencia AS Stock,
			prv.IdProveedor, prv.NombreProveedor
	FROM Productos P INNER JOIN Proveedores Prv
				ON p.IdProveedor = Prv.IdProveedor
	WHERE P.IdCategoria = @IDCATEGORIA
go

EXECUTE PA_PRODUCTOS_CATEGORIA 1
GO
EXEC PA_PRODUCTOS_CATEGORIA 2
GO

-- PRODUCTOS POR RANGO DE PRECIOS
CREATE OR ALTER PROCEDURE PA_PRODUCTOS_PRECIOS
@PRECIO1 INT, @PRECIO2 INT
AS
	SELECT P.IdProducto, P.NombreProducto,
			P.PrecioUnidad AS Precio,
			p.UnidadesEnExistencia AS Stock,
			prv.IdProveedor, prv.NombreProveedor
	FROM Productos P INNER JOIN Proveedores Prv
				ON p.IdProveedor = Prv.IdProveedor
	WHERE P.PrecioUnidad BETWEEN @PRECIO1 AND @PRECIO2
		ORDER BY P.PrecioUnidad
go

EXECUTE PA_PRODUCTOS_PRECIOS 10, 30
GO

-- LISTAR CATEGORIAS
CREATE OR ALTER PROCEDURE PA_CATEGORIAS
AS
	SELECT C.IdCategoria, C.NombreCategoria, 
			C.Descripcion, C.Eliminado
	FROM Categorias C
GO

EXECUTE PA_CATEGORIAS
GO




