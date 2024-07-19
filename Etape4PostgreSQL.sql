-- Procedure PostgreSQL
-- 1 Donner une procédure permettant l'édition de données en fonctions de paramètres d'entrée

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


select EditerDonneesJoueur(1, 'NouveauNom', 'NouveauPrenom', 10, 'NouveauPoste');


-- 2

CREATE OR REPLACE FUNCTION NombreTotalJoueurs() RETURNS INT AS
$$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM P01_Joueur;
    RETURN total;
END;
$$ LANGUAGE plpgsql;


SELECT NombreTotalJoueurs();

-- 3
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


SELECT * FROM NomsJoueursParEquipe(1);


-- 4

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

SELECT * FROM InfosJoueursParEquipe(1);

-- Vues PostgreSQL

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
WHERE Date_Match < CURRENT_DATE;

-- Triggers
-- Création des triggers
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
