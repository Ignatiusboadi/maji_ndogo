USE md_water_services;
SHOW TABLES;
RENAME TABLE employee to workers;
RENAME TABLE workers to employee;
SET SQL_SAFE_UPDATES = 0;

SELECT count(*) FROM visits; -- see number of rows in visits table

SHOW COLUMNS FROM water_source; -- see columns in water_source table

SELECT * FROM data_dictionary; -- see data dictionary

SELECT location_id, source_id, visit_count from visits order by location_id, source_id;

SELECT DISTINCT type_of_water_source FROM water_source; -- view the unique water sources

SELECT DISTINCT visit_count FROM visits;

SELECT * FROM visits WHERE visit_count > 5; -- see locations which have been visited more than 5 times

SELECT MAX(subjective_quality_score), MIN(subjective_quality_score) FROM water_quality; -- identify the range of values in the column subjective_quality_score

SELECT * FROM water_quality
WHERE
	subjective_quality_score BETWEEN 7 AND 9
AND 
	visit_count < 4;

SELECT * FROM employee LIMIT 5;
SELECT * FROM global_water_access Limit 5;
SELECT * FROM location LIMIT 5;
SELECT * FROM visits Limit 5;
SELECT * FROM water_quality LIMIT 5;
SELECT * FROM water_source Limit 5;
SELECT * FROM well_pollution LIMIT 5;

SELECT * FROM visits WHERE time_in_queue > 500;
SELECT * FROM water_source WHERE source_id in ("AkRu05234224", "HaZa21742224");
SELECT * FROM water_source WHERE source_id LIKE "Ak%" OR source_id LIKE 'Ha%';

SELECT * FROM water_quality 
WHERE subjective_quality_score = 10
AND visit_count = 2;

SELECT * FROM well_pollution
WHERE biological > 0.01
AND results = 'Clean';

SELECT * FROM well_pollution
WHERE description LIKE 'Clean%' AND biological > 0.01;

UPDATE well_pollution
SET results = 'biological'
WHERE biological > 0.01;

UPDATE well_pollution
SET description = SUBSTRING(description, 7)
WHERE description = 'Clean Bacteria: E. coli';

UPDATE well_pollution
SET description = SUBSTRING(description, 7)
WHERE description = 'Clean Bacteria: Giardia Lamblia';

UPDATE well_pollution
SET results = 'Contaminated: Biological'
WHERE biological > 0.01 AND results = 'Clean';

SELECT DISTINCT description FROM well_pollution WHERE biological > 0.01; 

-- Quiz Questions answering
SELECT address, employee_name FROM employee WHERE employee_name = 'Bello Azibo'; -- Address of Bello Azibo
SELECT DISTINCT position FROM employee ORDER BY position; -- View distinct positions
SELECT employee_name, phone_number, position FROM employee WHERE position = 'Micro Biologist'; -- name and phone number of Microbiologist
SELECT * FROM data_dictionary WHERE description LIKE '%population%';
SELECT name, pop_n FROM global_water_access WHERE name LIKE 'maji%'; -- population of Maji Ndogo
SELECT DISTINCT position FROM employee ORDER BY position;
SELECT * FROM employee
WHERE town_name = 'Dahabu' AND (position = 'Civil Engineer' OR address LIKE '%Avenue%'); -- employees who are civil engineers residing in Dahabu or living on an avenue

-- query to identify an employee whose phone number contained 11 or 86; last name started with either an A or M and was a field surveyor
SELECT employee_name, phone_number, position FROM employee
WHERE (employee_name LIKE '% A%' OR employee_name LIKE '% M%') AND
(phone_number LIKE '%86%' OR phone_number LIKE '%11%') AND
position = 'Field Surveyor';

SELECT * FROM well_pollution
WHERE description LIKE 'Clean_%' OR results = 'Clean' AND biological < 0.01;

-- records with a quality score of 10 visited more than once
SELECT * FROM water_quality
WHERE subjective_quality_score = 10 AND visit_count > 1;

SELECT * FROM well_pollution
WHERE description IN ('Parasite: Cryptosporidium', 'biologically contaminated') OR
(results = 'Clean' AND biological > 0.01);