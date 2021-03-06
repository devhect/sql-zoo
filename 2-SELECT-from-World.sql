-- In this tutorial you will use the SELECT command on the table world.

-- 1. Show the name, continent and population of all countries.
SELECT name
    , continent
    , population
FROM world;

-- 2. Show the name for the countries that have a population of at least 200 million.
SELECT name
FROM world
WHERE population >= 200000000;

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name
    , gdp/population as 'GDP per Capita'
FROM world
WHERE population >= 200000000;

-- 4. Show the name and population in millions for the countries of the continent 'South America'.
SELECT name
    , population/1000000 AS 'Population/Million'
FROM world
WHERE continent='South America';

-- 5. Show the name and population for France, Germany, Italy.
SELECT name
    , population
FROM world
WHERE name IN ('France'
    , 'Germany'
    , 'Italy');

-- 6. Show the countries which have a name that includes the word 'United'.
SELECT name
FROM world
WHERE name LIKE '%united%';

/****************************************
 * 7. Show name, population and area of
 * countries that are big by area (more
 * than 3 million sq km) or big by 
 * population (more than 250 million).
 ****************************************/
SELECT name
    , population
    , area
FROM world
WHERE area > 3000000 OR population > 250000000;

-- 8. Show name, population and area of countries that are big by area or big by population but not both.
SELECT name
    , population
    , area
FROM world
WHERE area > 3000000 XOR population > 250000000; -- XOR advised by https://sqlzoo.net/ (MariaDB) but syntax error in Visual Studio Code.

-- 9. For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name
    , ROUND(population/1000000, 2) AS 'Population/Million'
    , ROUND(GDP/1000000000, 2) AS 'GDP/Billion'
FROM world
WHERE continent='south america';

-- 10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name
    , ROUND(GDP/population, -3) as 'GDP per Capita (Rounded)'
FROM world
WHERE GDP > 1000000000000;

-- 11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name
    , capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- 12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name
    , capital
FROM world
WHERE name <> capital
    AND LEFT(name,1) =  LEFT(capital,1);

-- 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';