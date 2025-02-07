use exercici6;
select r.NumeroReserva as "Numero de reserva", p.Nom as Nom, p.Cognoms as Cognoms, v.NumeroVol as "Numero de Vol"
from Reserva as r, Passatger as p, Vol as v
where r.Passatger_idPassatger=p.idPassatger and r.Vol_idVol=idVol