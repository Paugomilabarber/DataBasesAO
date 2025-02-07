use exercici4;
SELECT Client.DNI as "DNI", Client.Nom as "Nom", Client.Cognoms as "Cognoms", Polissa.NumPolissa as "Número de la Pòlissa", TipusPolissa.Nom as "Tipus Pòlissa contractada"
From Client, Polissa, TipusPolissa
where Client.idClient=Polissa.Client_idClient and TipusPolissa_idTipusPolissa=Polissa.TipusPolissa_idTipusPolissa and TipusPolissa.Nom like "%Pe%"
