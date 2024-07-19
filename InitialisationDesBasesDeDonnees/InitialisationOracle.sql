-- Création des tables
-- définition d'une séquence pour l'identifiant du match
CREATE SEQUENCE seq_match;

-- Création de la table Rencontre
CREATE TABLE P01_Rencontre (
    Match_Id INT DEFAULT seq_match.nextval PRIMARY KEY,
    Date_Match DATE NOT NULL,
    Lieu VARCHAR(200) NOT NULL,
    Equipe1 VARCHAR(100) NOT NULL,
    Equipe2 VARCHAR(100) NOT NULL,
    Score1 INT NOT NULL,
    Score2 INT NOT NULL,
    Tour VARCHAR(20) NOT NULL
);
-- définition d'une séquence pour l'identifiant de l'equipe
CREATE SEQUENCE seq_Equipe;

-- Création de la table Equipe
CREATE TABLE P01_Equipe (
    Equipe_Id INT DEFAULT seq_Equipe.nextval PRIMARY KEY,
    Equipe_Nom VARCHAR(100) NOT NULL,
    Nb_Victoire INT NOT NULL,
    Nb_MatchNul INT NOT NULL,
    Nb_Defaite INT NOT NULL,
    Essai INT NOT NULL,
    Penalite INT NOT NULL,
    Transformation INT NOT NULL,
    Nb_Drop INT NOT NULL,
    Bonus_Defensif INT NOT NULL,
    Bonus_Offensif INT NOT NULL
);
-- définition d'une séquence pour l'identifiant du joueur
CREATE SEQUENCE seq_Joueur;

-- Création de la table Joueur
CREATE TABLE P01_Joueur (
    Joueur_Id INT DEFAULT seq_Joueur.nextval PRIMARY KEY,
    Joueur_Nom VARCHAR(200) NOT NULL,
    Joueur_Prenom VARCHAR(200) NOT NULL,
    Numero_Maillot INT NOT NULL,
    Poste VARCHAR(30),
    Equipe_Id INT NOT NULL,
    FOREIGN KEY (Equipe_Id) REFERENCES P01_Equipe(Equipe_Id)
);

-- Création de la table MatchJoueurStat
CREATE TABLE P01_MatchJoueurStat (
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
CREATE TABLE P01_Oppose(
    Match_Id INT NOT NULL,
    Equipe_Id INT NOT NULL,
    FOREIGN KEY (Match_Id) REFERENCES P01_Rencontre(Match_Id),
    FOREIGN KEY (Equipe_Id) REFERENCES P01_Equipe(Equipe_Id),
    PRIMARY KEY (Match_Id,Equipe_Id)
);
CREATE TABLE P01_Appartient(
    Equipe_Id INT NOT NULL,
    Joueur_Id INT NOT NULL,
    FOREIGN KEY (Equipe_Id) REFERENCES P01_Equipe(Equipe_Id),
    FOREIGN KEY (Joueur_Id) REFERENCES P01_Joueur(Joueur_Id),
    PRIMARY KEY (Equipe_Id,Joueur_Id)
);

-- Alimentation des tables :
-- Matchs de poules pour la Poule A
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
            TO_DATE('2023-09-08','YYYY-MM-DD'), 'Stade de France, Saint-Denis','France','New Zealand',27,13,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-09-09','YYYY-MM-DD'), 'Stade Geoffroy-Guichard,Saint-Étienne','Italy','Namibia',52,8,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-14','YYYY-MM-DD'), 'Stade Pierre-Mauroy, Lille','France','Uruguay',27,12,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-15','YYYY-MM-DD'), 'Stadium de Toulouse, Toulouse','New Zealand','Namibia',71,3,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-20','YYYY-MM-DD'), 'Stade de Nice, Nice','Italy','Uruguay',38,17,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-21','YYYY-MM-DD'), 'Stade de Marseille, Marseille','France','Namibia',96,0,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-27','YYYY-MM-DD'), 'OL Stadium, Lyon','Uruguay','Namibia',36,26,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-29','YYYY-MM-DD'), 'OL Stadium, Lyon','New Zealand','Italy',96,17,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-10-05','YYYY-MM-DD'), 'OL Stadium, Lyon','New Zealand','Uruguay',73,0,'Poule A');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-10-06','YYYY-MM-DD'), 'OL Stadium, Lyon','France','Italy',60,7,'Poule A');

-- Matchs de poules pour la Poule B
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
    VALUES (TO_DATE('2023-09-09','YYYY-MM-DD'), 'Stade de Bordeaux, Bordeaux','Ireland','Romania',82,8,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-10','YYYY-MM-DD'), 'Stade de Marseille, Marseille','South Africa','Scotland',18,3,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-16','YYYY-MM-DD'), 'Stade de la Beaujoire, Nantes','Ireland','Tonga',59,16,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-17','YYYY-MM-DD'), 'Stade de Bordeaux, Bordeaux','South Africa','Romania',76,0,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-23','YYYY-MM-DD'), 'Stade de France, Saint-Denis','South Africa','Ireland',8,13,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-24','YYYY-MM-DD'), 'Stade de Nice, Nice','Scotland','Tonga',45,17,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-09-30','YYYY-MM-DD'), 'Stade Pierre-Mauroy, Lille','Scotland','Romania',84,0,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-10-01','YYYY-MM-DD'), 'Stade de Marseille, Marseille','South Africa','Tonga',49,18,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-10-07','YYYY-MM-DD'), 'Stade de France, Saint-Denis','Ireland','Scotland',36,14,'Poule B');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)    VALUES (
           TO_DATE('2023-10-08','YYYY-MM-DD'), 'Stade Pierre-Mauroy, Lille','Tonga','Romania',45,24,'Poule B');

-- Matchs de poules pour la Poule C

INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
            TO_DATE('2023-09-09','YYYY-MM-DD'), 'Stade de France, Saint-Denis','Australia','Georgia',35,15,'Poule C');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-10','YYYY-MM-DD'),'Stade de Bordeaux, Bordeaux','Wales','Fiji',32,26,'Poule C');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-16','YYYY-MM-DD'),'Stade de Nice, Nice','Wales','Portugal',28,8,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-09-17','YYYY-MM-DD'),'Stade Geoffroy-Guichard, Saint-Étienne','Australia','Fiji',15,22,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-23','YYYY-MM-DD'),'Stadium de Toulouse, Toulouse','Georgia','Portugal',18,18,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-09-24','YYYY-MM-DD'),'OL Stadium, Lyon','Wales','Australia',40,6,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-09-30','YYYY-MM-DD'),'Stade de Bordeaux, Bordeaux','Fiji','Georgia',17,12,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-10-01','YYYY-MM-DD'),'Stade Geoffroy-Guichard, Saint-Étienne','Australia','Portugal',34,14,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-10-07','YYYY-MM-DD'),'Stade de la Beaujoire, Nantes','Wales','Georgia',43,19,'Poule C');
            INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
           TO_DATE('2023-10-08','YYYY-MM-DD'),'Stadium de Toulouse, Toulouse','Fiji','Portugal',23,24,'Poule C');
-- Matchs de poules pour la Poule D
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
TO_DATE('2023-09-09','YYYY-MM-DD'), 'Stade de Marseille, Marseille','England','Argentina',27,10,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-10','YYYY-MM-DD'),'Stadium de Toulouse, Toulouse','Japan','Chile',42,12,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-16','YYYY-MM-DD'),'Stade de Bordeaux, Bordeaux','Samoa','Chile',43,10,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-17','YYYY-MM-DD'),'Stade de Nice, Nice','England','Japan',34,12,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-22','YYYY-MM-DD'),'Stade Geoffroy-Guichard, Saint-Étienne','Argentina','Samoa',19,10,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-23','YYYY-MM-DD'),'Stade Pierre-Mauroy, Lille','England','Chile',71,0,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-28','YYYY-MM-DD'),'Stadium de Toulouse, Toulouse','Japan','Samoa',28,22,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-09-30','YYYY-MM-DD'),'Stade de la Beaujoire, Nantes','Argentina','Chile',59,5,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-10-07','YYYY-MM-DD'),'Stade Pierre-Mauroy, Lille','England','Samoa',18,17,'Poule D');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-10-08','YYYY-MM-DD'),'Stade de la Beaujoire, Nantes','Japan','Argentina',27,39,'Poule D');

-- Matchs pour : quarts de finale
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour) VALUES (
TO_DATE('2023-10-14','YYYY-MM-DD'), 'Stade de Marseille, Marseille','Wales','Argentina',17,29,'Quart de finale');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-10-14','YYYY-MM-DD'), 'Stade de France, Saint-Denis','Ireland','New Zealand',24,28,'Quart de finale');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-10-15','YYYY-MM-DD'), 'Stade de Marseille, Marseille','England','Fiji',30,24,'Quart de finale');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-10-15','YYYY-MM-DD'), 'Stade de France, Saint-Denis','France','South Africa',28,29,'Quart de finale');

-- Matchs pour : demi finales
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
            TO_DATE('2023-10-20','YYYY-MM-DD'), 'Stade de France, Saint-Denis','Argentina','New Zealand',6,44,'Demi finale');
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)VALUES (
           TO_DATE('2023-10-21','YYYY-MM-DD'), 'Stade de France, Saint-Denis','England','South Africa',15,16,'Demi finale');

-- Matchs pour : Bronze finale
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
VALUES (TO_DATE('2023-10-27','YYYY-MM-DD'), 'Stade de France, Saint-Denis','Argentina','England',23,26,'Bronze finale');

-- Matchs de poules pour : La finale
INSERT INTO P01_Rencontre (Date_Match, Lieu, Equipe1, Equipe2,score1,score2, Tour)
VALUES (TO_DATE('2023-10-27','YYYY-MM-DD'), 'Stade de France, Saint-Denis','New Zealand','South Africa',11,22,'Finale');

-- Alimenter la table P01_Equipe

INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('France', 4, 0, 1, 30, 10, 26, 2, 0, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('New Zealand', 5, 0, 2, 49, 12, 26, 2, 0, 3);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Italy', 2, 0, 2, 15, 18, 26, 1, 0, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Uruguay', 1, 0, 3, 9, 13, 26, 0, 0, 1);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Namibia', 0, 0, 4, 3, 25, 25, 1, 0, 0);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Ireland', 4, 0, 1, 30, 8, 26, 1, 0, 3);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('South Africa', 6, 0, 1, 27, 20, 27, 2, 1, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Scotland', 2, 0, 2, 21, 10, 25, 1, 0, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Tonga', 1, 0, 3, 13, 3, 18, 0, 0, 1);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Romania', 0, 0, 4, 4, 5, 7, 0, 0, 0);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Wales', 4, 0, 1, 19, 6, 24, 1, 0, 3);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Fiji', 2, 0, 3, 12, 4, 22, 1, 2, 1);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Australia', 2, 0, 2, 11, 12, 13, 1, 1, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Portugal', 1, 1, 2, 8, 20, 10, 1, 0, 0);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Georgia', 0, 1, 3, 7, 9, 12, 1, 1, 0);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('England', 6, 0, 1, 21, 13, 21, 2, 0, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Argentina', 4, 0, 3, 19, 7, 24, 3, 0, 2);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Japan', 2, 0, 2, 12, 4, 11, 1, 0, 1);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Samoa', 1, 0, 3, 11, 4, 10, 1, 2, 1);
INSERT INTO P01_Equipe (Equipe_Nom, Nb_Victoire, Nb_MatchNul, Nb_Defaite,Essai,Penalite, Transformation,Nb_Drop,Bonus_Defensif,Bonus_Offensif)
VALUES
('Chile', 0, 0, 4, 4, 2, 7, 1, 0, 0);


-- Alimentation de la table P01_Joueur

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ramos', 'Thomas', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Penaud', 'Damian', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fickou', 'Gaël', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Danty', 'Jonathan', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bielle-Biarrey', 'Louis', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jalibert', 'Matthieu', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Dupont', 'Antoine', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Alldritt', 'Grégory', 8, 'Numéro 8', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ollivon', 'Charles', 7, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jelonch', 'Anthony', 6, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Flament', 'Thibaud', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Woki', 'Cameron', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Atonio', 'Uini', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mauvaka', 'Peato', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Baille', 'Cyril', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bourgarit', 'Pierre', 15, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Wardi', 'Réda', 14, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aldegheri', 'Dorian', 15, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taofifenua', 'Romain', 13, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cros', 'François', 12, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Macalou', 'Sekou', 12, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lucu', 'Maxime', 13, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Moefana', 'Yoram', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Melvyn', 'Jaminet', 15, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='France'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Barrett', 'Jordie', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jordan', 'Will', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Reece', 'Sevu', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ioane', 'Rieko', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tupaea', 'Quinn', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Barrett', 'Beauden', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Smith', 'Aaron', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Savea', 'Ardie', 6, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Frizell', 'Shannon', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Papalii', 'Dalton', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Barrett', 'Scott', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Retallick', 'Brodie', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bower', 'George', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taylor', 'Codie', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tu ungafasi', 'Ofa', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Coles', 'Dane', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('McKenzie', 'Damian', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mo unga', 'Richie', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Christie', 'Finlay', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Blackadder', 'Ethan', 6, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sotutu', 'Hoskins', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ioane', 'Akira', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Va ai', 'Tupou', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jacobson', 'Luke', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tu inukuafe', 'Karl', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aumua', 'Asafo', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ta avao', 'Angus', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taukeiaho', 'Samisoni', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tele a', 'Mark', 12, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='New Zealand'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Capuozzo', 'Ange', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bruno', 'Pierre', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ioane', 'Montanna', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Brex', 'Juan Ignacio', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Morisi', 'Luca', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Garbisi', 'Paolo', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fusco', 'Alessandro', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Negri', 'Sebastian', 6, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Pettinelli', 'Giovanni', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lamaro', 'Michele', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cannone', 'Lorenzo', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lamb', 'Dino', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Zani', 'Federico', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Buonfiglio', 'Paolo', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nemer', 'Ivan', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nicotera', 'Giacomo', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Manfredi', 'Marco', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Allan', 'Tommaso', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Garbisi', 'Alessandro', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Varney', 'Stephen', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Zualiani', 'Manuel', 6, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sisi', 'David', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ceccarelli', 'Piertro', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Riccioni', 'Marco', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Manuel', 'Zuliani', 5, 'Flanker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faiva', 'Hame', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Odogwu', 'Paolo', 10, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Italy'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gigena', 'Facundo', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Leindekar', 'Juan Manuel', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sanguinetti', 'Mateo', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Arbelo', 'Diego', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kessler', 'Germán', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Pujol', 'Guillermo', 1, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Leindekar', 'Manuel', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Magno', 'Diego', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lamanna', 'Franco', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Vilaseca', 'Santiago', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Etcheverry', 'Felipe', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ardao', 'Diego', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gaminara', 'Juan Manuel', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Arata', 'Santiago', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Berchesi', 'Felipe', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Vilaseca', 'Andrés', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('de Benedictis', 'Juan Ignacio', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Etcheverry', 'Felipe', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Silva', 'Rodrigo', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Segredo', 'Leandro', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Benitez', 'Matias', 16, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gibert', 'Juan Pablo', 17, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Carballo', 'Manuel', 18, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ormaechea', 'Juan Diego', 19, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bianchi', 'Lucas', 20, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Arata', 'Santiago', 21, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Pintos', 'Juan Manuel', 22, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Freitas', 'Nicolás', 23, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Silva', 'Rodrigo', 24, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Leindekar', 'Juan Manuel', 25, 'Remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Uruguay'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Steyn', 'Gerhard', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Klaus', 'Titus', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Louw', 'Leslie', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van Wyk', 'Costello', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Steytler', 'Chad', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kaumbuse', 'Ruan', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van Zyl', 'Hendrikus', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Basson', 'Werner', 8, 'Numéro 8', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Steytler', 'Jacques', 7, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Strauss', 'Dewald', 6, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('De la Harpe', 'Mekondjo', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van Rooyen', 'Adriaan', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van der Merwe', 'Leonard', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van Wyk', 'Nico', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nami', 'Gerhard', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van Heerden', 'Willie', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Scholtz', 'Johan', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nghumbu', 'Ricardo', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Britz', 'Werner', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('De Klerk', 'Wessel', 7, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Klaus', 'Titus', 8, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Naude', 'Wikus', 10, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nami', 'Hennie', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mouton', 'Gerswin', 13, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Swanepoel', 'Tiaan', 10, 'Demi ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom='Namibia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Healy', 'Andrew', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Herring', 'Rob', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Furlong', 'Tadhg', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ryan', 'James', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Henderson', 'James', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Beirne', 'Tadhg', 6, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Van der Flier', 'Josh', 7, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('O Mahony', 'Peter', 8, 'Numéro 8', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Conway', 'James', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Henshaw', 'Robbie', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ringrose', 'Garry', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sexton', 'Johnny', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Murray', 'Conor', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gibson-Park', 'Jamison', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Keenan', 'Hugo', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Beirne', 'Tadhg', 6, 'Troisième ligne aile', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aki', 'Bundee', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('McCarthy', 'Joe', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Crowley', 'Jack', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Ireland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nche', 'Ox', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kitshoff', 'Steven', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nyakane', 'Trevor', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mbonambi', 'Bongi', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Etzebeth', 'Eben', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('de Jager', 'Lood', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kolisi', 'Siya', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('du Toit', 'Pieter-Steph', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mostert', 'Franco', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('de Allende', 'Damian', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Am', 'Lukhanyo', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Libbok', 'Manie', 11, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mapimpi', 'Makazole', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('de Klerk', 'Faf', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Pollard', 'Handré', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Koch', 'Vincent', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Malherbe', 'Frans', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mchunu', 'Ntuthuko', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Marx', 'Malcolm', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Orie', 'Marvin', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Snyman', 'RG', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Smith', 'Kwagga', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Wiese', 'Jasper', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Roos', 'Evan', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kriel', 'Jesse', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Willemse', 'Damian', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Reinach', 'Cobus', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'South Africa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sutherland', 'Rory', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fagerson', 'Zander', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Schoeman', 'Pierre', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('McInally', 'Stuart', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gilchrist', 'Grant', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gray', 'Jonny', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Watson', 'Hamish', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Darge', 'Rory', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Skinner', 'Sam', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Johnson', 'Sam', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Harris', 'Chris', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Graham', 'Darcy', 14, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('van der Merwe', 'Duhan', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Price', 'Ali', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Russell', 'Finn', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nel', 'WP', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Berghan', 'Simon', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sebastian', 'Javan', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Turner', 'George', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Skinner', 'Sam', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cummings', 'Scott', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bradbury', 'Magnus', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fagerson', 'Matt', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bennett', 'Mark', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Steyn', 'Kyle', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kinghorn', 'Blair', 14, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('McLean', 'Rufus', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Steele', 'Scott', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Thompson', 'Ross', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Healy', 'Ben', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Scotland'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taukei aho', 'Sione', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Talakai', 'Latu', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tameifuna', 'Ben', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fisilau', 'Samisoni', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lousi', 'Sam', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kalamafoni', 'Sione', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Timani', 'Lopeti', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tuipulotu', 'Sione', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ahki', 'Pita', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fekitoa', 'Malakai', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Piutau', 'Siale', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Veainu', 'Telusa', 14, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taumoepeau', 'Afusipa', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Takulua', 'Sonatane', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ngatia', 'Kalione', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fisi iahi', 'Siegfried', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tu ungafasi', 'Ofa', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fa amausili', 'Soane', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Halanukonuka', 'Siua', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fifita', 'Halalefa', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mailau', 'Fotuaika', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Koloamatangi', 'Tevita', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lam', 'Jack', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kalamafoni', 'Sione', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fine', 'Viliam', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faleafa', 'Daniel', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fukofuka', 'Leon', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Tonga'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ursache', 'Andrei', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Balan', 'Vasile', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Savin', 'Alexandru', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Surugiu', 'Florin', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Toader', 'Andrei', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ionita', 'Adrian', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Rosu', 'Florian', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Boboc', 'Cristi', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Vlad', 'Andrei', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Barba', 'Ionel', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mocuta', 'George', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Macovei', 'Mihai', 14, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Stratila', 'Denis', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Popa', 'Vladut', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Vlaicu', 'Florin', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Rupanu', 'Gabriel', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tarus', 'Alexandru', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Furtuna', 'Costin', 2, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gurita', 'Constantin', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Macovei', 'Mihai', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Antonescu', 'Marius', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Marginean', 'Adrian', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Alexe', 'Alexandru', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ursache', 'Andrei', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Iancu', 'Stefan', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Simionescu', 'Marius', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Onutu', 'Nicholas', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faleafa', 'Daniel', 15, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fukofuka', 'Leon', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faiva', 'James', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Romania'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Smith', 'Nicky', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lake', 'Dewi', 2, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lewis', 'Dillon', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tshiunza', 'Christ', 4, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jenkins', 'Daffydd', 5, 'Lock', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Morgan', 'Jac', 6, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lydiate', 'Dan', 7, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faletau', 'Taulupe', 8, 'Back-row', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Davies', 'Gareth', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Biggar', 'Dan', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Dyer', 'Rio', 11, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Williams', 'George', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Grady', 'Mason', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Rees-Zammit', 'Louis', 14, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Halfpenny', 'Leigh', 15, 'Full-back', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Thomas', 'Gareth', 1, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Evans', 'Henry', 2, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Thomas', 'Nick', 3, 'Prop', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Griffiths', 'Ryan', 21, 'Hooker', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Adams', 'Josh', 11, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tompkins', 'Nick', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Williams', 'Johnny', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Williams', 'Liam', 14, 'Wing', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Anscombe', 'Gareth', 10, 'Fly-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Costelow', 'Sam', 9, 'Scrum-half', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Wales'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mawi', 'Eroni', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ravai', 'Peni', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Togiatama', 'Zuriel', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ikaninevere', 'Tevita', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Matavesi', 'Samuel', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nasilasila', 'Isoa', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tagi', 'Luke', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ratuniyarawa', 'jjjj', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Botia', 'Levani', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Derenalagi', 'Meli', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mata', 'Viliame', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lomani', 'Frank', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Botitu', 'Vilimoni', 10, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Volavola', 'Ben', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cirikidaveta', 'Te Ahiwaru', 11, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nayacalevu', 'Waisea', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tuivasa-Sheck', 'Setareki', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Habosi', 'Vinaya', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Radradra', 'Semi', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Droasese', 'Ilaisa', 11, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Uluialakepa', 'Kaliopasi', 16, 'Pilier remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lutumailagi', 'Joeli', 17, 'Pilier remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kunavula', 'Mesulame', 18, 'Talonneur remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Saulo', 'Manasa', 19, 'Talonneur remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Fiji'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faessler', 'Matt', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Uelese', 'Jordan', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Swain', 'Darcy', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Porecki', 'David', 15, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('McReight', 'Fraser', 12, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Rodda', 'Izack', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Swain', 'Darcy', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Salakaia-Loto', 'Lukhan', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Hooper', 'Michael', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Valetini', 'Rob', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Samu', 'Pete', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('White', 'Nic', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Donaldson', 'Ben', 10, 'FIVE-EIGHTHS', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cooper', 'Quade', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lolesio', 'Noah', 11, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kerevi', 'Samu', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Paisami', 'Hunter', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kerevi', 'Darcy', 11, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Koroibete', 'Marika', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Banks', 'Tom', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nawaqanitawase', 'Mark', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Slipper', 'James', 12, 'Pilier remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sio', 'Scott', 12, 'Pilier remplaçant', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Petaia', 'Jordan', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Australia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Simões', 'Bruno', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cabral', 'Henrique', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bettencourt', 'Pedro', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Simões', 'João', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bento', 'Simão', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Monteiro', 'António', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tavares', 'Gonçalo', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ferreira', 'Diogo', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Araújo', 'João Diogo', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Rodrigues', 'João Pedro', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Senra', 'Diogo', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nunes Pinto', 'João', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Santos', 'Nuno', 21, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Borges', 'Gonçalo', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Simões', 'Rafael', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Belo', 'João', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Marta', 'Rodrigo', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Portela', 'Jerónimo', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bruno', 'Francisco', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Madeira', 'José', 11, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Portugal'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kveseladze', 'Giorgi', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Chilachava', 'Levan', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gigashvili', 'Beka', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gogichashvili', 'Guram', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nariashvili', 'Mikheil', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bregvadze', 'Jaba', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mamukashvili', 'Shalva', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jaiani', 'Lasha', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Giorgadze', 'Otar', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Saginadze', 'Beka', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kubriashvili', 'David', 18, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tkhilaishvili', 'Giorgi', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lobzhanidze', 'Vasil', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aprasidze', 'Gela', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sharikadze', 'Merab', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Khmaladze', 'Lasha', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Niniashvili', 'Davit', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Todua', 'Sandro', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Khwarashvili', 'Davit', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Matiashvili', 'Soso', 3, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jalagoniya', 'Tornike', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Javakhishvili', 'Giorgi', 11, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tsutskiridze', 'Giorgi', 5, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Giorgadze', 'Otar', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tcheishvili', 'Nodar', 10, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gogodze', 'Giorgi', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tsiklauri', 'Beka', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Abzhandadze', 'Tedo', 6, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aprasidze', 'Davit', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Georgia'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Genge', 'Ellis', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sinckler', 'Kyle', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Stuart', 'Will', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Heyes', 'Joe', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Rodd', 'Bevan', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('George', 'Jamie', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cowan-Dickie', 'Luke', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Itoje', 'Maro', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Hill', 'Jonny', 7, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ewels', 'Charlie', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Isiekwe', 'Nick', 14, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lawes', 'Courtney', 9, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Underhill', 'Sam', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Curry', 'Tom', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ludlam', 'Lewis', 11, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Willis', 'Jack', 12, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Hill', 'Ted', 13, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Youngs', 'Ben', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Randall', 'Harry', 14, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Farrell', 'Owen', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Smith', 'Marcus', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ford', 'George', 11, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tuilagi', 'Manu', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Marchant', 'Joe', 14, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Daly', 'Elliot', 15, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('May', 'Jonny', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nowell', 'Jack', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Watson', 'Anthony', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Malins', 'Max', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Farell', 'Owen', 12, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Furbank', 'George', 12, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'England'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kveseladze', 'Giorgi', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Chilachava', 'Levan', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gigashvili', 'Beka', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gogichashvili', 'Guram', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nariashvili', 'Mikheil', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bregvadze', 'Jaba', 16, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mamukashvili', 'Shalva', 17, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jaiani', 'Lasha', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Giorgadze', 'Otar', 7, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Saginadze', 'Beka', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kubriashvili', 'Davit', 18, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tkhilaishvili', 'Giorgi', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Saginadze', 'Beka', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bruni', 'Rodrigo', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Javakhishvili', 'Giorgi', 11, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lobzhanidze', 'Vasil', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aprasidze', 'Gela', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sharikadze', 'Merab', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Khmaladze', 'Lasha', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Boffelli', 'Emiliano', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Todua', 'Sandro', 14, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Khwarashvili', 'Davit', 15, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Begadze', 'Giorgi', 16, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jalagonia', 'Tornike', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Javakhishvili', 'Giorgi', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tsutskiridze', 'Giorgi', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Giorgadze', 'Otar', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tcheishvili', 'Nodar', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gigashvili', 'Beka', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gorgadze', 'Giorgi', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tsiklauri', 'Beka', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Abzhandadze', 'Tedo', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Aprasidze', 'Davit', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Argentina'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Inagaki', 'Keita', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Noguchi', 'Issei', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ai Valu', 'Asaeli', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Kim', 'Jiwon', 4, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sakate', 'Atsushi', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Horie', 'Shota', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Cornelsen', 'Jack', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('van der Walt', 'Wimpie', 7, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Koo', 'Jiwon', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Niwai', 'Yusuke', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Labuschagne', 'Pieter', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Gunter', 'Ben', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fakatava', 'Amato', 12, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fukui', 'Shota', 13, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Yamanaka', 'Ryohei', 14, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tamura', 'Yu', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Shigeno', 'Kaito', 10, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Matsuda', 'Rikiya', 11, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lee', 'Seung Sin', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nakamura', 'Ryoto', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nakano', 'Shogo', 14, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lafaele', 'Timothy', 15, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Matsushima', 'Kotaro', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Yamanaka', 'Ryohei', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Riley', 'Dylan', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Yamanaka', 'Ryohei', 14, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tamura', 'Yu', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Japan'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mapusua', 'Seilala', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Alaalatoa', 'Michael', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lay', 'Jordan', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Mulipola', 'Logovi i', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lam', 'Seilala', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Matu u', 'Motu', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Jones', 'Michael', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lousi', 'Sam', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Vui', 'Chris', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tyrell', 'Josh', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ioane', 'TJ', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fa asalele', 'Piula', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Vailanu', 'Sione', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taefu', 'Henry', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Faleali i', 'Auvasa', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Read', 'Kieran', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taefu', 'Henry', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Leuila', 'D Angelo', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Nanai-Williams', 'Tim', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fidow', 'Ed', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tuipulotu', 'Timoci', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tuala', 'Ahsee', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Seuteni', 'Ulupano', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Amosa', 'Afaesetiti', 12, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lemalu', 'Fa atiga', 10, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lam', 'Jack', 5, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Talanoa', 'Fetuli', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Taumateine', 'Jonathan', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Tuilagi', 'Henry', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Samoa', 'Manu', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Ahki', 'Pita', 8, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lam', 'AJ', 9, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Samoa'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Dussaillant', 'Tomás', 1, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Bohme', 'Augusto', 2, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Escobar', 'Diego', 3, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Martínez', 'Raimundo', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sigren', 'Martín', 2, 'Talonneur', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Alarcón', 'Manuel', 4, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Eissmann', 'Javier', 5, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Dittus', 'Matías', 6, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Edwards', 'Santiago', 7, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Escobar', 'Alfonso', 8, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Orchard', 'Thomas', 9, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Videla', 'Alfonso', 10, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Carvallo', 'Lukas', 9, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sigren', 'Martín', 10, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Urroz', 'Francisco', 10, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Garafulic', 'Matías', 12, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Larenas', 'José Ignacio', 13, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Saavedra', 'Domingo', 14, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Orchard', 'Thomas', 11, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Lues', 'Salvador', 12, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Velarde', 'Franco', 13, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Fernandez', 'Rodrigo', 15, 'Arrière', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sarmiento', 'Augusto', 6, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Retamal', 'Augusto', 6, 'Pilier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Dittus', 'Matías', 8, 'Deuxième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Escobar', 'Alfonso', 4, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Silva', 'Ignacio', 3, 'Troisième ligne', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Sigren', 'Martín', 12, 'Demi de mêlée', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Garafulic', 'Matías', 10, 'Centre', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Velarde', 'Franco', 6, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Orchard', 'Thomas', 6, 'Ailier', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

INSERT INTO P01_Joueur(Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste, Equipe_Id)
VALUES ('Carvallo', 'Lukas', 12, 'Demi d ouverture', (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom = 'Chile'));

-- Alimentation de la table P01_Appartient
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

-- Alimentation de la table P01_Oppose à partir des matchs de toutes les poules
INSERT INTO P01_Oppose (Match_Id, Equipe_Id)
SELECT R.Match_Id, Eq.Equipe_Id
FROM P01_Rencontre R
NATURAL JOIN P01_Equipe Eq
WHERE Eq.Equipe_Nom = R.Equipe1
   OR Eq.Equipe_Nom = R.Equipe2;

-- Alimentation de la table P01_MatchJoueurStat

INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT

       (SELECT Match_Id FROM P01_Rencontre
                        WHERE(Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                           OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Penaud' AND Joueur_Prenom = 'Damian'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Damian' AND Joueur_Nom='Penaud'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom ='Damian' AND Joueur_Nom='Penaud'),
       1,0,0,0
FROM dual;


INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Melvyn' AND Joueur_Prenom = 'Jaminet'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jaminet' AND Joueur_Nom='Melvyn'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jaminet' AND Joueur_Nom='Melvyn'),
       1,0,0,0
FROM dual;


     INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT

(SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Thomas' AND Joueur_Nom = 'Ramos'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Thomas' AND Joueur_Nom='Ramos'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Thomas' AND Joueur_Nom='Ramos'),
       0,5,1,0
FROM dual;


INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Mark' AND Joueur_Nom = 'Tele a'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Mark' AND Joueur_Nom='Tele a'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Mark' AND Joueur_Nom='Tele a'),
       2,0,0,0
FROM dual;


INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'France' AND Equipe2 = 'New Zealand')
                         OR (Equipe1 = 'New Zealand' AND Equipe2 = 'France') AND Tour='Poule A' ),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom='Mo unga'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom='Mo unga'),
       0,1,0,0
FROM dual;

INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
         (SELECT Match_Id FROM P01_Rencontre
                          WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                             OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Lorenzo' AND Joueur_Nom = 'Cannone'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Lorenzo' AND Joueur_Nom='Cannone'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Lorenzo' AND Joueur_Nom='Cannone'),
       1,0,0,0
FROM dual;

INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Paolo' AND Joueur_Nom = 'Garbisi'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Garbisi'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Garbisi'),
       1,0,0,0
FROM dual;


INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Dino' AND Joueur_Nom = 'Lamb'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Dino' AND Joueur_Nom='Lamb'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Dino' AND Joueur_Nom='Lamb'),
       1,0,0,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Ange' AND Joueur_Nom = 'Capuozzo'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Ange' AND Joueur_Nom='Capuozzo'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Ange' AND Joueur_Nom='Capuozzo'),
       1,0,0,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Hame' AND Joueur_Nom = 'Faiva'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Hame' AND Joueur_Nom='Faiva'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Hame' AND Joueur_Nom='Faiva'),
       1,0,0,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Zuliani' AND Joueur_Nom = 'Manuel'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Zuliani' AND Joueur_Nom='Manuel'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Zuliani' AND Joueur_Nom='Manuel'),
       1,0,0,0
FROM dual;




INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Paolo' AND Joueur_Nom = 'Odogwu'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Odogwu'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Paolo' AND Joueur_Nom='Odogwu'),
       1,0,0,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Tommaso' AND Joueur_Nom = 'Allan'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Tommaso' AND Joueur_Nom='Allan'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Tommaso' AND Joueur_Nom='Allan'),
       0,1,7,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Gerswin' AND Joueur_Nom = 'Mouton'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Gerswin' AND Joueur_Nom='Mouton'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Gerswin' AND Joueur_Nom='Mouton'),
       1,0,0,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Italy' AND Equipe2 = 'Namibia')
                         OR (Equipe1 = 'Namibia' AND Equipe2 = 'Italy') AND Tour='Poule A'),
       (SELECT Joueur_Id FROM P01_Joueur WHERE  Joueur_Prenom = 'Tiaan' AND Joueur_Nom = 'Swanepoel'),
       (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Tiaan' AND Joueur_Nom='Swanepoel'),
       (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Tiaan' AND Joueur_Nom='Swanepoel')
       ,1,0,0,0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
    (SELECT Match_Id FROM P01_Rencontre
                      WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                         OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Gibson-Park' AND Joueur_Prenom = 'Jamison'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jamison' AND Joueur_Nom = 'Gibson-Park'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jamison' AND Joueur_Nom = 'Gibson-Park'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Keenan' AND Joueur_Prenom = 'Hugo'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Hugo' AND Joueur_Nom = 'Keenan'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Hugo' AND Joueur_Nom = 'Keenan'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Aki' AND Joueur_Prenom = 'Bundee'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Bundee' AND Joueur_Nom = 'Aki'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Bundee' AND Joueur_Nom = 'Aki'),
        2, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Sexton' AND Joueur_Prenom = 'Johnny'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Johnny' AND Joueur_Nom = 'Sexton'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Johnny' AND Joueur_Nom = 'Sexton'),
        2, 0, 7, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Herring' AND Joueur_Prenom = 'Rob'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rob' AND Joueur_Nom = 'Herring'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rob' AND Joueur_Nom = 'Herring'),
        2, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'O Mahony' AND Joueur_Prenom = 'Peter'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Peter' AND Joueur_Nom = 'O Mahony'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Peter' AND Joueur_Nom = 'O Mahony'),
        2, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'McCarthy' AND Joueur_Prenom = 'Joe'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Joe' AND Joueur_Nom = 'McCarthy'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Joe' AND Joueur_Nom = 'McCarthy'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland')AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Crowley' AND Joueur_Prenom = 'Jack'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jack' AND Joueur_Nom = 'Crowley'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jack' AND Joueur_Nom = 'Crowley'),
        0, 0, 4, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Ireland' AND Equipe2 = 'Romania')
                            OR (Equipe1 = 'Romania' AND Equipe2 = 'Ireland') AND Tour='Poule B'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Rupanu' AND Joueur_Prenom = 'Gabriel'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Gabriel' AND Joueur_Nom = 'Rupanu'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Gabriel' AND Joueur_Nom = 'Rupanu'),
        1, 1, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT

        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'Argentina')
                            OR (Equipe1 = 'Argentina' AND Equipe2 = 'England') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Ford' AND Joueur_Prenom = 'George'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'George' AND Joueur_Nom = 'Ford'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'George' AND Joueur_Nom = 'Ford'),
        0, 6, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'Argentina')
                            OR (Equipe1 = 'Argentina' AND Equipe2 = 'England') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Bruni' AND Joueur_Prenom = 'Rodrigo'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Bruni'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Bruni'),
        1, 1, 1, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'Argentina')
                            OR (Equipe1 = 'Argentina' AND Equipe2 = 'England') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Boffelli' AND Joueur_Prenom = 'Emiliano'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        0, 1, 1, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Fakatava' AND Joueur_Prenom = 'Amato'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Amato' AND Joueur_Nom = 'Fakatava'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Amato' AND Joueur_Nom = 'Fakatava'),
        2, 0, 1, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Matsuda' AND Joueur_Prenom = 'Rikiya'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rikiya' AND Joueur_Nom = 'Matsuda'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rikiya' AND Joueur_Nom = 'Matsuda'),
        0, 0, 6, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Fernandez' AND Joueur_Prenom = 'Rodrigo'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Fernandez'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Rodrigo' AND Joueur_Nom = 'Fernandez'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
        (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Japan' AND Equipe2 = 'Chile')
                            OR (Equipe1 = 'Chile' AND Equipe2 = 'Japan') AND Tour='Poule D'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Videla' AND Joueur_Prenom = 'Alfonso'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Alfonso' AND Joueur_Nom = 'Videla'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Alfonso' AND Joueur_Nom = 'Videla'),
        0, 0, 1, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
    (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'New Zealand' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'New Zealand') AND Tour = 'Finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Barrett' AND Joueur_Prenom = 'Beauden'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Beauden' AND Joueur_Nom = 'Barrett'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Beauden' AND Joueur_Nom = 'Barrett'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'New Zealand' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'New Zealand') AND Tour = 'Finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Mo unga' AND Joueur_Prenom = 'Richie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        0, 2, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'New Zealand' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'New Zealand') AND Tour = 'Finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Pollard' AND Joueur_Prenom = 'Handré'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        0, 4, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Farrell' AND Joueur_Prenom = 'Owen'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Owen' AND Joueur_Nom = 'Farrell'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Owen' AND Joueur_Nom = 'Farrell'),
        0, 4, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Snyman' AND Joueur_Prenom = 'RG'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'RG' AND Joueur_Nom = 'Snyman'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'RG' AND Joueur_Nom = 'Snyman'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Pollard' AND Joueur_Prenom = 'Handré'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Handré' AND Joueur_Nom = 'Pollard'),
        0,2, 1, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
     (SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'England' AND Equipe2 = 'South Africa')
                            OR (Equipe1 = 'South Africa' AND Equipe2 = 'England') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Libbok' AND Joueur_Prenom = 'Manie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Manie' AND Joueur_Nom = 'Libbok'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Manie' AND Joueur_Nom = 'Libbok'),
        0, 1, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Boffelli' AND Joueur_Prenom = 'Emiliano'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Emiliano' AND Joueur_Nom = 'Boffelli'),
        0, 2, 0, 0
FROM dual;




INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Jordan' AND Joueur_Prenom = 'Will'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Will' AND Joueur_Nom = 'Jordan'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Will' AND Joueur_Nom = 'Jordan'),
        3,0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT

(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Barrett' AND Joueur_Prenom = 'Jordie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Jordie' AND Joueur_Nom = 'Barrett'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Jordie' AND Joueur_Nom = 'Barrett'),
        1, 0, 0, 0
FROM dual;



INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Frizell' AND Joueur_Prenom = 'Shannon'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Shannon' AND Joueur_Nom = 'Frizell'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Shannon' AND Joueur_Nom = 'Frizell'),
        3, 0, 0, 0
FROM dual;




INSERT INTO P01_MatchJoueurStat(Match_Id, Joueur_Id, Poste, Numero_Maillot, Essai, Penalite, Transformation, Nb_Drop)
SELECT
(SELECT Match_Id FROM P01_Rencontre
                         WHERE (Equipe1 = 'Argentina' AND Equipe2 = 'New Zealand')
                            OR (Equipe1 = 'New Zealand' AND Equipe2 = 'Argentina') AND Tour = 'Demi finale'),
        (SELECT Joueur_Id FROM P01_Joueur WHERE Joueur_Nom = 'Mo unga' AND Joueur_Prenom = 'Richie'),
        (SELECT Poste FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        (SELECT Numero_Maillot FROM P01_Joueur WHERE Joueur_Prenom = 'Richie' AND Joueur_Nom = 'Mo unga'),
        0, 1, 3, 0
FROM dual;


-- Création des vues
CREATE VIEW Vue_MatchsPlanifies AS
SELECT Match_Id, Date_Match, Lieu, Equipe1, Equipe2, Tour
FROM P01_Rencontre
WHERE Date_Match < SYSDATE;


-- Vue des Statistiques des Équipes :
CREATE OR REPLACE VIEW Vue_StatistiquesEquipes AS
SELECT
    Equipe_Id,
    Equipe_Nom,
    Nb_Victoire,
    Nb_MatchNul,
    Nb_Defaite,
    (Nb_Victoire * 3) + (Nb_MatchNul * 1) AS Points
FROM P01_Equipe;

--2
-- Vue des Joueurs par Équipe :
CREATE OR REPLACE VIEW Vue_JoueursParEquipe AS
SELECT
    E.Equipe_Id,
    E.Equipe_Nom,
    J.Joueur_Id,
    J.Joueur_Nom,
    J.Joueur_Prenom
FROM P01_Equipe E
JOIN P01_Joueur J ON E.Equipe_Id = J.Equipe_Id;



-- Création des procédures et fonctions

-- 1


CREATE OR REPLACE PROCEDURE EditerDonneesJoueur(
    p_JoueurId IN INT,
    p_NouveauNom IN VARCHAR2,
    p_NouveauPrenom IN VARCHAR2,
    p_NouveauNumeroMaillot IN INT,
    p_NouveauPoste IN VARCHAR2
) AS
    v_JoueurCount INT;
BEGIN
    -- Vérifier si le joueur avec l'ID spécifié existe
    SELECT COUNT(*) INTO v_JoueurCount FROM P01_Joueur WHERE Joueur_Id = p_JoueurId;

    -- Si le joueur n'a pas été trouvé, lever une exception
    IF v_JoueurCount = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Joueur non trouvé.');
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
-- 2

CREATE OR REPLACE FUNCTION NombreTotalJoueurs RETURN INT IS
    total INT;
BEGIN
    -- Utilisation de la clause INTO pour stocker le résultat de la requête SELECT
    SELECT COUNT(*) INTO total FROM P01_Joueur;

    -- Utilisation de RETURN pour renvoyer le résultat
    RETURN total;
END NombreTotalJoueurs;
/
-- 3

CREATE OR REPLACE FUNCTION NomsJoueursParEquipe(p_EquipeId INT) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT Joueur_Nom
        FROM P01_Joueur
        WHERE Equipe_Id = p_EquipeId;

    -- Retourner le curseur ouvert
    RETURN v_cursor;
END NomsJoueursParEquipe;
/

-- 4

CREATE OR REPLACE FUNCTION InfosJoueursParEquipe(p_EquipeId INT) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT Joueur_Nom, Joueur_Prenom, Numero_Maillot, Poste
        FROM P01_Joueur
        WHERE Equipe_Id = p_EquipeId;

    -- Retourner le curseur ouvert
    RETURN v_cursor;
END InfosJoueursParEquipe;
/


-- Création des triggers
-- Pour chaque ligne (FOR EACH ROW)
CREATE OR REPLACE TRIGGER InitialisationStatEquipeRow
BEFORE UPDATE OF Equipe_Nom ON P01_Equipe
FOR EACH ROW

BEGIN
    IF :OLD.Equipe_Nom <> :NEW.Equipe_Nom THEN
        :NEW.Nb_Victoire := 0;
        :NEW.Nb_MatchNul := 0;
        :NEW.Nb_Defaite := 0;
        :NEW.Essai := 0;
        :NEW.Penalite := 0;
        :NEW.Transformation := 0;
        :NEW.Nb_Drop := 0;
        :NEW.Bonus_Defensif := 0;
        :NEW.Bonus_Offensif := 0;
    END IF;
END;
/
-- Pour chaque déclaration (FOR EACH STATEMENT)
CREATE OR REPLACE TRIGGER InitialisationStatEquipeStatement
AFTER UPDATE OF Equipe_Nom ON P01_Equipe
BEGIN
    UPDATE P01_Equipe
    SET Nb_Victoire = 0,
        Nb_MatchNul = 0,
        Nb_Defaite = 0,
        Essai = 0,
        Penalite = 0,
        Transformation = 0,
        Nb_Drop = 0,
        Bonus_Defensif = 0,
        Bonus_Offensif = 0
    WHERE Equipe_Id IN (SELECT Equipe_Id FROM P01_Equipe WHERE Equipe_Nom <> Equipe_Nom);
END;
/