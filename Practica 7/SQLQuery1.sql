use RestauranteJMG
select * from Cliente where Cliente.vNombreC like '%a%'  order by iIdCliente
select * from Mesero where Mesero.NombreCompleto like '%b%' order by iIdMesa
select * from Restaurante where Restaurante.Ubicacion like '%g%' order by iRestauranteID
select * from Pedido where Pedido.iIdCliente like 1 order by iIdProducto
select * from Menu where Menu.vNombrePlatillo like '%c%' order by vPrecio
select * from Cliente inner join Mesero on Cliente.iIdCliente=Mesero.iIdMesero
select * from Cliente right join Mesero on Cliente.iIdMesa = Mesero.iIdMesero
select * from Mesa left join Restaurante on Mesa.iIdMesa=Restaurante.iRestauranteID
select * from Ticket full outer join Menu on Ticket.iIdMesa=Menu.iIdProducto
select * from Mesa cross join Pedido

select * from Restaurante

select COUNT(iIdMesa) from Ticket group by iIdMesa having COUNT(*)>5
select COUNT(iRestauranteID) from Mesa group by iRestauranteID having COUNT(*)<10
select COUNT (iIdCliente) as 'Mesas registradas por clientes' from Cliente group by iIdMesa 
select MAX(vPrecio) as 'Precios del mas barato al mas caro' from Menu group by vPrecio
select ms.NombreCompleto, m.iRestauranteID
from dbo.Mesero ms, dbo.Mesa m
where ms.iIdMesa = m.iIdMesa

select p.vDescripcion, c.iIdClienteP
from dbo.Menu p, dbo.Pedido c
where p.iIdProducto = c.iIdProducto

select n.NombreCompleto, i.iNumPer
from dbo.Cliente n, dbo.Mesa i
where n.iIdMesa = i.iIdMesa
