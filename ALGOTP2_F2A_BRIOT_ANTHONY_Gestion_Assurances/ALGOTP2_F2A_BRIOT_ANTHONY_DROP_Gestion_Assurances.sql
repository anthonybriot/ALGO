--	ALGOTP2_F2A_BRIOT_ANTHONY_DROP_Gestion_Assurances.sql
	
--Suppresion des données
--On supprime les données dans le sens inverse que la création des tables afin de ne pas avoir de problème avec les clés étrangères 
delete from IMPLICATION;
delete from ACCIDENT;
delete from VEHICULE;
delete from CONTRAT;
delete from CLIENT;	

--Suppression des index
drop index XNUM_CLIENT;
drop index XNUM_ACC;
drop index XNUM_CONTRAT;
					
--Suppresion des tables	 et index/trigger/contraintes/permissions associées à la table
--on procède dans le même ordre que pour les données, pour les mêmes raisons
drop table IMPLICATION;
drop table ACCIDENT;
drop table VEHICULE;
drop table CONTRAT;
drop table CLIENT;				
					
--Suppresion de la base					
drop DATABASE if exists GESTION_ASSURANCES;	



