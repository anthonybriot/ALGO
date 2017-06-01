--ALGOTP2_F2A_BRIOT_ANTHONY_Requêtes_Gestion_Assurances.sql


--Les véhicules impliquées dans l'accident 322
select V.MARQUE, V.MODELE, I.NUMACC
from VEHICULE V, IMPLICATION I
where V.NUMVEH=I.NUMVEH and I.NUMACC=322
--Clients par nom
select NUMCLIENT, NOM, ADRESSE
from CLIENT
order by (NOM) asc
--Les accidents ayant eu lieu en 2009
select NUMACC, DATEACC, MONTANT
from ACCIDENT
where strftime('%Y',DATEACC) = '2009'



--je n'ai pas eu le temps de finir, j'aurais souhaité faire des requêtes qui permettent de montrer les possibilités de lecture de données grâce aux clé étrangères
--aux seins des tables, et de tester les requêtes suivantes : 

--Numéro véhicule des accidents de 2009
--SIGNATAIRE ayant signé un contrat du même TYPE
--CLIENT possdant le meme MODELE ou la meme MARQUE de VEHICULE

