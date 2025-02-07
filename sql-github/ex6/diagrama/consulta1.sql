use exercici6;
select p.Nom as Nom, p.Cognoms as Cognoms, p.DNI as DNI, v.NumeroVol as "NumVol", v.Origen as "Origen", v.Desti as Destí, r.Import as "Import"
from Passatger as p, Vol as v, Reserva as r
where p.idPassatger=r.Passatger_idPassatger and v.idVol=r.idVol;
