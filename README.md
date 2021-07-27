**Je crée les colonnes pour conserver la date de création et la dernière date de modification des entrées**********

ALTER TABLE actors
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE film
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


**Date de sortie et titres des films du plus recent au plus ancien ***********

SELECT `title`, `relesae_date` FROM `film` ORDER BY `release_date` DESC;


**Les noms, prénoms et ages des acteurs de plus de 30 ans dans l'ordre alphabétique**********

SELECT last_name, first_name, year(NOW())-year(date_Birth) AS age FROM actors WHERE year(NOW())-year(date_Birth)>30 ORDER BY last_name ASC

**La liste des acteurs pour un film donné******************



**La liste des films pour un acteur donné******************




