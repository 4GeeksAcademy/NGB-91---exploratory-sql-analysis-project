-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;


SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id 
GROUP BY regions.name, regions.country
ORDER BY total_species DESC;


SELECT 
    strftime('%m', observations.observation_date) AS month,
    COUNT(*) AS total
FROM observations
GROUP BY month
ORDER BY total DESC;


SELECT 
    species.scientific_name,
    species.common_name,
    SUM(observations.count) AS total_count
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
HAVING total_count < 5
ORDER BY total_count ASC;



SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT observations.species_id) AS species_count
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY species_count DESC
LIMIT 1;


SELECT 
    species.scientific_name,
    species.common_name,
    COUNT(*) AS total_observations
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
ORDER BY total_observations DESC
LIMIT 10;


SELECT  
    observations.observer,
    COUNT(*) AS total
FROM observations
GROUP BY observations.observer
ORDER BY total DESC
LIMIT 10;


SELECT 
    species.scientific_name,
    species.common_name
FROM species
LEFT JOIN observations ON species_id = observations.species_id
WHERE observations.species_id IS NULL;


SELECT  
    observations.observation_date,
    COUNT(DISTINCT observations.species_id) AS distinct_species
FROM observations
GROUP BY observations.observation_date
ORDER BY distinct_species DESC
LIMIT 10;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;