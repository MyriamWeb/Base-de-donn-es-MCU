**Je crée les colonnes pour conserver la date de création et la dernière date de modification des entrées**

ALTER TABLE actors
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE film
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

*****************************
**Date de sortie et titres des films du plus recent au plus ancien**

SELECT release_date FROM `movies` ORDER BY release_date DESC
****************************
**Les noms, prénoms et ages des acteurs de plus de 30 ans dans l'ordre alphabétique**

SELECT last_name, first_name, year(NOW())-year(date_Birth) AS age FROM actors WHERE year(NOW())-year(date_Birth)>30 ORDER BY last_name ASC
***************************
**La liste des acteurs pour un film donné**

SELECT `last_name`,`first_name` 
FROM intermediaries 
LEFT JOIN movies ON intermediaries.id_movie=movies.id_movie 
LEFT JOIN actors ON intermediaries.id_actor=actors.id_actor 
WHERE `movies`.`title` = "Thor"

****************************
**La liste des films pour un acteur donné**

SELECT title 
FROM intermediaries 
JOIN movies ON intermediaries.id_movie = movies.id_movie 
JOIN actors ON intermediaries.id_actor = actors.id_actor 
WHERE actors.last_name = "Pratt" 
ORDER BY movies.title ASC

****************************
**Requete pour ajouter un film**

INSERT INTO `movies`(`id_movie`, `title`, `director`, `release_date`, `duration`, `created_at`, `updated_at`) VALUES ("100","The Marvels","Nia DaCosta",'2022-11-09',130,NOW(),NOW())

**************************
**Requete pour ajouter un acteur**

INSERT INTO `actors`(`id_actor`, `last_name`, `first_name`, `date_Birth`, `created_at`, `updated_at`) VALUES ("100","Jackson","Samuel.L",'1948-12-21',NOW(),NOW())

**************************
**Requete pour modifier un film**

Update `movies`
SET `duration` = 120
WHERE `id_movie` = 2

**************************
**Requete pour supprimer un acteur**

DELETE FROM `actors`
WHERE `id_actor` = 100

**************************
**Afficher les 3 derniers acteurs ajoutés**

SELECT last_name, first_name, created_at 
FROM actors 
ORDER BY created_at DESC LIMIT 3
