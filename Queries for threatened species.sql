-- How many species in each country are classified as "Endangered" and "Critically Endangered"
SELECT c.country_name, s.endangerment_status, COUNT(s.species_id) AS species_count
FROM Species s
JOIN Species_Country sc ON s.species_id = sc.species_id
JOIN Country c ON sc.country_id = c.country_id
WHERE s.endangerment_status IN ('Endangered', 'Critically Endangered')
GROUP BY c.country_name, s.endangerment_status
ORDER BY c.country_name, s.endangerment_status;

-- The total number of species in each endangerment category and the average number of species per country
SELECT 
    s.endangerment_status,
    COUNT(s.species_id) AS total_species,
    AVG(country_species.species_count) AS avg_species_per_country
FROM (
    SELECT 
        sc.country_id,
        s.endangerment_status,
        COUNT(s.species_id) AS species_count
    FROM Species s
    JOIN Species_Country sc ON s.species_id = sc.species_id
    GROUP BY sc.country_id, s.endangerment_status
) AS country_species
JOIN Species s ON country_species.endangerment_status = s.endangerment_status
GROUP BY s.endangerment_status;

-- The endangerment statuses that have a total species count greater than a 5.
SELECT 
    s.endangerment_status,
    COUNT(s.species_id) AS total_species
FROM Species s
JOIN Species_Country sc ON s.species_id = sc.species_id
GROUP BY s.endangerment_status
HAVING COUNT(s.species_id) > 5;