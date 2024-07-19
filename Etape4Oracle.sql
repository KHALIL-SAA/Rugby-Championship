-- Procedure Oracle
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
/

BEGIN
    EditerDonneesJoueur(580, 'NouveauNom', 'NouveauPrenom', 10, 'NouveauPoste');
END;
/

/
select * from P01_JOUEUR where NUMERO_MAILLOT = 10;


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


DECLARE
    result INT;
BEGIN
    result := NombreTotalJoueurs;
    DBMS_OUTPUT.PUT_LINE('Nombre total de joueurs : ' || result);
END;
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


DECLARE
    v_nom_joueur VARCHAR2(200);
    v_cursor SYS_REFCURSOR;
BEGIN
    -- Appel de la fonction
    v_cursor := NomsJoueursParEquipe(15);

    -- Boucle pour récupérer et afficher les résultats du curseur
    LOOP
        FETCH v_cursor INTO v_nom_joueur;
        EXIT WHEN v_cursor%NOTFOUND;

        -- Afficher le nom du joueur
        DBMS_OUTPUT.PUT_LINE('Nom du joueur : ' || v_nom_joueur);
    END LOOP;

    -- Fermer le curseur après utilisation
    CLOSE v_cursor;
END;
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


DECLARE
    v_cursor SYS_REFCURSOR;
    v_Joueur_Nom VARCHAR2(200);
    v_Joueur_Prenom VARCHAR2(200);
    v_Numero_Maillot INT;
    v_Poste VARCHAR2(30);
BEGIN
    -- Appel de la fonction
    v_cursor := InfosJoueursParEquipe(15);

    -- Boucle pour récupérer les résultats du curseur
    LOOP
        FETCH v_cursor INTO v_Joueur_Nom, v_Joueur_Prenom, v_Numero_Maillot, v_Poste;
        EXIT WHEN v_cursor%NOTFOUND;

        -- Utilisez les variables comme nécessaire
        DBMS_OUTPUT.PUT_LINE('Nom du joueur : ' || v_Joueur_Nom || ', Prénom : ' || v_Joueur_Prenom || ', Maillot : ' || v_Numero_Maillot || ', Poste : ' || v_Poste);
    END LOOP;

    -- Fermer le curseur après utilisation
    CLOSE v_cursor;
END;
/

-- Vues Oracle 

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


-- Vue des Matchs Planifiés :
CREATE OR REPLACE VIEW Vue_MatchsPlanifies AS
SELECT
    Match_Id,
    Date_Match,
    Lieu,
    Equipe1,
    Equipe2,
    Tour
FROM P01_Rencontre
WHERE Date_Match < SYSDATE;


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