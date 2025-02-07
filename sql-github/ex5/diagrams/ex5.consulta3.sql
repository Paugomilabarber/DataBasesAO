use exercici5;
select *
from Cita, Clients, Treballador, Vehicle
where Clients_idClients=Vehicle.Clients_idClients and Vehicle.idVehicle=Cita.Vehicle_idVehicle and Treballador_idTreballador=Cita.Treballador_idTreballador;
