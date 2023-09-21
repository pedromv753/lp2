use Neptuno2023
go
-- funciones de grupo o agrupamiento
-- min, max, avg, sum , count

-- Pedidos por Codigo de Cliente
--P.FechaPedido,
create or alter procedure pa_pedidos_cliente
@IdCliente char(5)
as
	select P.IdPedido, P.FechaPedido , E.Apellidos, 
		   SUM(DP.PrecioUnidad * DP.Cantidad) as Importe
	from Pedidos P inner join Detalles_Pedidos DP
		on P.IdPedido = DP.IdPedido
			inner join Empleados E
				on P.IdEmpleado = E.IdEmpleado
	where P.IdCliente = @IdCliente
		group by P.IdPedido, P.FechaPedido, E.Apellidos
go

execute pa_pedidos_cliente 'BERGS'
go

create or alter procedure pa_pedidos_cliente_anio
@IdCliente char(5), @anio int
as
	select P.IdPedido, P.FechaPedido , E.Apellidos, 
		   SUM(DP.PrecioUnidad * DP.Cantidad) as Importe
	from Pedidos P inner join Detalles_Pedidos DP
		on P.IdPedido = DP.IdPedido
			inner join Empleados E
				on P.IdEmpleado = E.IdEmpleado
	where P.IdCliente = @IdCliente and 
	      YEAR(P.FechaPedido) = @anio
		group by P.IdPedido, P.FechaPedido, E.Apellidos
go

execute pa_pedidos_cliente_anio 'BERGS', 2021
go

create or alter procedure pa_clientes
as
	select IdCliente, NombreCliente, Telefono, Pais 
	  from Clientes
go

execute pa_clientes
go

pa_clientes
go



