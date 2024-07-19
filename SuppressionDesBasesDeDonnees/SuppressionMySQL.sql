-- Suppression des contraintes étrangères
SET foreign_key_checks = 0;

-- Suppression des vues
DROP VIEW IF EXISTS Vue_MatchsPlanifies;
DROP VIEW IF EXISTS Vue_JoueursParEquipe;
DROP VIEW IF EXISTS Vue_StatistiquesEquipes;
-- On ne peut pas les sequences car on n a pas de sequence cree sur MySQL
-- Suppression des tables
DROP TABLE IF EXISTS P01_Appartient;
DROP TABLE IF EXISTS P01_MatchJoueurStat;
DROP TABLE IF EXISTS P01_Oppose;
DROP TABLE IF EXISTS P01_Joueur;
DROP TABLE IF EXISTS P01_Equipe;
DROP TABLE IF EXISTS P01_Rencontre;

-- Rétablissement des contraintes étrangères
SET foreign_key_checks = 1;