-- Suppression des vues
DROP VIEW Vue_MatchsPlanifies;
DROP VIEW Vue_JoueursParEquipe;
DROP VIEW Vue_StatistiquesEquipes;

-- Supprimer le déclencheur
DROP TRIGGER InitialisationStatEquipeRow;
DROP TRIGGER InitialisationStatEquipeStatement;

-- Supprimer la procédure et les fonctions
DROP PROCEDURE EditerDonneesJoueur;
DROP FUNCTION InfosJoueursParEquipe;
DROP FUNCTION NombreTotalJoueurs;
DROP FUNCTION NomsJoueursParEquipe;


-- Supprimer les sequences
DROP SEQUENCE SEQ_JOUEUR;
DROP SEQUENCE SEQ_EQUIPE;
DROP SEQUENCE SEQ_MATCH;
-- Suppression des tables
DROP TABLE P01_Appartient CASCADE CONSTRAINTS;
DROP TABLE P01_MatchJoueurStat CASCADE CONSTRAINTS;
DROP TABLE P01_Oppose CASCADE CONSTRAINTS;
DROP TABLE P01_Joueur CASCADE CONSTRAINTS;
DROP TABLE P01_Equipe CASCADE CONSTRAINTS;
DROP TABLE P01_Rencontre CASCADE CONSTRAINTS;