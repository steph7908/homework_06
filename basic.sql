--Write a query to select all of the columns in the tutorial.us_housing_units table without using *.

SELECT year, month, month_name, south, west, midwest, northeast
FROM tutorial.us_housing_units

--Write a query to select all of the columns in tutorial.us_housing_units and rename them so that their first letters are capitalized.

SELECT year as "Year", month AS "Month", month_name as "Month Name", 
       south AS "South", west AS "West", midwest AS "Midwest", northeast AS "Northweat"
FROM tutorial.us_housing_units

--Write a query that uses the LIMIT command to restrict the result set to only 15 rows.

SELECT * FROM tutorial.us_housing_units
 LIMIT 15

--Did the West Region ever produce more than 50,000 housing units in one month?
--Yes, 3x

SELECT * FROM tutorial.us_housing_units
WHERE west > 50

--Did the South Region ever produce 20,000 or fewer housing units in one month?
--Yes, 4x

SELECT * FROM tutorial.us_housing_units
WHERE south <= 20

--Write a query that only shows rows for which the month name is February.

SELECT * FROM tutorial.us_housing_units
 WHERE month_name = 'February'

--Write a query that only shows rows for which the month_name starts with the letter "N" or an earlier letter in the alphabet.
--Will pull all Months that fall between A-N in the alphabet

SELECT * FROM tutorial.us_housing_units
 WHERE month_name < 'O'

--Write a query that calculates the sum of all four regions in a separate column.

SELECT *, south + west + midwest + northeast AS "Sum of Regions"
  FROM tutorial.us_housing_units

--Write a query that returns all rows for which more units were produced in the West region than in the Midwest and Northeast combined.

SELECT * FROM tutorial.us_housing_units
WHERE west > (midwest + northeast)

--Write a query that calculates the percentage of all houses completed in the United States represented by each region. 
--Only return results from the year 2000 and later. 
--Take each region and divide by total of all regions then multiply by 100 for %

SELECT year, month, south/(south + west + midwest + northeast)*100 AS "Pct_South",
       west/(south + west + midwest + northeast)*100 AS "Pct_West",
       midwest/(south + west + midwest + northeast)*100 AS "Pct_Midwest",
       northeast/(south + west + midwest + northeast)*100 AS "Pct_Northeast"
FROM tutorial.us_housing_units
WHERE year >= 2000

--Write a query that returns all rows for which Ludacris was a member of the group.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%Ludacris%'

--Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE 'DJ%'

--Write a query that shows all of the entries for Elvis and M.C. 

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Elvis Presley', 'M.C. Hammer', 'Hammer')

--Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1985 AND 1990

--Write a query that shows all of the rows for which song_name is null.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL

--Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10 
   AND "group" ILIKE '%Ludacris%'

--Write a query that surfaces the top-ranked records in 1990, 2000, and 2010.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
   AND year IN (1990, 2000, 2010)

--Write a query that lists all songs from the 1960s with "love" in the title.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1960 AND 1969
   AND song_name ILIKE '%love%'

--Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%bon jovi%')

--Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE (year BETWEEN 1970 AND 1979
    OR year BETWEEN 1990 AND 1999)
   AND song_name ILIKE '%california%'

--Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%Dr. Dre%'
    AND (year < 2001 OR year > 2009)

--Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".

SELECT * FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND song_name NOT ILIKE '%a%'

--Write a query that returns all rows from 2012, ordered by song title from Z to A.

SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year = 2012
 ORDER BY song_name DESC

--Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song.

SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year = 2010
 ORDER BY year_rank, artist

--Write a query that shows all rows for which T-Pain was a group member, 
--ordered by rank on the charts, from lowest to highest rank (from 100 to 1).

SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%T-Pain%'
 ORDER BY year_rank DESC

--Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. 
--Order the results by year and rank, and leave a comment on each line of the WHERE clause to indicate what that line does

SELECT * FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 10 AND 20 --looking for songs ranked between 10 and 20, will include range bounds
      AND year IN (1993, 2003, 2013) --only looking for songs from the 3 years in the list
 ORDER BY year, year_rank