--ALGOTP2_F2A_BRIOT_ANTHONY_Creation_Gestion_Assurances.sql

--On crée la table client en premier car elle n'a pas de clé étrangère

create table CLIENT (
					NUMCLIENT int (12) not null,
					NOM char (32) not null,
					ADRESSE char (64) not null,
primary key (NUMCLIENT));

--pour crée un autoincrement sur sqlite (je n'utiliserais pas cette table)

create table CLIENT (
					NUMCLIENT integer primary key AUTOINCREMENT not null,
					NOM char (32) not null,
					ADRESSE char (64) not null;

					
					
					
					
--Puis la table contrat qui fait référence à la table client

create table CONTRAT (
					SIGNATAIRE char (32) not null,
					NUMCTR int (12) not null,
					TYPE char (20),
					DATESIGN date,
primary key (SIGNATAIRE,NUMCTR),
foreign key (SIGNATAIRE) references CLIENT(NOM)
	on delete no action on update cascade);
	
--vehicule fait référence à contrat et client, elle peut être crée	

create table VEHICULE (
					NUMVEH int (12) not null,
					MARQUE char (20),
					MODELE char (20),
					ANNEE date,
					CYLINDREE char (10),
					SIGNATAIRE char (32) not null,
					NUMCTR int (12) not null,
					NUMCLIENT int (12) not null,
primary key (NUMVEH,SIGNATAIRE,NUMCTR),
foreign key (SIGNATAIRE) references CONTRAT
	on delete no action on update cascade,
foreign key (NUMCTR) references CONTRAT
	on delete no action on update cascade,
foreign key (NUMCLIENT) references CLIENT
	on delete no action on update cascade);
	
--on a besoin de la table accident avant de pouvoir crée implication

create table ACCIDENT (
					NUMACC int (12) not null,
					DATEACC date,
					MONTANT[0-1] float (10),
primary key (NUMACC));

--pour finir table implication qui fait référence à vehicule et accident

create table IMPLICATION (
						NUMACC int (12) not null,
						NUMVEH int (12) not null,
primary key (NUMACC,NUMVEH),
foreign key (NUMVEH) references VEHICULE
	on delete no action on update cascade,
foreign key (NUMACC) references ACCIDENT
	on delete no action on update cascade);
									
--creation index

create index XNUM_CLIENT on CLIENT(NUMCLIENT);
create index XNUM_ACC on ACCIDENT(NUMACC);
create index XNUM_CTR on CONTRAT(NUMCTR);					
					