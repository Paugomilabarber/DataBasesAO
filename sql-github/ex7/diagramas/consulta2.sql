use exercici7;
select t.NumFactura as Factura, t.Data as Data, t.HoraVenta as Hora, e.Nom as Empleat, SUM(lt.ImportTotal*p.IVA)
from Tickets as t, Empleat as e, LiniaTicket as lt, Producte as p
where e.idEmpleat = t.Empleat_idEmpleat and t.idTickets=lt.Tickets_idTickets and p.idProducte=lt.Producte_idProducte;
