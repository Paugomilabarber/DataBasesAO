use exercici6;
select a.Marca as Marca, a.Model as Model, a.Capacitat as Capacitat;
select count(a.idAvio), a.Marca as Marca, a.Model as Model, a.Capacitat as Capacitat, v.Numero as NumVol, v.Origen as Origen, v.Desti as Desti, 
v.Sortida as "Hora de Sortida", v.Arribada as "Hora d'arribada"
from Avio as a, Vol as v
where a.idAvio = v.Avio_idAvio and a.Marca like "Airbus%";