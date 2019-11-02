use RestauranteJMG

create view vw_Cliente as
select iIdCliente,vNombreC from Cliente

create view vw_Menu as
select vNombrePlatillo,vDescripcion,vPrecio from Menu

create view vw_Mesa as
select iIdMesa,iRestauranteID,iNumPer from Mesa

create view vw_Mesero as
select iIdMesero,NombreCompleto,iIdMesa from Mesero

create view vw_Restaurante as
select iRestauranteID,Ubicacion from Restaurante


select iIdMesero
from Mesero
where iIdMesa > (select AVG(iIdMesa) from Mesero)

select iIdCliente, iIdMesero
from Cliente inner join Mesero
on Cliente.iIdCliente = Mesero.iIdMesero
where exists(select iIdMesero from Mesero where (iIdMesa)>3)

with MeseroMesa as
(select count(iIdMesa)as MW
from Mesero group by iIdMesa)
SELECT * FROM MeseroMesa
where MeseroMesa.MW > 3








