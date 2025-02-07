use exercici7;
select count(lt.IdLiniaTicket) as "Numero de Linies de Tickets" 
from LiniaTicket as lt, Empleat as e, Tickets as t;
where t.Empleat_idEmpleat=e.idEmpleat and t.idTickets=lt.Ticket_idTicket and e.Nom like "J%";