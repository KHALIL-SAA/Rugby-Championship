
-- Suppression des vues
DROP VIEW IF EXISTS Vue_MatchsPlanifies;
DROP VIEW IF EXISTS Vue_JoueursParEquipe;
DROP VIEW IF EXISTS Vue_StatistiquesEquipes;

-- Supprimer le déclencheur
DROP TRIGGER trgInitialisationStatEquipeNom ON P01_Equipe;
DROP TRIGGER trgInitialisationStatEquipeNom2 ON P01_Equipe;

-- Supprimer la fonction
DROP FUNCTION initialisationStatEquipeNom;
DROP FUNCTION EditerDonneesJoueur;
DROP FUNCTION NombreTotalJoueurs;
DROP FUNCTION NomsJoueursParEquipe;
DROP FUNCTION InfosJoueursParEquipe;
-- On ne peut pas les sequences car on n a pas de sequence cree sur PostgreSQL
-- Suppression des tables
DROP TABLE IF EXISTS P01_Appartient CASCADE;
DROP TABLE IF EXISTS P01_MatchJoueurStat CASCADE;
DROP TABLE IF EXISTS P01_Oppose CASCADE;
DROP TABLE IF EXISTS P01_Joueur CASCADE;
DROP TABLE IF EXISTS P01_Equipe CASCADE;
DROP TABLE IF EXISTS P01_Rencontre CASCADE;