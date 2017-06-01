--ALGOTP2_F2A_BRIOT_ANTHONY_Insertion_Gestion_Assurances.sql


--un CLIENT signe de 0-N CONTRAT
--un CONTRAT est signé par 1 CLIENT

--un VEHICULE appartient à 1 CLIENT
--un CLIENT possède de 0-N VEHICULE

--un CONTRAT couvre 0-1 VEHICULE
--un VEHICULE est couvert par 1 CONTRAT

--un VEHICULE implique 0-N ACCIDENT
--un ACCIDENT implique 0-N VEHICULE

--Insertion de données dans la table CLIENT
insert into CLIENT(NUMCLIENT,NOM,ADRESSE)
values
('001','BRIOT','6 impasse fleckenstein'),
('002','BURCKEL','7 rue du Vignoble'),
('003','BRIOT','3 rue du Riesling'),
('004','JUNG','4 rue du Vignoble'),
('005','LEHE','3 rue du Sable');


--Insertion de données de la table CONTRAT, dont la colonne SIGNATAIRE fait référence à NOM de CLIENT
insert into CONTRAT(SIGNATAIRE,NUMCTR,TYPE,DATESIGN)
values
('BRIOT','111','TYPE1','01-02-2000'),
('BRIOT','112','TYPE2','06-02-2004'),
('BURCKEL','113','TYPE2','09-02-2006'),
('JUNG','114','TYPE3','12-03-2001'),
('LEHE','115','TYPE1','06-04-1987');

--Il est possible de faire l'insertion ci-dessous, mais il n'est pas possible d'entrer les valeurs qui ne proviennent pas d'une autre table dans la même requête

insert into CONTRAT (SIGNATAIRE)
select NOM
from CLIENT

--Insertion de données de la table VEHICULE
insert into VEHICULE(NUMVEH, MARQUE, MODELE, ANNEE, CYLINDREE, SIGNATAIRE, NUMCTR, NUMCLIENT)
values
('201', 'RENAULT', 'CLIO', '1987', '7CV', 'LEHE', '115', '005'),
('202', 'RENAULT', 'TWINGO', '2001', '9CV', 'JUNG', '114', '004'),
('203', 'OPEL', 'ZAFIRA', '2004', '12CV', 'BRIOT', '112', '001'),
('204', 'OPEL', 'CORSA', '2000', '15CV', 'BRIOT', '111', '001'),
('205', 'RENAULT', 'KANGOO', '2006', '8CV', 'JUNG', '113', '002');

--Insertion de données de la table ACCIDENT
insert into ACCIDENT(NUMACC, DATEACC, MONTANT)
values
('321','22-02-2009','1000'),
('322','17-03-2009','2000'),
('323','12-04-2007','4000'),
('324','02-05-2009','0'),
('325','06-06-2010','50');

--Insertion de données de la table IMPLICATION
insert into IMPLICATION (NUMACC, NUMVEH)
values
('322','204'),
('325','203'),
('325','204'),
('322','202'),
('322','201');




