-- Création des tables
-- Création de la table Match
CREATE TABLE IF NOT EXISTS P01_Rencontre (
    Match_Id SERIAL PRIMARY KEY,
    Date_Match DATE NOT NULL,
    Lieu VARCHAR(200) NOT NULL,
    Equipe1 VARCHAR(100) NOT NULL,
    Equipe2 VARCHAR(100) NOT NULL,
    Score1 INT NOT NULL,
    Score2 INT NOT NULL,
    Tour VARCHAR(20) NOT NULL
);
-- Création de la table Equipe
CREATE TABLE IF NOT EXISTS P01_Equipe (
    Equipe_Id SERIAL PRIMARY KEY,
    Equipe_Nom VARCHAR(100) NOT NULL,
    Nb_Victoire INT NOT NULL,
    Nb_MatchNul INT NOT NULL,
    Nb_Defaite INT NOT NULL,
    Essai INT NOT NULL,
    Penalite INT NOT NULL,
    Transformation INT NOT NULL,
    Nb_Drop INT NOT NULL,
    Bonus_Defensif INT NOT NULL,
    Bonus_Offensif INT
);
-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS P01_Joueur (
    Joueur_Id SERIAL PRIMARY KEY,
    Joueur_Nom VARCHAR(200) NOT NULL,
    Joueur_Prenom VARCHAR(200) NOT NULL,
    Numero_Maillot INT NOT NULL,
    Poste VARCHAR(30),
    Equipe_Id INT NOT NULL,
    FOREIGN KEY (Equipe_Id) REFERENCES P01_Equipe(Equipe_Id)
);
-- Création de la table MatchJoueurStat
CREATE TABLE IF NOT EXISTS P01_MatchJoueurStat (
    Match_Id INT NOT NULL,
    Joueur_Id INT NOT NULL,
    Poste VARCHAR(20) NOT NULL,
    Numero_Maillot VARCHAR(10) NOT NULL,
    Essai INT DEFAULT 0,
    Penalite INT DEFAULT 0,
    Transformation INT DEFAULT 0,
    Nb_Drop INT DEFAULT 0,
    FOREIGN KEY (Match_Id) REFERENCES P01_Rencontre(Match_Id),
    FOREIGN KEY (Joueur_Id) REFERENCES P01_Joueur(Joueur_Id),
    PRIMARY KEY (Match_Id,Joueur_Id)
);
-- Création de la table Oppose
CREATE TABLE IF NOT EXISTS P01_Oppose (
    Match_Id INT NOT NULL,
    Equipe_Id INT NOT NULL,
    FOREIGN KEY (Match_Id) REFERENCES P01_Rencontre(Match_Id),
    FOREIGN KEY (Equipe_Id) REFERENCES P01_Equipe(Equipe_Id),
    PRIMARY KEY (Match_Id,Equipe_Id)
);
-- Création de la table Appartient
CREATE TABLE IF NOT EXISTS P01_Appartient (
    Equipe_Id INT NOT NULL,
    Joueur_Id INT NOT NULL,
    FOREIGN KEY (Equipe_Id) REFERENCES P01_Equipe(Equipe_Id),
    FOREIGN KEY (Joueur_Id) REFERENCES P01_Joueur(Joueur_Id),
    PRIMARY KEY (Equipe_Id,Joueur_Id)
);

-- Alimentation des tables :
-- Matchs de poules pour la Poule A
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-09-08','Stade de France, Saint-Denis','France','New Zealand',27,13,'Poule A'),
           ('2023-09-09','Stade Geoffroy-Guichard,Saint-Étienne','Italy','Namibia',52,8,'Poule A'),
           ('2023-09-14','Stade Pierre-Mauroy, Lille','France','Uruguay',27,12,'Poule A'),
           ('2023-09-15','Stadium de Toulouse, Toulouse','New Zealand','Namibia',71,3,'Poule A'),
           ('2023-09-20','Stade de Nice, Nice','Italy','Uruguay',38,17,'Poule A'),
           ('2023-09-21','Stade de Marseille, Marseille','France','Namibia',96,0,'Poule A'),
           ('2023-09-27','OL Stadium, Lyon','Uruguay','Namibia',36,26,'Poule A'),
           ('2023-09-29','OL Stadium, Lyon','New Zealand','Italy',96,17,'Poule A'),
           ('2023-10-05','OL Stadium, Lyon','New Zealand','Uruguay',73,0,'Poule A'),
           ('2023-10-06','OL Stadium, Lyon','France','Italy',60,7,'Poule A');

-- Matchs de poules pour la Poule B
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-09-09','Stade de Bordeaux, Bordeaux','Ireland','Romania',82,8,'Poule B'),
           ('2023-09-10','Stade de Marseille, Marseille','South Africa','Scotland',18,3,'Poule B'),
           ('2023-09-16','Stade de la Beaujoire, Nantes','Ireland','Tonga',59,16,'Poule B'),
           ('2023-09-17','Stade de Bordeaux, Bordeaux','South Africa','Romania',76,0,'Poule B'),
           ('2023-09-23','Stade de France, Saint-Denis','South Africa','Ireland',8,13,'Poule B'),
           ('2023-09-24','Stade de Nice, Nice','Scotland','Tonga',45,17,'Poule B'),
           ('2023-09-30','Stade Pierre-Mauroy, Lille','Scotland','Romania',84,0,'Poule B'),
           ('2023-10-01','Stade de Marseille, Marseille','South Africa','Tonga',49,18,'Poule B'),
           ('2023-10-07','Stade de France, Saint-Denis','Ireland','Scotland',36,14,'Poule B'),
           ('2023-10-08','Stade Pierre-Mauroy, Lille','Tonga','Romania',45,24,'Poule B');

-- Matchs de poules pour la Poule C
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-09-09','Stade de France, Saint-Denis','Australia','Georgia',35,15,'Poule C'),
           ('2023-09-10','Stade de Bordeaux, Bordeaux','Wales','Fiji',32,26,'Poule C'),
           ('2023-09-16','Stade de Nice, Nice','Wales','Portugal',28,8,'Poule C'),
           ('2023-09-17','Stade Geoffroy-Guichard, Saint-Étienne','Australia','Fiji',15,22,'Poule C'),
           ('2023-09-23','Stadium de Toulouse, Toulouse','Georgia','Portugal',18,18,'Poule C'),
           ('2023-09-24','OL Stadium, Lyon','Wales','Australia',40,6,'Poule C'),
           ('2023-09-30','Stade de Bordeaux, Bordeaux','Fiji','Georgia',17,12,'Poule C'),
           ('2023-10-01','Stade Geoffroy-Guichard, Saint-Étienne','Australia','Portugal',34,14,'Poule C'),
           ('2023-10-07','Stade de la Beaujoire, Nantes','Wales','Georgia',43,19,'Poule C'),
           ('2023-10-08','Stadium de Toulouse, Toulouse','Fiji','Portugal',23,24,'Poule C');

-- Matchs de poules pour la Poule D
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-09-09','Stade de Marseille, Marseille','England','Argentina',27,10,'Poule D'),
           ('2023-09-10','Stadium de Toulouse, Toulouse','Japan','Chile',42,12,'Poule D'),
           ('2023-09-16','Stade de Bordeaux, Bordeaux','Samoa','Chile',43,10,'Poule D'),
           ('2023-09-17','Stade de Nice, Nice','England','Japan',34,12,'Poule D'),
           ('2023-09-22','Stade Geoffroy-Guichard, Saint-Étienne','Argentina','Samoa',19,10,'Poule D'),
           ('2023-09-23','Stade Pierre-Mauroy, Lille','England','Chile',71,0,'Poule D'),
           ('2023-09-28','Stadium de Toulouse, Toulouse','Japan','Samao',28,22,'Poule D'),
           ('2023-09-30','Stade de la Beaujoire, Nantes','Argentina','Chile',59,5,'Poule D'),
           ('2023-10-07','Stade Pierre-Mauroy, Lille','England','Samoa',18,17,'Poule D'),
           ('2023-10-08','Stade de la Beaujoire, Nantes','Japan','Argentina',27,39,'Poule D');

-- Matchs pour : quarts de finale
    INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-10-14','Stade de Marseille, Marseille','Wales','Argentina',17,29,'Quart de finale'),
           ('2023-10-14','Stade de France, Saint-Denis','Ireland','New Zealand',24,28,'Quart de finale'),
           ('2023-10-15','Stade de Marseille, Marseille','England','Fiji',30,24,'Quart de finale'),
           ('2023-10-15','Stade de France, Saint-Denis','France','South Africa',28,29,'Quart de finale');

-- Matchs pour : demi finales
    INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-10-20','Stade de France, Saint-Denis','Argentina','New Zealand',6,44,'Demi finale'),
           ('2023-10-21','Stade de France, Saint-Denis','England','South Africa',15,16,'Demi finale');

-- Matchs pour : Bronze finale
    INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-10-27','Stade de France, Saint-Denis','Argentina','England',23,26,'Bronze finale');

-- Matchs de poules pour : La finale
    INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES ('2023-10-27','Stade de France, Saint-Denis','New Zealand','South Africa',11,22,'Finale');

INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES ('France',4, 0,1,30,10,26,2,0,2),
('New Zealand',5, 0,2,49,12,26,2,0,3),
('Italy',2, 0,2,15,18,26,1,0,2),
('Uruguay',1, 0,3,9,13,26,0,0,1),
('Namibia',0, 0,4,3,25,25,1,0,0),
('Ireland',4, 0,1,30,8,26,1,0,3),
('South Africa',6, 0,1,27,20,27,2,1,2),
('Scotland',2, 0,2,21,10,25,1,0,2),
('Tonga',1, 0,3,13,3,18,0,0,1),
('Romania',0, 0,4,4,5,7,0,0,0),
('Wales',4, 0,1,19,6,24,1,0,3),
('Fiji',2, 0,3,12,4,22,1,2,1),
('Australia',2, 0,2,11,12,13,1,1,2),
('Portugal',1, 1,2,8,20,10,1,0,0),
('Georgia',0, 1,3,7,9,12,1,1,0),
('England',6, 0,1,21,13,21,2,0,2),
('Argentina',4, 0,3,19,7,24,3,0,2),
('Japan',2, 0,2,12,4,11,1,0,1),
('Samoa',1, 0,3,11,4,10,1,2,1),
('Chile',0, 0,4,4,2,7,1,0,0);

INSERT INTO P01_Joueur(Joueur_Nom,Joueur_Prenom,Numero_Maillot,Poste,Equipe_Id)
VALUES
    ('Ramos','Thomas',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
    ('Penaud','Damian',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Fickou','Gaël',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Danty','Jonathan',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Bielle-Biarrey','Louis',11,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Jalibert','Matthieu',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Dupont','Antoine',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Alldritt','Grégory',8,'Numéro 8',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Ollivon','Charles',7,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Jelonch','Anthony',6,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Flament','Thibaud',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Woki','Cameron',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Atonio','Uini',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Mauvaka','Peato',2,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Baille','Cyril',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Bourgarit','Pierre',15,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Wardi','Réda',14,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Aldegheri','Dorian',15,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Taofifenua','Romain',13,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Cros','François',12,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Macalou','Sekou',12,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Lucu','Maxime',13,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Moefana','Yoram',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),
      ('Melvyn','Jaminet',15,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France')),

      ('Barrett','Jordie',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Jordan','Will',11,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Reece','Sevu',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Ioane','Rieko',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Tupaea','Quinn',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Barrett','Beauden',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Smith','Aaron',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Savea','Ardie',6,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Frizell','shannon',7,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Papalii','Dalton',8,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Barrett','Scott',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Retallick','Brodie',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Bower','George',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Taylor','Codie',2,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Tu ungafasi','Ofa',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Coles','Dane',16,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),

      ('McKenzie','Damian',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Mo unga','Richie',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Christie','Finlay',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Blackadder','Ethan',6,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Sotutu','Hoskins',7,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Ioane','Akira',8,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Va ai', 'Tupou',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Jacobson','Luke',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Tu inukuafe','Karl',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Aumua','Asafo',2,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Ta avao','Angus',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Taukeiaho','Samisoni',16,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),
      ('Tele a','Mark',12,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand')),


     ('Capuozzo','Ange',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Bruno','Pierre',11,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Ioane','Montanna',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Brex','Juan Ignacio',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Morisi','Luca',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Garbisi','Paolo',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Fusco','Alessandro',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Negri','Sebastian',6,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Pettinelli','Giovanni',7,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Lamaro','Michele',8,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Cannone','Lorenzo',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Lamb','Dino',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Zani','Federico',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Buonfiglio','Paolo',2,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Nemer','Ivan',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Nicotera','Giacomo',16,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Manfredi','Marco',17,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Allan','Tommaso',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Garbisi','Alessandro',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Varney','Stephen',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Zualiani','Manuel',6,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Sisi','David',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Ceccarelli','Piertro',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Riccioni','Marco',16,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Manuel','Zuliani',5,'Flanker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Faiva','Hame',2,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),
     ('Odogwu','Paolo',10,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy')),

      ('Gigena','Facundo',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Leindekar','Juan Manuel',2,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Sanguinetti','Mateo',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Arbelo','Diego',4,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Kessler','Germán',2,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Pujol','Guillermo',1,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Leindekar','Manuel',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Magno','Diego',6,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Lamanna','Franco',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Vilaseca','Santiago',7,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Etcheverry','Felipe',8,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Ardao','Diego',9,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Gaminara','Juan Manuel',10,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Arata','Santiago',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Berchesi','Felipe',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Vilaseca','Andrés',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('de Benedictis','Juan Ignacio',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Etcheverry','Felipe',11,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Silva','Rodrigo',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Segredo','Leandro',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Benitez','Matias',16,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Gibert','Juan Pablo',17,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Carballo','Manuel',18,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Ormaechea','Juan Diego',19,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Bianchi','Lucas',20,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Arata','Santiago',21,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Pintos','Juan Manuel',22,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Freitas','Nicolás',23,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Silva','Rodrigo',24,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),
      ('Leindekar','Juan Manuel',25,'Remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay')),

      ('Steyn','Gerhard',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Klaus','Titus',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Louw','Leslie',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Van Wyk','Costello',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Steytler','Chad',11,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Kaumbuse','Ruan',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Van Zyl','Hendrikus',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Basson','Werner',8,'Numéro 8',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Steytler','Jacques',7,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Strauss','Dewald',6,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('De la Harpe','Mekondjo',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Van Rooyen','Adriaan',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Van der Merwe','Leonard',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Van Wyk','Nico',2,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Nami','Gerhard',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Van Heerden','Willie',16,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Scholtz','Johan',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Nghumbu','Ricardo',4,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Britz','Werner',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('De Klerk','Wessel',7,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Klaus','Titus',8,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Naude','Wikus',10,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Nami','Hennie',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Mouton','Gerswin',13,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),
      ('Swanepoel','Tiaan',10,'Demi ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia')),

      ('Healy','Andrew',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Herring','Rob',2,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Furlong','Tadhg',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Ryan','James',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Henderson','James',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Beirne','Tadhg',6,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Van der Flier','Josh',7,'Troisième ligne aile',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('O Mahony','Peter',8,'Numéro 8',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Conway','James',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Henshaw','Robbie',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Ringrose','Garry',11,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Sexton','Johnny',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Murray','Conor',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Ireland')),
      ('Gibson-Park', 'Jamison', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')),
      ('Keenan', 'Hugo', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')),
      ('Beirne', 'Tadhg', 6, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')),
      ('Aki', 'Bundee', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')),
      ('McCarthy', 'Joe', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')),
      ('Crowley', 'Jack', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')),


      ('Nche','Ox',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Kitshoff','Steven',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Nyakane','Trevor',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Mbonambi','Bongi',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Etzebeth','Eben',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('de Jager','Lood',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Kolisi','Siya',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('du Toit','Pieter-Steph',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Mostert','Franco',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('de Allende','Damian',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Am','Lukhanyo',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Libbok','Manie',11,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Mapimpi','Makazole',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('de Klerk','Faf',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Pollard','Handré',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),

      ('Koch','Vincent',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Malherbe','Frans',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Mchunu','Ntuthuko',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Marx','Malcolm',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Orie','Marvin',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Snyman','RG',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Smith','Kwagga',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Wiese','Jasper',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Roos','Evan',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Kriel','Jesse',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Willemse','Damian',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),
      ('Reinach','Cobus',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='South Africa')),

      ('Sutherland','Rory',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
    ('Fagerson','Zander',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
    ('Schoeman','Pierre',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('McInally','Stuart',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Gilchrist','Grant',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Gray','Jonny',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Watson','Hamish',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Darge','Rory',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Skinner','Sam',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Johnson','Sam',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Harris','Chris',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Graham','Darcy',14,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('van der Merwe','Duhan',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Price','Ali',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Russell','Finn',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),

('Nel','WP',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Berghan','Simon',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Sebastian','Javan',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Turner','George',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Skinner','Sam',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Cummings','Scott',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Bradbury','Magnus',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Fagerson','Matt',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Bennett','Mark',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Steyn','Kyle',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Kinghorn','Blair',14,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('McLean','Rufus',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Steele','Scott',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Thompson','Ross',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),
('Healy','Ben',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Scotland')),

('Taukei aho','Sione',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Talakai','Latu',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Tameifuna','Ben',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Fisilau','Samisoni',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Lousi','Sam',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Kalamafoni','Sione',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Timani','Lopeti',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Tuipulotu','Sione',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Ahki','Pita',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Fekitoa','Malakai',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Piutau','Siale',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Veainu','Telusa',14,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Taumoepeau','Afusipa',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Takulua','Sonatane',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Ngatia','Kalione',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),

('Fisi iahi','Siegfried',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Tu ungafasi','Ofa',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Fa amausili','Soane',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Halanukonuka','Siua',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Fifita','Halalefa',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Mailau','Fotuaika',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Koloamatangi','Tevita',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Lam','Jack',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Kalamafoni','Sione',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Fine','Viliam',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Faleafa','Daniel',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),
('Fukofuka','Leon',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Tonga')),

('Ursache','Andrei',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Balan','Vasile',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Savin','Alexandru',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Surugiu','Florin',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Toader','Andrei',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Ionita','Adrian',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Rosu','Florian',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Boboc','Cristi',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Vlad','Andrei',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Barba','Ionel',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Mocuta','George',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Macovei','Mihai',14,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Stratila','Denis',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Popa','Vladut',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Vlaicu','Florin',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Rupanu','Gabriel',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),


('Tarus','Alexandru',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Furtuna','Costin',2,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Gurita','Constantin',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Macovei','Mihai',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Antonescu','Marius',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Marginean','Adrian',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Alexe','Alexandru',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Ursache','Andrei',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Iancu','Stefan',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Simionescu','Marius',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Onutu','Nicholas',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Faleafa','Daniel',15,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Fukofuka','Leon',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),
('Faiva','James',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Romania')),

('Smith','Nicky',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Lake','Dewi',2,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Lewis','Dillon',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Tshiunza','Christ',4,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Jenkins','Daffydd',5,'Lock',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Morgan','Jac',6,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Lydiate','Dan',7,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Faletau','Taulupe',8,'Back-row',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Davies','Gareth',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Biggar','Dan',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Dyer','Rio',11,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Williams','George',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Grady','Mason',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Rees-Zammit','Louis',14,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Halfpenny','Leigh',15,'Full-back',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),

('Thomas','Gareth',1,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Evans','Henry',2,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Thomas','Nick',3,'Prop',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Griffiths','Ryan',21,'Hooker',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Adams','Josh',11,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Tompkins','Nick',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Williams','Johnny',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Williams','Liam',14,'Wing',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Anscombe','Gareth',10,'Fly-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),
('Costelow','Sam',9,'Scrum-half',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Wales')),

('Mawi','Eroni',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Ravai','Peni',2,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Togiatama','Zuriel',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Ikaninevere','Tevita',16,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Matavesi','Samuel',17,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Nasilasila','Isoa',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Tagi','Luke',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Ratuniyarawa','',6,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Botia','Levani',7,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Derenalagi','Meli',8,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Mata','Viliame',9,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Lomani','Frank',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Botitu','Vilimoni',10,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Volavola','Ben',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Cirikidaveta','Te Ahiwaru',11,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Nayacalevu','Waisea',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Tuivasa-Sheck','Setareki',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Habosi','Vinaya',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Radradra','Semi',15,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Droasese','Ilaisa',11,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Uluialakepa','Kaliopasi',16,'Pilier remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Lutumailagi','Joeli',17,'Pilier remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Kunavula','Mesulame',18,'Talonneur remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),
('Saulo','Manasa',19,'Talonneur remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Fiji')),

('Faessler','Matt',1,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Uelese','Jordan',2,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Swain','Darcy',3,'Pilier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Porecki','David',15,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('McReight','Fraser',12,'Talonneur',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Rodda','Izack',4,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Swain','Darcy',6,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Salakaia-Loto','Lukhan',5,'Deuxième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Hooper','Michael',7,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Valetini','Rob',8,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Samu','Pete',9,'Troisième ligne',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('White','Nic',9,'Demi de mêlée',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Donaldson','Ben',10,'FIVE-EIGHTHS',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Cooper','Quade',10,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Lolesio','Noah',11,'Demi d ouverture',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Kerevi','Samu',12,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Paisami','Hunter',13,'Centre',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Kerevi','Darcy',11,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Koroibete','Marika',15,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Banks','Tom',15,'Arrière',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Nawaqanitawase','Mark',14,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Slipper','James',12,'Pilier remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Sio','Scott',12,'Pilier remplaçant',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),
('Petaia','Jordan',12,'Ailier',(SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Australia')),

('Simões', 'Bruno', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Cabral', 'Henrique', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Bettencourt', 'Pedro', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Simões', 'João', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Bento', 'Simão', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Monteiro', 'António', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Tavares', 'Gonçalo', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Ferreira', 'Diogo', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Araújo', 'João Diogo', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Rodrigues', 'João Pedro', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Senra', 'Diogo', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Nunes Pinto', 'João', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Santos', 'Nuno', 21, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Borges', 'Gonçalo', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Simões', 'Rafael', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Belo', 'João', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Marta', 'Rodrigo', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Portela', 'Jerónimo', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Bruno', 'Francisco', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),
    ('Madeira', 'José', 11, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Portugal')),

    ('Kveseladze', 'Giorgi', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Chilachava', 'Levan', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Gigashvili', 'Beka', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Gogichashvili', 'Guram', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Nariashvili', 'Mikheil', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Bregvadze', 'Jaba', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Mamukashvili', 'Shalva', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Jaiani', 'Lasha', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Giorgadze', 'Otar', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Saginadze', 'Beka', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Kubriashvili', 'David', 18, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Tkhilaishvili', 'Giorgi', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Lobzhanidze', 'Vasil', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Aprasidze', 'Gela', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Sharikadze', 'Merab', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Khmaladze', 'Lasha', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Niniashvili', 'Davit', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Todua', 'Sandro', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Khwarashvili', 'Davit', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Matiashvili', 'Soso', 3, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Jalagoniya', 'Tornike', 12, 'Ailier', 1),
('Javakhishvili', 'Giorgi', 11, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Tsutskiridze', 'Giorgi', 5, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Giorgadze', 'Otar', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Tcheishvili', 'Nodar', 10, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Gogodze', 'Giorgi', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Tsiklauri', 'Beka', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Abzhandadze', 'Tedo', 6, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),
('Aprasidze', 'Davit', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Georgia')),

('Genge', 'Ellis', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Sinckler', 'Kyle', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Stuart', 'Will', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Heyes', 'Joe', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Rodd', 'Bevan', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('George', 'Jamie', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Cowan-Dickie', 'Luke', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Itoje', 'Maro', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Hill', 'Jonny', 7, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Ewels', 'Charlie', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Isiekwe', 'Nick', 14, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Lawes', 'Courtney', 9, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Underhill', 'Sam', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Curry', 'Tom', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Ludlam', 'Lewis', 11, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Willis', 'Jack', 12, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Hill', 'Ted', 13, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Youngs', 'Ben', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Randall', 'Harry', 14, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Farrell', 'Owen', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Smith', 'Marcus', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Ford', 'George', 11, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Tuilagi', 'Manu', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Marchant', 'Joe', 14, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Daly', 'Elliot', 15, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('May', 'Jonny', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Nowell', 'Jack', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Watson', 'Anthony', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Malins', 'Max', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Farell', 'Owen', 12, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),
('Furbank', 'George', 12, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')),

('Kveseladze', 'Giorgi', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Chilachava', 'Levan', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Gigashvili', 'Beka', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Gogichashvili', 'Guram', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Nariashvili', 'Mikheil', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Bregvadze', 'Jaba', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Mamukashvili', 'Shalva', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Jaiani', 'Lasha', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Giorgadze', 'Otar', 7, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Saginadze', 'Beka', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Kubriashvili', 'Davit', 18, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Tkhilaishvili', 'Giorgi', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Saginadze', 'Beka', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Bruni', 'Rodrigo', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Javakhishvili', 'Giorgi', 11, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Lobzhanidze', 'Vasil', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Aprasidze', 'Gela', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Sharikadze', 'Merab', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Khmaladze', 'Lasha', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Boffelli', 'Emiliano', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Todua', 'Sandro', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Khwarashvili', 'Davit', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Begadze', 'Giorgi', 16, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),

('Jalagonia', 'Tornike', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Javakhishvili', 'Giorgi', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Tsutskiridze', 'Giorgi', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Giorgadze', 'Otar', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Tcheishvili', 'Nodar', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Gigashvili', 'Beka', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Gorgadze', 'Giorgi', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Tsiklauri', 'Beka', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Abzhandadze', 'Tedo', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),
('Aprasidze', 'Davit', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')),

('Inagaki', 'Keita', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Noguchi', 'Issei', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Ai Valu', 'Asaeli', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Kim', 'Jiwon', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Sakate', 'Atsushi', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Horie', 'Shota', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Cornelsen', 'Jack', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('van der Walt', 'Wimpie', 7, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Koo', 'Jiwon', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Niwai', 'Yusuke', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Labuschagne', 'Pieter', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Gunter', 'Ben', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Fakatava', 'Amato', 12, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Fukui', 'Shota', 13, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Yamanaka', 'Ryohei', 14, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Tamura', 'Yu', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Shigeno', 'Kaito', 10, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Matsuda', 'Rikiya', 11, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Lee', 'Seung Sin', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Nakamura', 'Ryoto', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Nakano', 'Shogo', 14, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Lafaele', 'Timothy', 15, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Matsushima', 'Kotaro', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Yamanaka', 'Ryohei', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Riley', 'Dylan', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Yamanaka', 'Ryohei', 14, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),
('Tamura', 'Yu', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')),

('Mapusua', 'Seilala', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Alaalatoa', 'Michael', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Lay', 'Jordan', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Mulipola', 'Logovi i', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Lam', 'Seilala', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Matu u', 'Motu', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Jones', 'Michael', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Lousi', 'Sam', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Vui', 'Chris', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Tyrell', 'Josh', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Ioane', 'TJ', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Fa asalele', 'Piula', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Vailanu', 'Sione', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Taefu', 'Henry', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Faleali i', 'Auvasa', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Read', 'Kieran', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Taefu', 'Henry', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Leuila', 'D Angelo', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Nanai-Williams', 'Tim', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Fidow', 'Ed', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Tuipulotu', 'Timoci', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Tuala', 'Ahsee', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Seuteni', 'Ulupano', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Amosa', 'Afaesetiti', 12, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Lemalu', 'Fa atiga', 10, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Lam', 'Jack', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Talanoa', 'Fetuli', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Taumateine', 'Jonathan', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Tuilagi', 'Henry', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Samoa', 'Manu', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Ahki', 'Pita', 8, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),
('Lam', 'AJ', 9, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')),

('Dussaillant', 'Tomás', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Bohme', 'Augusto', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Escobar', 'Diego', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Martínez', 'Raimundo', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Sigren', 'Martín', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Alarcón', 'Manuel', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Eissmann', 'Javier', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Dittus', 'Matías', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Edwards', 'Santiago', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Escobar', 'Alfonso', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Orchard', 'Thomas', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Videla', 'Alfonso', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Carvallo', 'Lukas', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Sigren', 'Martín', 10, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Urroz', 'Francisco', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Garafulic', 'Matías', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Larenas', 'José Ignacio', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Saavedra', 'Domingo', 14, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Orchard', 'Thomas', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Lues', 'Salvador', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Velarde', 'Franco', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Fernandez', 'Rodrigo', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Sarmiento', 'Augusto', 6, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Retamal', 'Augusto', 6, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Dittus', 'Matías', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Escobar', 'Alfonso', 4, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Silva', 'Ignacio', 3, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Sigren', 'Martín', 12, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Garafulic', 'Matías', 10, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Velarde', 'Franco', 6, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Orchard', 'Thomas', 6, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile')),
('Carvallo', 'Lukas', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));



INSERT INTO P01_Appartient (Equipe_Id, Joueur_Id)
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'France'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'France')

UNION ALL

SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'New Zealand'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'New Zealand')

UNION ALL

SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Italy'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Italy')

UNION ALL

SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Uruguay'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Uruguay')
UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Namibia'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Namibia')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
    Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa')

UNION ALL
SELECT
    (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'),
    Joueur_Id
FROM
    P01_Joueur
WHERE
Equipe_Id = (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile');


-- Alimenter la table P01_Oppose à partir des matchs de toutes les poules
INSERT INTO P01_Oppose (Match_Id, Equipe_Id)
SELECT R.Match_Id, Eq.Equipe_Id
FROM P01_Rencontre R
NATURAL JOIN P01_Equipe Eq
WHERE Eq.Equipe_Nom = R.Equipe1
   OR Eq.Equipe_Nom = R.Equipe2;




INSERT INTO P01_MatchJoueurStat(Match_Id,Joueur_Id,Poste,Numero_Maillot,Essai,Penalite,Transformation,Nb_Drop)
VALUES(
       (SELECT Match_Id FROM P01_Rencontre
                        WHERE(Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                           OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Penaud' AND Joueur_Prenom = 'Damian'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Damian' AND Joueur_Nom='Penaud'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom ='Damian' AND Joueur_Nom='Penaud'),
       1,0,0,0),
(
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Melvyn' AND Joueur_Prenom = 'Jaminet'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jaminet' AND Joueur_Nom='Melvyn'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jaminet' AND Joueur_Nom='Melvyn'),
       1,0,0,0),
(
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Thomas' AND Joueur_Nom = 'Ramos'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Thomas' AND Joueur_Nom='Ramos'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Thomas' AND Joueur_Nom='Ramos'),
       0,5,1,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Mark' AND Joueur_Nom = 'Tele a'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Mark' AND Joueur_Nom='Tele a'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Mark' AND Joueur_Nom='Tele a'),
       2,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A' ),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom='Mo unga'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom='Mo unga'),
       0,1,0,0),
(
         (SELECT Match_Id FROM P01_Rencontre
                          WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                             OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Lorenzo' AND Joueur_Nom = 'Cannone'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Lorenzo' AND Joueur_Nom='Cannone'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Lorenzo' AND Joueur_Nom='Cannone'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Paolo' AND Joueur_Nom = 'Garbisi'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Garbisi'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Garbisi'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Dino' AND Joueur_Nom = 'Lamb'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Dino' AND Joueur_Nom='Lamb'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Dino' AND Joueur_Nom='Lamb'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Ange' AND Joueur_Nom = 'Capuozzo'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Ange' AND Joueur_Nom='Capuozzo'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Ange' AND Joueur_Nom='Capuozzo'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Hame' AND Joueur_Nom = 'Faiva'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Hame' AND Joueur_Nom='Faiva'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Hame' AND Joueur_Nom='Faiva'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Zuliani' AND Joueur_Nom = 'Manuel'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Zuliani' AND Joueur_Nom='Manuel'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Zuliani' AND Joueur_Nom='Manuel'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Paolo' AND Joueur_Nom = 'Odogwu'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Odogwu'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Odogwu'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Tommaso' AND Joueur_Nom = 'Allan'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Tommaso' AND Joueur_Nom='Allan'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Tommaso' AND Joueur_Nom='Allan'),
       0,1,7,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Gerswin' AND Joueur_Nom = 'Mouton'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Gerswin' AND Joueur_Nom='Mouton'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Gerswin' AND Joueur_Nom='Mouton'),
       1,0,0,0),

    (
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Tiaan' AND Joueur_Nom = 'Swanepoel'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Tiaan' AND Joueur_Nom='Swanepoel'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Tiaan' AND Joueur_Nom='Swanepoel')
       ,1,0,0,0),
(
    (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                         OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Gibson-Park' AND Joueur_Prenom = 'Jamison'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jamison' AND Joueur_Nom = 'Gibson-Park'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jamison' AND Joueur_Nom = 'Gibson-Park'),
        1, 0, 0, 0),

    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Keenan' AND Joueur_Prenom = 'Hugo'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Hugo' AND Joueur_Nom = 'Keenan'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Hugo' AND Joueur_Nom = 'Keenan'),
        1, 0, 0, 0),
(
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Aki' AND Joueur_Prenom = 'Bundee'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Bundee' AND Joueur_Nom = 'Aki'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Bundee' AND Joueur_Nom = 'Aki'),
        2, 0, 0, 0),
        (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Sexton' AND Joueur_Prenom = 'Johnny'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Johnny' AND Joueur_Nom = 'Sexton'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Johnny' AND Joueur_Nom = 'Sexton'),
        2, 0, 7, 0),

    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Herring' AND Joueur_Prenom = 'Rob'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rob' AND Joueur_Nom = 'Herring'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rob' AND Joueur_Nom = 'Herring'),
        2, 0, 0, 0),

    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'O Mahony' AND Joueur_Prenom = 'Peter'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Peter' AND Joueur_Nom = 'O Mahony'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Peter' AND Joueur_Nom = 'O Mahony'),
        2, 0, 0, 0),

    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'McCarthy' AND Joueur_Prenom = 'Joe'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Joe' AND Joueur_Nom = 'McCarthy'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Joe' AND Joueur_Nom = 'McCarthy'),
        1, 0, 0, 0),

    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland')AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Crowley' AND Joueur_Prenom = 'Jack'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jack' AND Joueur_Nom = 'Crowley'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jack' AND Joueur_Nom = 'Crowley'),
        0, 0, 4, 0),
    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Rupanu' AND Joueur_Prenom = 'Gabriel'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Gabriel' AND Joueur_Nom = 'Rupanu'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Gabriel' AND Joueur_Nom = 'Rupanu'),
        1, 1, 0, 0),
    (

        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'Argentina')
                            OR (Equipe1 = 'Argentina' AND Equipe2 = 'England') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Ford' AND Joueur_Prenom = 'George'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'George' AND Joueur_Nom = 'Ford'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'George' AND Joueur_Nom = 'Ford'),
        0, 6, 0, 0),
    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'Argentina')
                            OR (Equipe1 = 'Argentina' AND Equipe2 = 'England') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Bruni' AND Joueur_Prenom = 'Rodrigo'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Bruni'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Bruni'),
        1, 1, 1, 0),
    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'Argentina')
                            OR (Equipe1 = 'Argentina' AND Equipe2 = 'England') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Boffelli' AND Joueur_Prenom = 'Emiliano'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        0, 1, 1, 0),
    (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Fakatava' AND Joueur_Prenom = 'Amato'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Amato' AND Joueur_Nom = 'Fakatava'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Amato' AND Joueur_Nom = 'Fakatava'),
        2, 0, 1, 0),
        (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Matsuda' AND Joueur_Prenom = 'Rikiya'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rikiya' AND Joueur_Nom = 'Matsuda'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rikiya' AND Joueur_Nom = 'Matsuda'),
        0, 0, 6, 0),

        (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Fernandez' AND Joueur_Prenom = 'Rodrigo'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Fernandez'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Fernandez'),
        1, 0, 0, 0),
        (
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Videla' AND Joueur_Prenom = 'Alfonso'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Alfonso' AND Joueur_Nom = 'Videla'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Alfonso' AND Joueur_Nom = 'Videla'),
        0, 0, 1, 0),
        (
    (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'New Zealand' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'New Zealand') AND Tour = 'Finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Barrett' AND Joueur_Prenom = 'Beauden'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Beauden' AND Joueur_Nom = 'Barrett'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Beauden' AND Joueur_Nom = 'Barrett'),
        1, 0, 0, 0),
(

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'New Zealand' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'New Zealand') AND Tour = 'Finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Mo unga' AND Joueur_Prenom = 'Richie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        0, 2, 0, 0),

(
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'New Zealand' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'New Zealand') AND Tour = 'Finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Pollard' AND Joueur_Prenom = 'Handré'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        0, 4, 0, 0),
    (
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Farrell' AND Joueur_Prenom = 'Owen'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Owen' AND Joueur_Nom = 'Farrell'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Owen' AND Joueur_Nom = 'Farrell'),
        0, 4, 0, 0),
    (
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Snyman' AND Joueur_Prenom = 'RG'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'RG' AND Joueur_Nom = 'Snyman'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'RG' AND Joueur_Nom = 'Snyman'),
        1, 0, 0, 0),
    (
     (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Pollard' AND Joueur_Prenom = 'Handré'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        0,2, 1, 0),
    (
     (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Libbok' AND Joueur_Prenom = 'Manie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Manie' AND Joueur_Nom = 'Libbok'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Manie' AND Joueur_Nom = 'Libbok'),
        0, 1, 0, 0),

    (

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Boffelli' AND Joueur_Prenom = 'Emiliano'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        0, 2, 0, 0),
    (

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Jordan' AND Joueur_Prenom = 'Will'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Will' AND Joueur_Nom = 'Jordan'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Will' AND Joueur_Nom = 'Jordan'),
        3,0, 0, 0),
    (

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Barrett' AND Joueur_Prenom = 'Jordie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jordie' AND Joueur_Nom = 'Barrett'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jordie' AND Joueur_Nom = 'Barrett'),
        1, 0, 0, 0),
(

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Mo unga' AND Joueur_Prenom = 'Richie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        0, 1, 3, 0);

-- Création des vues
CREATE VIEW Vue_MatchsPlanifies AS
SELECT Match_Id, Date_Match, Lieu, Equipe1, Equipe2, Tour
FROM P01_Rencontre
WHERE Date_Match < CURRENT_DATE;

-- vues 1
-- Vue des Statistiques des Équipes :
CREATE VIEW Vue_StatistiquesEquipes AS
SELECT
    Equipe_Id,
    Equipe_Nom,
    Nb_Victoire,
    Nb_MatchNul,
    Nb_Defaite,
    (Nb_Victoire * 3) + (Nb_MatchNul * 1) AS Points
FROM P01_Equipe;

--vues 2

-- Vue des Joueurs par Équipe :
CREATE VIEW Vue_JoueursParEquipe AS
SELECT
    E.Equipe_Id,
    E.Equipe_Nom,
    J.Joueur_Id,
    J.Joueur_Nom,
    J.Joueur_Prenom
FROM P01_Equipe E
JOIN P01_Joueur J ON E.Equipe_Id = J.Equipe_Id;




-- Création des procédures et fonctions (ajoutez vos propres procédures et fonctions)

--1
CREATE OR REPLACE FUNCTION EditerDonneesJoueur(
    p_JoueurId INT,
    p_NouveauNom VARCHAR(200),
    p_NouveauPrenom VARCHAR(200),
    p_NouveauNumeroMaillot INT,
    p_NouveauPoste VARCHAR(30)
) RETURNS VOID AS
    $$
BEGIN
    -- Vérifier si le joueur avec l'ID spécifié existe
    IF NOT EXISTS (SELECT 1 FROM P01_Joueur WHERE Joueur_Id = p_JoueurId) THEN
        RAISE EXCEPTION 'Joueur non trouvé.';
    END IF;

    -- Mettre à jour les données du joueur
    UPDATE P01_Joueur
    SET
        Joueur_Nom = p_NouveauNom,
        Joueur_Prenom = p_NouveauPrenom,
        Numero_Maillot = p_NouveauNumeroMaillot,
        Poste = p_NouveauPoste
    WHERE Joueur_Id = p_JoueurId;
END;
$$ LANGUAGE plpgsql;

--2

CREATE OR REPLACE FUNCTION NombreTotalJoueurs() RETURNS INT AS
$$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM P01_Joueur;
    RETURN total;
END;
$$ LANGUAGE plpgsql;


--3
CREATE OR REPLACE FUNCTION NomsJoueursParEquipe(p_EquipeId INT) RETURNS SETOF VARCHAR(200) AS
$$
DECLARE
    nom_joueur VARCHAR(200);
BEGIN
    FOR nom_joueur IN (SELECT Joueur_Nom FROM P01_Joueur WHERE Equipe_Id = p_EquipeId)
    LOOP
        RETURN NEXT nom_joueur;
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql;

--4

CREATE OR REPLACE FUNCTION InfosJoueursParEquipe(p_EquipeId INT) RETURNS TABLE (
    Joueur_Nom VARCHAR(200),
    Joueur_Prenom VARCHAR(200),
    Numero_Maillot INT,
    Poste VARCHAR(30)
) AS
$$
BEGIN
    -- Utiliser RETURN QUERY avec une requête dynamique
    RETURN QUERY EXECUTE '
        SELECT Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste
        FROM P01_Joueur
        WHERE Equipe_Id = $1
    ' USING p_EquipeId;
END;
$$ LANGUAGE plpgsql;


-- Création des séquences (ca se cree automatiquement lors de la creation des tables)


-- Création des triggers
-- Triggers
CREATE OR REPLACE FUNCTION initialisationStatEquipeNom()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.Equipe_Nom <> NEW.Equipe_Nom THEN
        UPDATE P01_Equipe
        SET Nb_Victoire = 0, Nb_MatchNul = 0, Nb_Defaite = 0, Essai = 0, Penalite = 0,
            Transformation = 0, Nb_Drop = 0, Bonus_Defensif = 0, Bonus_Offensif = 0
        WHERE Equipe_Id = OLD.Equipe_Id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trgInitialisationStatEquipeNom
AFTER UPDATE OF Equipe_Nom ON P01_Equipe
FOR EACH ROW
EXECUTE FUNCTION initialisationStatEquipeNom();

CREATE TRIGGER trgInitialisationStatEquipeNom2
AFTER UPDATE OF Equipe_Nom ON P01_Equipe
FOR EACH STATEMENT
EXECUTE FUNCTION initialisationStatEquipeNom();