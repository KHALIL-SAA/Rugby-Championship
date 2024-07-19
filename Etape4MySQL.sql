-- Vues MySQL
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


-- Vue des Matchs Planifiés :
CREATE VIEW Vue_MatchsPlanifies AS
SELECT
    Match_Id,
    Date_Match,
    Lieu,
    Equipe1,
    Equipe2,
    Tour
FROM P01_Rencontre
WHERE Date_Match < CURDATE();